//
//  RaindropsOnWaterView.swift
//  WillowbrookTest
//
//  Created by Dan Beers on 6/18/25.
//

import SwiftUI

struct RaindropsOnWaterView: View {
    struct Ripple: Identifiable {
        let id = UUID()
        var x: CGFloat
        var y: CGFloat
        var radius: CGFloat
        var opacity: Double
    }
    
    @State private var ripples: [Ripple] = []
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            ForEach(ripples) { ripple in
                Circle()
                    .stroke(lineWidth: 2)
                    .frame(width: ripple.radius, height: ripple.radius)
                    .opacity(ripple.opacity)
                    .foregroundColor(.white)
                    .position(x: ripple.x, y: ripple.y)
            }
        }
        .task {
            while true {
                let newRipple = Ripple(
                    x: CGFloat.random(in: 0...UIScreen.main.bounds.width),
                    y: CGFloat.random(in: 0...UIScreen.main.bounds.height),
                    radius: 0,
                    opacity: 0.4
                )
                
                ripples.append(newRipple)
                
                // Animate ripple growth and fade
                for index in ripples.indices.reversed() {
                    if ripples[index].id == newRipple.id {
                        withAnimation(.easeOut(duration: 0.55)) {
                            ripples[index].radius = 70
                            ripples[index].opacity = 0
                        }
                    }
                }
                
                // Remove finished ripples after animation duration
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.55) {
                    ripples.removeAll { $0.id == newRipple.id }
                }
                
                try? await Task.sleep(nanoseconds: 1_000_000)
            }
            
        }
    }
}

#Preview {
    RaindropsOnWaterView()
}
