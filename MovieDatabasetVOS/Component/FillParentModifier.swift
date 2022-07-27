import SwiftUI

struct FillWidthModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.frame(maxWidth: .infinity)
    }
}

struct FillHeightModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.frame(maxHeight: .infinity)
    }
}

struct FillParentModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.frame(maxHeight: .infinity)
    }
}

extension View {
    func fillWidth() -> some View {
        modifier(FillWidthModifier())
    }
    func fillHeight() -> some View {
        modifier(FillHeightModifier())
    }
    func fillParent() -> some View {
        modifier(FillWidthModifier()).modifier(FillHeightModifier())
    }
}
