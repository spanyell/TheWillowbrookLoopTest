import SwiftUI

/// A parent view that manages transitions between any number of child views, allowing manual control.
struct ParentTransitionView<Content: View>: View {
    @State private var currentIndex: Int = 0
    @State private var transitionDirection: AnyTransition = .opacity
    @Namespace private var transitionNamespace

    let views: [AnyView]               // All child views
    let transition: (Int, Int) -> AnyTransition // A closure to provide a transition based on from/to indices
    let content: (_ switchTo: @escaping (Int, AnyTransition) -> Void, Int) -> Content // Provides a way for child to trigger parent switches

    init(
        views: [AnyView],
        transition: @escaping (Int, Int) -> AnyTransition = { _,_ in .opacity },
        @ViewBuilder content: @escaping (_ switchTo: @escaping (Int, AnyTransition) -> Void, Int) -> Content
    ) {
        self.views = views
        self.transition = transition
        self.content = content
    }

    var body: some View {
        ZStack {
            views[currentIndex]
                .id(currentIndex)
                .transition(transitionDirection)
                .animation(.easeInOut, value: currentIndex)

            // Overlay content for controls, if desired
            content(switchTo, currentIndex)
        }
    }

    private func switchTo(_ index: Int, _ transition: AnyTransition = .opacity) {
        guard index >= 0 && index < views.count else { return }
        withAnimation {
            transitionDirection = transition
            currentIndex = index
        }
    }
}

// Example usage will be added in ContentView.swift.
