//
//  WindowsRainView.swift
//  TheWillowbrookLoopTest
//
//  Created by Dan Beers on 6/26/25.
//

import SwiftUI

struct WindowWithFourPanes: View {
    var body: some View {
        GeometryReader { geometry in
            let w = geometry.size.width
            let h = geometry.size.height
            let lineWidth: CGFloat = 45
            ZStack {
                // Main window frame
                RoundedRectangle(cornerRadius: 0)
                    .stroke(Color.black, lineWidth: lineWidth)
                // Vertical divider
                Rectangle()
                    .fill(Color.black)
                    .frame(width: lineWidth)
                    .frame(maxHeight: .infinity)
                    .position(x: w / 2, y: h / 2)
                // Horizontal divider
                Rectangle()
                    .fill(Color.black)
                    .frame(height: lineWidth)
                    .frame(maxWidth: .infinity)
                    .position(x: w / 2, y: h / 2)                    
            }
        }
    }
}

struct WindowsRainView: View {
    @State private var scale: CGFloat = 0.0
    @State private var showContent = false
    
    var body: some View {
        ZStack {
            LightningView()
            if showContent {
                Image("ScaryTrees")
            }
            RainView()
                .frame(width: 300, height: 700)
            WindowWithFourPanes()
                .frame(width: 500, height: 860)
                .padding()
        }
        .scaleEffect(scale)
        .onAppear {
            withAnimation(.easeInOut(duration: 4)) {
                scale = 1.0
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                showContent = true
            }
        }
    }
}

#Preview {
    WindowsRainView()
}
