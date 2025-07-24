//
//  3dTextTestView.swift
//  TheWillowbrookLoopTest
//
//  Created by Dan Beers on 6/27/25.
//

import SwiftUI
import Combine

struct ThreeDTextTestView: View {
    let text = "HELLO, WORLD!"
    @State private var currentAnimatingIndex: Int? = nil
    @State private var isAnimating = false
    @State private var angles: [Double] = []
    
    let amplitude = 80.0

    var body: some View {
        HStack(spacing: 0) {
            ForEach(Array(text.enumerated()), id: \.offset) { index, letter in
                Text(String(letter))
                    .rotation3DEffect(
                        .degrees(angles.count > index ? angles[index] : 0),
                        axis: (x: 0, y: 20, z: 0)
                    )
                    .font(Font.custom("Hoefler Text", size: 50))
            }
        }
        .onAppear {
            angles = Array(repeating: 0, count: text.count)
            startWave()
        }
        .preferredColorScheme(.dark)
    }
    
    func startWave() {
        guard !isAnimating else { return }
        isAnimating = true
        animateLetter(at: 0)
    }
    
    func animateLetter(at index: Int) {
        guard index < text.count else {
            isAnimating = false
            currentAnimatingIndex = nil
            return
        }
        
        currentAnimatingIndex = index
        
        withAnimation(.easeInOut(duration: 0.1)) {
            angles[index] = amplitude
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            withAnimation(.easeOut(duration: 0.4)) {
                angles[index] = 0
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                animateLetter(at: index + 1)
            }
        }
    }
}

#Preview {
    ThreeDTextTestView()
}
