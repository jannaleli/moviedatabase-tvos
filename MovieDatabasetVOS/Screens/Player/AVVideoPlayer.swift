//
//  AVVideoPlayer.swift
//  MovieDatabasetVOS
//
//  Created by Jann Aleli Zaplan on 2022-07-28.
//

import SwiftUI
import AVKit

struct AVVideoPlayer: UIViewControllerRepresentable {
    var player: AVPlayer
    var showsPlaybackControls: Bool = true
    var allowsPictureInPicturePlayback: Bool = true
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        AVPlayerViewController()
    }
    
    func updateUIViewController(_ vc: AVPlayerViewController, context: Context) {
        vc.player = player
        vc.showsPlaybackControls = showsPlaybackControls
        vc.allowsPictureInPicturePlayback = allowsPictureInPicturePlayback
        
    }
}
