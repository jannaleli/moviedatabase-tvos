//
//  PlayerViewModel.swift
//  MovieDatabasetVOS
//
//  Created by Jann Aleli Zaplan on 2022-07-28.
//

import Foundation
import Combine
import AVKit
import XCDYouTubeKit


protocol PlayerViewModelDelegate: AnyObject {
    func didFinishSession(_ sender: PlayerViewModel)
    func didFailWithError(_ sender: PlayerViewModel, error: Error)
}

protocol PlayerViewModel: ViewModel {
    var delegate: PlayerViewModelDelegate? { get set }
    var player: AVPlayer { get }
    func onWillDisappear()
    func play()
    func pause()
}

final class YoutubePlayerViewModel: NSObject, ObservableObject, PlayerViewModel {
    weak var delegate: PlayerViewModelDelegate?
    var player: AVPlayer { queuePlayer }
    // TODO: ToastViewModel and WatchActivityService
    private let queuePlayer: AVQueuePlayer = .init()
    private let client = XCDYouTubeClient()
    // private let toast: ToastViewModel
    private let watchActivityService: WatchActivityService
    private var bag = Set<AnyCancellable>()
    private var operation: XCDYouTubeOperation? { didSet { oldValue?.cancel() } }
    
    private var video: Video? {
        didSet {
            guard let video = video else { return }
            print("this is the key")
            print(video.key)
            load(videoId: video.key)
        }
    }
    private var session: WatchActivitySession? {
        didSet {
            guard let session = session else { return }
            player.playbackCoordinator.delegate = self
            player.playbackCoordinator.coordinateWithSession(session)
        }
    }
    
     init(watchActivityService: WatchActivityService) {
         
        self.watchActivityService = watchActivityService
         
        super.init()
         
        self.setAudioSessionCategory()
        self.play()
        
        watchActivityService
            .enqueuedVideo
            .receiveOnMain()
            .assignNoRetain(to: \.video, on: self)
            .store(in: &bag)

        watchActivityService
            .session
            .receiveOnMain()
            .assignNoRetain(to: \.session, on: self)
            .store(in: &bag)
    }
    
    deinit {
        // deinit
        pause()
        queuePlayer.replaceCurrentItem(with: nil)
    }
    
    // MARK: Internal
    
    func onWillDisappear() {
        pause()
        // watchActivityService.end()
    }
    
    func play() {
        player.play()
    }
    
    func pause() {
        player.pause()
    }
    
    // MARK: Private
    private func load(videoId: String) {
        operation = client.getVideoWithIdentifier(videoId) { [ weak self] video, error in
            guard let self = self else { return }
            print("this is the video stream url")
            print(video?.streamURL)
            if let url = video?.streamURL {
                print("this is the url")
                print(url)
                self.queuePlayer.replaceCurrentItem(with: AVPlayerItem(url: url))
            } else {
                let error = error ?? URLError(.badURL)
                // toast
                 self.delegate?.didFailWithError(self, error: error)
            }
        }
    }
    
    private func setAudioSessionCategory() {
        let session = AVAudioSession.sharedInstance()
        do {
            try session.setCategory(.playback, mode: .moviePlayback)
        } catch {
            print(" Failed ")
        }
    }
}
extension YoutubePlayerViewModel: AVPlayerPlaybackCoordinatorDelegate {
    
    func playbackCoordinator(_ coordinator: AVPlayerPlaybackCoordinator, identifierFor playerItem: AVPlayerItem) -> String {
       // session?.activity.video.key ?? ""
        return ""
    }
}
extension Publisher where Self.Failure == Never {
    public func assignNoRetain<Root>(to keyPath: ReferenceWritableKeyPath<Root, Self.Output>, on object: Root) -> AnyCancellable where Root: AnyObject {
        sink { [weak object] (value) in
            object?[keyPath: keyPath] = value
        }
    }
}
