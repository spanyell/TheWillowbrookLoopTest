//
//  PianoView.swift
//  TheWillowbrookLoopTest
//
//  Created by Dan Beers on 6/27/25.
//

import SwiftUI

struct PianoView: View {
    var body: some View {
        ZStack {
            LightningView()
            SmokeView()
            Image("GrandPiano")
                .resizable()
                .preferredColorScheme(.dark)
        }
        
    }
}

#Preview {
    PianoView()
}
