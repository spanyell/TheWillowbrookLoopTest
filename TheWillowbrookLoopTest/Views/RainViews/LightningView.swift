//
//  LightningView.swift
//  WillowbrookLoopTest
//
//  Created by Dan Beers on 6/23/25.
//

import SwiftUI

struct LightningView: View {
    @State private var flashOpacity: Double = 0

    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()

            Rectangle()
                .fill(.white)
                .opacity(flashOpacity)
                .blendMode(.plusLighter)
                .ignoresSafeArea()
        }
        .task {
            await startLightningFlashes()
        }
    }

    func startLightningFlashes() async {
        while true {
            try? await Task.sleep(nanoseconds: UInt64(Double.random(in: 0.9...5.0) * 1_000_000_000))
            await MainActor.run {
                withAnimation(.easeIn(duration: 0.05)) { flashOpacity = 1 }
            }
            try? await Task.sleep(nanoseconds: UInt64(Double.random(in: 0.04...0.13) * 1_000_000_000))
            await MainActor.run {
                withAnimation(.easeOut(duration: 0.22)) { flashOpacity = 0 }
            }
        }
    }
}

#Preview {
    LightningView()
}
