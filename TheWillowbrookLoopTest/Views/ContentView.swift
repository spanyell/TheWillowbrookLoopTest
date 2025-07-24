//
//  ContentView.swift
//  TheWillowbrookLoopTest
//
//  Created by Dan Beers on 6/26/25.
//

import SwiftUI

struct ContentView: View {
    @State private var currentIndex: Int = 0

    var body: some View {
        let views: [AnyView] = [
            AnyView(StoryView0(choiceMade: .constant(0))),
            AnyView(StartView())
        ]
        ParentTransitionView(
            views: views,
            transition: { from, to in
                from < to ? .move(edge: .trailing) : .move(edge: .leading)
            }
        ) { switchTo, currentIndex in
            VStack {
                HStack {
                    Button("Go to StartView") {
                        switchTo(1, .move(edge: .leading))
                    }
                    .padding()
                    .foregroundColor(.white)
                    .font(Font.custom("Hoefler Text", size: 10))
                    
                    Button("Restart Game") {
                        switchTo(0, .move(edge: .trailing))
                    }
                    .padding()
                    .foregroundColor(.white)
                    .font(Font.custom("Hoefler Text", size: 10))
                }
                Spacer()
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
