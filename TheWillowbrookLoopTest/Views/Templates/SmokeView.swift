//
//  SmokeView.swift
//  TheWillowbrookLoopTest
//
//  Created by Dan Beers on 6/27/25.
//

import SwiftUI

struct SmokeBackground: View {
    struct SmokeParticle {
        var baseX: CGFloat
        var baseY: CGFloat
        var speed: Double
        var amplitude: CGFloat
        var phase: Double
        var blur: CGFloat
        var scale: CGFloat
        var opacity: Double
        var direction: CGFloat
    }
    
    let particles: [SmokeParticle] = (0..<14).map { i in
        SmokeParticle(
            baseX: CGFloat.random(in: 0.0...1.0),
            baseY: CGFloat.random(in: 0.0...1.0),
            speed: Double.random(in: 18...28),
            amplitude: CGFloat.random(in: 0.10...0.18),
            phase: Double.random(in: 0...2 * .pi),
            blur: CGFloat.random(in: 40...60),
            scale: CGFloat.random(in: 0.14...0.24),
            opacity: Double.random(in: 0.14...0.21),
            direction: Bool.random() ? 1.0 : -1.0
        )
    }
    
    var body: some View {
        GeometryReader { geometry in
            TimelineView(.animation) { timeline in
                let now = timeline.date.timeIntervalSinceReferenceDate
                Canvas { context, size in
                    for particle in particles {
                        let progress = (sin(now / particle.speed + particle.phase) + 1) / 2.0
                        let x = particle.baseX + particle.amplitude * CGFloat(sin(now / (particle.speed * 0.7) + particle.phase * 1.2))
                        let fraction = now.truncatingRemainder(dividingBy: particle.speed) / particle.speed
                        let fadeIn = min(1, max(0, fraction / 0.15))
                        let fadeOut = 1 - min(1, max(0, (fraction - 0.85) / 0.15))
                        let fade = min(fadeIn, fadeOut)
                        let y = particle.baseY + particle.direction * (0.2 * CGFloat(fraction) + CGFloat(progress) * 0.18)
                        let blobRect = CGRect(
                            x: x * size.width - size.width * particle.scale / 2,
                            y: y * size.height - size.height * particle.scale / 2,
                            width: size.width * particle.scale,
                            height: size.height * particle.scale
                        )
                        let blob = Path(ellipseIn: blobRect)
                        context.opacity = particle.opacity * (0.45 + 0.5 * progress) * fade
                        context.addFilter(.blur(radius: particle.blur))
                        context.drawLayer { ctx in
                            ctx.fill(blob, with: .color(.white))
                        }
                    }
                }
                .ignoresSafeArea()
            }
        }
        .ignoresSafeArea()
    }
}

struct SmokeView: View {
    var body: some View {
        ZStack {
            SmokeBackground()
                .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    SmokeView()
}
