//
//  DancersViewProtocols.swift
//  TheWillowbrookLoopTest
//
//  Created by Dan Beers on 6/29/25.
//

import SwiftUI
import Combine

protocol DancersPatternConfigurable {
    var dancingPattern: Double { get set }
}

struct DancersViewProtocols: View, DancersPatternConfigurable {
    @State private var currentImageIndex = 0
    var dancingPattern: Double
    private let images = ["DancingCouple1", "DancingCouple2", "DancingCouple3", "DancingCouple4", "DancingCouple5", "DancingCouple6", "DancingCouple7", "DancingCouple8"]

    init(dancingPattern: Double = 1) {
        self.dancingPattern = dancingPattern
    }

    var body: some View {
        ZStack {
            LightningView()
            Image(images[currentImageIndex])
                .resizable()
                .frame(width: 400, height: 400)
        }
        .onReceive(Timer.publish(every: dancingPattern, on: .main, in: .common).autoconnect()) { _ in
            currentImageIndex = (currentImageIndex + 1) % images.count
        }
    }
}

#Preview {
    DancersViewProtocols(dancingPattern: 0.5)
}
