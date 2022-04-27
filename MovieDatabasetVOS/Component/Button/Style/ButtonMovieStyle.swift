//
//  ButtonMovieStyle.swift
//  MovieDatabasetVOS
//
//  Created by Jann Aleli Zaplan on 2022-04-26.
//

import Foundation
import SwiftUI

struct ButtonMovieStyle: ButtonStyle {
    @Environment(\.isFocused) private var isFocused: Bool
    @State private var focused: Bool = false
    
    private func makeScale() -> CGFloat {
        if focused {
            return 1.12
        }
        return 1.0
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(makeBackground())
            .scaleEffect(makeScale())
            .onChange(of: isFocused) { newValue in
                withAnimation(.easeInOut(duration: 0.15)) {
                    focused = newValue
                }
            }
    }
    @ViewBuilder
    private func makeBackground() -> some View {
        Rectangle().fill(makeBackgroundColor())
    }

    private func makeBackgroundColor() -> Color {
        if focused {
            return Color.clear
        }
        return Color.clear
    }

}
