//
//  WatchActivityService.swift
//  MovieDatabasetVOS
//
//  Created by Jann Aleli Zaplan on 2022-07-30.
//

import Foundation
import GroupActivities
import Combine

typealias WatchActivitySession = GroupSession<WatchActivity>

protocol WatchActivityService {
    var enqueuedVideo: AnyPublisher<Video?, Never> { get }
    var session: AnyPublisher<WatchActivitySession?, Never> { get }
    func prepareToPlay(video: Video)
    func end()
}

final class DefaultWatchActivityService: WatchActivityService {
    var enqueuedVideo: AnyPublisher<Video?, Never> {
        $_enqueuedVideo.eraseToAnyPublisher()
    }
    
    var session: AnyPublisher<WatchActivitySession?, Never> {
        $_session.eraseToAnyPublisher()
    }
    @Published private var _enqueuedVideo: Video?
    @Published private var _session: WatchActivitySession?
    private var bag = Set<AnyCancellable>()
    init() {
        Task {
            for await session in WatchActivity.sessions() {
                self._session = session
                
                bag.removeAll()
                
                session.$state.sink { [weak self] state in
                    if case .invalidated = state {
                        self?._session = nil
                        self?._enqueuedVideo = nil
                        self?.bag.removeAll()
                    }
                }
                .store(in: &bag)
                
                session.join()
                
                session.$activity.sink { [weak self] activity in
                    self?._enqueuedVideo = activity.video
                }
                .store(in: &bag)
            }
        }
    }
    
    func prepareToPlay(video: Video) {
        
        if let session = _session {
            // If there's an active session, create an activity for the new selection.
            if session.activity.video != video {
                session.activity = WatchActivity(video: video)
            }
        } else {
            Task {
                let activity = WatchActivity(video: video)
                
                switch await activity.prepareForActivation() {
                case .activationDisabled:
                    // Playback coordination isn't active, or the user prefers to play
                    // the video apart from the group.  Equeue the video for local playback only.
                    _enqueuedVideo = video
                case .activationPreferred:
                    // The user prefers to share this activity with the group.
                    // The app equeues the video for playback when the activity starts.
                    do {
                        _ = try await activity.activate()
                    } catch {
                        print("Unable to activate the activity: \(error)")
                    }
                case .cancelled:
                    // The user cancels the operation. Do nothing.
                    break
                @unknown default: ()
                }
            }
        }
    }
    
    func end() {
        _session?.end()
    }
}
