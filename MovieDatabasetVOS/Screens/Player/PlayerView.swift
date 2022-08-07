//
//  PlayerView.swift
//  MovieDatabasetVOS
//
//  Created by Jann Aleli Zaplan on 2022-07-28.
//

import SwiftUI
import AVKit

struct PlayerView: View {
    // Bakit di pwede observed
    var viewModel: PlayerViewModel
    
    var body: some View {
        AVVideoPlayer(player: viewModel.player).ignoresSafeArea()
    }
}

