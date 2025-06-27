//
//  ContentView.swift
//  TheWillowbrookLoopTest
//
//  Created by Dan Beers on 6/26/25.
//

import SwiftUI

struct ContentView: View
{
    var body: some View
    {
        ZStack
        {
//            StartView()
           StoryView0(choiceMade: .constant(0))
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
