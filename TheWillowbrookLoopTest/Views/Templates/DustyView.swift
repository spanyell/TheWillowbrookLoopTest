//
//  DustyView.swift
//  TheWillowbrookLoopTest
//
//  Created by Dan Beers on 7/23/25.
//


import SwiftUI

struct DustParticle: View
{
    @State private var position: CGPoint
    let size: CGFloat
    let opacity: Double
    let duration: Double
    let containerSize: CGSize
    private let timeOffset: Double

    init(containerSize: CGSize)
    {
        self.containerSize = containerSize
        let x = CGFloat.random(in: 0 ... containerSize.width)
        let y = CGFloat.random(in: 0 ... containerSize.height)
        let initialPosition = CGPoint(x: x, y: y)
        _position = State(initialValue: initialPosition)
        size = CGFloat.random(in: 1 ... 3)
        opacity = Double.random(in: 0.10 ... 0.50)
        duration = Double.random(in: 14 ... 32)
        timeOffset = Double.random(in: 0 ... duration)
    }

    var body: some View
    {
        Circle()
            .fill(Color.gray.opacity(opacity))
            .frame(width: size, height: size)
            .blur(radius: size * 0.45)
            .position(position)
            .onAppear
            {
                let initialTarget = DustParticle.randomNearby(from: position, in: containerSize)
                animateProgress(to: timeOffset / duration, from: position, to: initialTarget)
                DispatchQueue.main.asyncAfter(deadline: .now() + timeOffset)
                {
                    animateNext()
                }
            }
    }

    private func animateNext()
    {
        let next = DustParticle.randomNearby(from: position, in: containerSize)
        withAnimation(.easeInOut(duration: duration))
        {
            position = next
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + duration)
        {
            animateNext()
        }
    }

    private func animateProgress(to progress: Double, from start: CGPoint, to end: CGPoint)
    {
        let dx = end.x - start.x
        let dy = end.y - start.y
        let interpolated = CGPoint(x: start.x + dx * CGFloat(progress), y: start.y + dy * CGFloat(progress))
        position = interpolated
    }

    static func randomNearby(from point: CGPoint, in size: CGSize) -> CGPoint
    {
        let dx = CGFloat.random(in: -500 ... 500)
        let dy = CGFloat.random(in: -500 ... 500)
        var x = point.x + dx
        var y = point.y + dy
        x = max(0, min(size.width, x))
        y = max(0, min(size.height, y))
        return CGPoint(x: x, y: y)
    }
}

struct DustyBackground: View
{
    let count = 40
    var body: some View
    {
        GeometryReader
        { geo in
            let size = geo.size
            ZStack
            {
                // This makes it easier to see, but won't work on ZStacks
                //             Color.black.opacity(1)
                if size.width > 0 && size.height > 0
                {
                    ForEach(0 ..< count, id: \.self)
                    { _ in
                        DustParticle(containerSize: geo.size)
                    }
                }
            }
            .frame(width: geo.size.width, height: geo.size.height)
            .ignoresSafeArea()
        }
    }
}

struct DustyView: View
{
    var body: some View
    {
        DustyBackground()
            .ignoresSafeArea()
    }
}

#Preview
{
    DustyView()
}
