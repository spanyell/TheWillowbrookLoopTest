//
//  DancersView.swift
//  TheWillowbrookLoopTest
//
//  Created by Dan Beers on 6/27/25.
//

import SwiftUI
import Combine

struct DancersView: View {
    @State private var currentImageIndex = 0
    private let images = ["DancingCouple1", "DancingCouple2", "DancingCouple3", "DancingCouple4", "DancingCouple5", "DancingCouple6", "DancingCouple7", "DancingCouple8"]
    
    var body: some View {
        ZStack {
            LightningView()
            Image(images[currentImageIndex])
                .resizable()
                .frame(width: 400, height: 400)
                
            Text("Hello, World!")
                .preferredColorScheme(.dark)
        }
        .onReceive(Timer.publish(every: 1, on: .main, in: .common).autoconnect()) { _ in
            currentImageIndex = (currentImageIndex + 1) % images.count
        }
    }
}

#Preview {
    DancersView()
}
