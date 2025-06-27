//
//  RainView.swift
//  WillowbrookLoopTest
//
//  Created by Dan Beers on 6/21/25.
//

import SwiftUI

struct RainView: View {
    private let raindropCount = 80
    private let rainColor = Color.gray.opacity(0.3)
    private let raindropWidth: CGFloat = 2
    private let raindropMinLength: CGFloat = 16
    private let raindropMaxLength: CGFloat = 36
    private let animationDurationMin: Double = 1.2
    private let animationDurationMax: Double = 2.0
    
    struct Raindrop: Identifiable {
        let id = UUID()
        let xPosition: CGFloat
        let length: CGFloat
        let delay: Double
        let duration: Double
    }
    
    @State private var raindrops: [Raindrop] = []
    @State private var animate = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Rain background
                ZStack {
                    ForEach(raindrops) { drop in
                        Rectangle()
                            .fill(rainColor)
                            .frame(width: raindropWidth, height: drop.length)
                            .position(x: drop.xPosition * geometry.size.width, y: animate ? geometry.size.height + drop.length : -drop.length)
                            .animation(
                                .linear(duration: drop.duration)
                                    .repeatForever(autoreverses: false)
                                    .delay(drop.delay),
                                value: animate
                            )
                    }
                }
                .onAppear {
                    if raindrops.isEmpty {
                        raindrops = (0..<raindropCount).map { _ in
                            Raindrop(
                                xPosition: .random(in: 0...1),
                                length: .random(in: raindropMinLength...raindropMaxLength),
                                delay: .random(in: 0...animationDurationMax),
                                duration: .random(in: animationDurationMin...animationDurationMax)
                            )
                        }
                        // Trigger the animation
                        DispatchQueue.main.async {
                            animate = true
                        }
                    }
                }
                
            }
            .ignoresSafeArea()
            .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    RainView()
}
