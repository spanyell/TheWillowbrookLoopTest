//
//  FogEffectView.swift
//  WillowbrookTest
//
//  Created by Dan Beers on 6/18/25.
//

import SwiftUI

struct FogEffectView: View {
    private struct FogEllipse: Identifiable {
        let id = UUID()
        var x: CGFloat
        var y: CGFloat
        let baseX: CGFloat
        let baseY: CGFloat
        let width: CGFloat
        let height: CGFloat
        let blur: CGFloat
        let opacity: Double
        var dx: CGFloat
        var dy: CGFloat
        let speed: Double
    }
    
    @State private var ellipses: [FogEllipse] = {
        var array: [FogEllipse] = []
        for _ in 0..<40 {
            let width = CGFloat.random(in: 180...350)
            let height = CGFloat.random(in: 80...180)
            let blur = CGFloat.random(in: 18...36)
            let opacity = 0.25 + Double.random(in: 0...0.15)
            let baseX = CGFloat.random(in: -170...170)
            let baseY = CGFloat.random(in: -350...350)
            let dx = CGFloat.random(in: -1...1)
            let dy = CGFloat.random(in: -1...1)
            let speed = Double.random(in: 0.3...0.9)
            array.append(FogEllipse(x: baseX, y: baseY, baseX: baseX, baseY: baseY, width: width, height: height, blur: blur, opacity: opacity, dx: dx, dy: dy, speed: speed))
        }
        return array
    }()
    
    @State private var textScale: CGFloat = 1.0
    
    private let xBounds: ClosedRange<CGFloat> = -300...300
    private let yBounds: ClosedRange<CGFloat> = -400...400
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            ForEach(ellipses) { ellipse in
                Ellipse()
                    .fill(Color.white.opacity(ellipse.opacity))
                    .frame(width: ellipse.width, height: ellipse.height)
                    .blur(radius: ellipse.blur)
                    .offset(x: ellipse.x, y: ellipse.y)
            }
            Text("The fog continues...")
                .font(Font.custom("Hoefler Text", size: 20))
                .foregroundColor(.black)
                .scaleEffect(textScale)
                .opacity(textScale == 1.0 ? 1.0 : Double(0.85 - min(max((textScale-2.0)/1.5, 0), 0.85)))
                .shadow(color: .white.opacity(0.15), radius: 10, x: 0, y: 0)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
        .ignoresSafeArea()
        .onAppear {
            Task {
                try? await Task.sleep(nanoseconds: 2_000_000_000)
                while textScale < 10.0 {
                    await MainActor.run {
                        textScale += 0.01
                    }
                    try? await Task.sleep(nanoseconds: 16_000_000)
                }
            }
            Task {
                while true {
                    await MainActor.run {
                        for index in ellipses.indices {
                            var ellipse = ellipses[index]
                            ellipse.x += ellipse.dx * CGFloat(ellipse.speed)
                            ellipse.y += ellipse.dy * CGFloat(ellipse.speed)
                            
                            // Reverse direction if out of bounds on x
                            if ellipse.x < xBounds.lowerBound || ellipse.x > xBounds.upperBound {
                                ellipse.dx = -ellipse.dx
                                ellipse.x = ellipse.x.clamped(to: xBounds)
                            }
                            
                            // Reverse direction if out of bounds on y
                            if ellipse.y < yBounds.lowerBound || ellipse.y > yBounds.upperBound {
                                ellipse.dy = -ellipse.dy
                                ellipse.y = ellipse.y.clamped(to: yBounds)
                            }
                            
                            ellipses[index] = ellipse
                        }
                    }
                    try? await Task.sleep(nanoseconds: 33_000_000) // ~30 FPS
                }
            }
        }
    }
}

extension Comparable {
    func clamped(to limits: ClosedRange<Self>) -> Self {
        min(max(self, limits.lowerBound), limits.upperBound)
    }
}

#Preview {
    FogEffectView()
        .preferredColorScheme(.dark)
}
