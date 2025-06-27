//
//  GlowingEllipseView.swift
//  WillowbrookLoopTest
//
//  Created by Dan Beers on 6/23/25.
//

import SwiftUI

struct GlowingEllipseView: View
{
    @State private var ellipseGlow = false

    var body: some View
    {
        Ellipse()
            .fill(.white)
            .frame(width: 375, height: 10)
            .padding()
            .shadow(color: .white.opacity(ellipseGlow ? 0.9 : 0.3), radius: ellipseGlow ? 32 : 8)
            .blur(radius: ellipseGlow ? 4 : 3)
            .onAppear
            {
                withAnimation(.easeInOut(duration: 5).repeatForever(autoreverses: true))
                {
                    ellipseGlow.toggle()
                }
            }
            .preferredColorScheme(.dark)
    }
}

#Preview
{
    GlowingEllipseView()
}
