//
//  WordSmatterView.swift
//  WordSmatter
//
//  Created by Dan Beers on 11/27/24.
//

import SwiftUI

struct WordSmatterView: View
{
    @State private var leafLetterW = false
    @State private var leafLetterO = false
    @State private var leafLetterR = false
    @State private var leafLetterD = false
    @State private var leafLetterS = false
    @State private var leafLetterM = false
    @State private var leafLetterA = false
    @State private var leafLetterT = false
    @State private var leafLetterT1 = false
    @State private var leafLetterE = false
    @State private var leafLetterR1 = false
    @State private var specialSMove = false
    @State private var specialSSpin = false
    @State private var wordSmatterOpacity = false
    @State private var presentsOpacity = false

    var body: some View
    {
        ZStack
        {
            VStack
            {
                HStack
                {
                    Text("W")
                        .rotationEffect(leafLetterW ? .degrees(720) : .degrees(0))
                        .rotation3DEffect(
                            .degrees(leafLetterW ? 0 : 560), axis: (x: leafLetterW ? 0.0 : 775, y: leafLetterW ? 0 : 750, z: leafLetterW ? 0 : 360))
                        .offset(x: leafLetterW ? 0 : 600, y: leafLetterW ? 0 : 600)
                        .onAppear
                        {
                            withAnimation(.easeInOut(duration: 5.0))
                            {
                                leafLetterW.toggle()
                            }
                            //             SoundManager.instance.playSound(sound: .RainAndThunder)
                        }

                    Text("O")
                        .rotationEffect(leafLetterO ? .degrees(720) : .degrees(0))
                        .rotation3DEffect(
                            .degrees(leafLetterO ? 0 : 360), axis: (x: leafLetterO ? 0.0 : 275, y: leafLetterO ? 0 : 250, z: leafLetterO ? 0 : -720))
                        .offset(x: leafLetterO ? 0 : -600, y: leafLetterO ? 0 : -600)
                        .onAppear
                        {
                            withAnimation(.easeInOut(duration: 5.0))
                            {
                                leafLetterO.toggle()
                            }
                        }
                    Text("R")
                        .rotationEffect(leafLetterR ? .degrees(720) : .degrees(0))
                        .rotation3DEffect(
                            .degrees(leafLetterR ? 0 : -360), axis: (x: leafLetterR ? 0.0 : -275, y: leafLetterR ? 0 : 250, z: leafLetterR ? 0 : 720))
                        .offset(x: leafLetterR ? 0 : -500, y: leafLetterR ? 0 : 500)
                        .onAppear
                        {
                            withAnimation(.easeInOut(duration: 5.0))
                            {
                                leafLetterR.toggle()
                            }
                        }
                    Text("D")
                        .rotationEffect(leafLetterD ? .degrees(720) : .degrees(0))
                        .rotation3DEffect(
                            .degrees(leafLetterD ? 0 : -360), axis: (x: leafLetterD ? 0.0 : -275, y: leafLetterD ? 0 : 250, z: leafLetterD ? 0 : 720))
                        .offset(x: leafLetterD ? 0 : -500, y: leafLetterD ? 0 : 200)
                        .onAppear
                        {
                            withAnimation(.easeInOut(duration: 5.0))
                            {
                                leafLetterD.toggle()
                            }
                        }

                    Text("       ")

                    Text("S")
                        .rotationEffect(leafLetterS ? .degrees(0) : .degrees(720))
                        .rotation3DEffect(
                            .degrees(leafLetterS ? 0 : -360), axis: (x: leafLetterS ? 0.0 : -275, y: leafLetterS ? 0 : 250, z: leafLetterS ? 0 : 720))
                        // ALWAYS OFFSET BEFORE ROTATING
                        .offset(x: leafLetterS ? 0 : -700, y: leafLetterS ? 0 : -400)
                        .rotationEffect(specialSSpin ? .degrees(-360) : .degrees(0))
                        .offset(x: specialSMove ? -42 : -0)

                        .onAppear
                        {
                            withAnimation(.easeInOut(duration: 5.0))
                            {
                                leafLetterS.toggle()
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 6)
                            {
                                withAnimation(.easeIn(duration: 3))
                                {
                                    specialSMove.toggle()
                                    specialSSpin.toggle()
                                }
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 12)
                            {
                                withAnimation(.easeIn(duration: 3))
                                {
                                    specialSMove.toggle()
                                    specialSSpin.toggle()
                                }
                            }
                        }

                    Text("M")
                        .rotationEffect(leafLetterM ? .degrees(720) : .degrees(0))
                        .rotation3DEffect(
                            .degrees(leafLetterM ? 0 : 360), axis: (x: leafLetterM ? 0.0 : 275, y: leafLetterM ? 0 : 250, z: leafLetterM ? 0 : 720))
                        .offset(x: leafLetterM ? 0 : 200, y: leafLetterM ? 0 : 200)
                        .onAppear
                        {
                            withAnimation(.easeInOut(duration: 5.0))
                            {
                                leafLetterM.toggle()
                            }
                        }
                    Text("A")
                        .rotationEffect(leafLetterA ? .degrees(720) : .degrees(0))
                        .rotation3DEffect(
                            .degrees(leafLetterA ? 0 : -360), axis: (x: leafLetterA ? 0.0 : -275, y: leafLetterA ? 0 : 250, z: leafLetterA ? 0 : 720))
                        .offset(x: leafLetterA ? 0 : 600, y: leafLetterA ? 0 : -800)
                        .onAppear
                        {
                            withAnimation(.easeInOut(duration: 5.0))
                            {
                                leafLetterA.toggle()
                            }
                        }
                    Text("T")
                        .rotationEffect(leafLetterT ? .degrees(-720) : .degrees(0))
                        .rotation3DEffect(
                            .degrees(leafLetterT ? 0 : -360), axis: (x: leafLetterT ? 0.0 : -275, y: leafLetterT ? 0 : 250, z: leafLetterT ? 0 : 720))
                        .offset(x: leafLetterT ? 0 : 500, y: leafLetterT ? 0 : 500)
                        .onAppear
                        {
                            withAnimation(.easeInOut(duration: 5.0))
                            {
                                leafLetterT.toggle()
                            }
                        }
                    Text("T")
                        .rotationEffect(leafLetterT1 ? .degrees(-720) : .degrees(0))
                        .rotation3DEffect(
                            .degrees(leafLetterT1 ? 0 : -540), axis: (x: leafLetterT1 ? 0.0 : -275, y: leafLetterT1 ? 0 : 250, z: leafLetterT1 ? 0 : 720))
                        .offset(x: leafLetterT1 ? 0 : -500, y: leafLetterT1 ? 0 : -500)
                        .onAppear
                        {
                            withAnimation(.easeInOut(duration: 5.0))
                            {
                                leafLetterT1.toggle()
                            }
                        }
                    Text("E")
                        .rotationEffect(leafLetterE ? .degrees(720) : .degrees(0))
                        .rotation3DEffect(
                            .degrees(leafLetterE ? 0 : -360), axis: (x: leafLetterE ? 0.0 : -275, y: leafLetterE ? 0 : 250, z: leafLetterE ? 0 : 720))
                        .offset(x: leafLetterE ? 0 : -600, y: leafLetterE ? 0 : 900)
                        .onAppear
                        {
                            withAnimation(.easeInOut(duration: 5.0))
                            {
                                leafLetterE.toggle()
                            }
                        }
                    Text("R")
                        .rotationEffect(leafLetterR1 ? .degrees(-720) : .degrees(0))
                        .rotation3DEffect(
                            .degrees(leafLetterR1 ? 0 : -360), axis: (x: leafLetterR1 ? 0.0 : -275, y: leafLetterR1 ? 0 : -250, z: leafLetterR1 ? 0 : 720))
                        .offset(x: leafLetterR1 ? 0 : -400, y: leafLetterR1 ? 0 : -400)
                        .onAppear
                        {
                            withAnimation(.easeInOut(duration: 5.0))
                            {
                                leafLetterR1.toggle()
                            }
                        }
                }
                .font(Font.custom("Hoefler Text", size: 20))
                .foregroundStyle(.white)
                .opacity(wordSmatterOpacity ? 0 : 1)
                .onAppear
                {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 16)
                    {
                        withAnimation(Animation
                            .easeInOut(duration: 3))
                        {
                            wordSmatterOpacity.toggle()
                        }
                    }
                }
            }
            Text("Presents")
                .font(Font.custom("Hoefler Text", size: 20))
                .foregroundStyle(.white)
                .offset(y: 30)
                .opacity(presentsOpacity ? 1 : 0)
                .onAppear
                {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 15)
                    {
                        withAnimation(Animation.easeInOut(duration: 2))
                        {
                            presentsOpacity.toggle()
                        }
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 16)
                    {
                        withAnimation(Animation.easeInOut(duration: 3))
                        {
                            presentsOpacity.toggle()
                        }
                    }
                }
        }
    }
}

#Preview
{
    WordSmatterView()
        .preferredColorScheme(.dark)
}
