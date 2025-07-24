//
//  StartView.swift
//  WillowbrookTest
//
//  Created by Dan Beers on 5/3/25.
//

import Combine
import SwiftUI

struct StartView: View
{
    let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    let newGame = Array("NEW GAME")
    let loadGame = Array("LOAD GAME")
    let continueGame = Array("CONTINUE")
    let quitGame = Array("QUIT GAME")

    var soundManager = SoundManager()

    @State private var counter = 0
    @State private var fadeInMenu = false
    @State private var flipAngleNewGame = Double.zero
    @State private var flipAngleLoadGame = Double.zero
    @State private var flipAngleContinueGame = Double.zero
    @State private var flipAngleQuitGame = Double.zero
    @State private var zoomInTitle = false

    var body: some View
    {
        NavigationStack
        {
            ZStack
            {
                RainView()
                WordSmatterView()
                    .onAppear
                    {
//                        soundManager.playAmbiencePlayer1(data: Constants.RainAndThunder!.data)
//                        soundManager.playMusicPlayer(data: Constants.MainViewMuic!.data)
                    }
                VStack
                {
                    Text("THE\n WILLOWBROOK\n LOOP")
                        .multilineTextAlignment(.center)
                        .offset(y: -100)
                        .font(Font.custom("Hoefler Text", size: zoomInTitle ? 40 : 20))
                        .foregroundStyle(.white)
                        .opacity(fadeInMenu ? 1 : 0)
                        .blur(radius: zoomInTitle ? 0 : 10)

                    HStack(spacing: 0)
                    {
                        // New Game
                        ForEach(0 ..< newGame.count, id: \.self)
                        { flip in
                            NavigationLink(destination: OnceUponView())
                            {
                                Text(String(newGame[flip]))
                                    .font(Font.custom("Hoefler Text", size: 20))
                                    .foregroundColor(.white)
                                    .opacity(fadeInMenu ? 1 : 0)

                                    .rotation3DEffect(.degrees(flipAngleNewGame), axis: (x: 0.0, y: 1.0, z: 0.0))
                                    .animation(.default.delay(Double(flip) * 0.1),
                                               value: flipAngleNewGame)
                            }

                            .simultaneousGesture(TapGesture().onEnded
                            {
//                                soundManager.playEffectPlayer1(data: Constants.ThunderCrash!.data)
                            })
                        }
                    }
                    .padding()

                    HStack(spacing: 0)
                    {
                        // Load Game
                        ForEach(0 ..< loadGame.count, id: \.self)
                        { flip in
                            NavigationLink(destination: StoryView(choiceMade: .constant(1)))
                            {
                                Text(String(loadGame[flip]))
                                    .font(Font.custom("Hoefler Text", size: 20))
                                    .foregroundColor(.white)
                                    .opacity(fadeInMenu ? 1 : 0)
                                    .rotation3DEffect(.degrees(flipAngleLoadGame), axis: (x: 0.0, y: 1.0, z: 0.0))
                                    .animation(.default.delay(Double(flip) * 0.1),
                                               value: flipAngleLoadGame)
                            }
                            .simultaneousGesture(TapGesture().onEnded
                            {
//                                soundManager.playEffectPlayer1(data: Constants.ThunderCrash!.data)
                            })
                        }
                    }

                    .padding()

                    HStack(spacing: 0)
                    {
                        // Continue Game
                        ForEach(0 ..< continueGame.count, id: \.self)
                        { flip in
                            NavigationLink(destination: StoryView(choiceMade: .constant(2)))
                            {
                                Text(String(continueGame[flip]))
                                    .font(Font.custom("Hoefler Text", size: 20))
                                    .foregroundColor(.white)
                                    .opacity(fadeInMenu ? 1 : 0)
                                    .rotation3DEffect(.degrees(flipAngleContinueGame), axis: (x: 0.0, y: 1.0, z: 0.0))
                                    .animation(.default.delay(Double(flip) * 0.1),
                                               value: flipAngleContinueGame)

                            }.simultaneousGesture(TapGesture().onEnded
                            {
//                                soundManager.playEffectPlayer1(data: Constants.ThunderCrash!.data)
                            })
                        }
                    }
                    .padding()

                    HStack(spacing: 0)
                    {
                        // Quit Game
                        ForEach(0 ..< quitGame.count, id: \.self)
                        { flip in
                            NavigationLink(destination: StoryView(choiceMade: .constant(3)))
                            {
                                Text(String(quitGame[flip]))
                                    .font(Font.custom("Hoefler Text", size: 20))
                                    .foregroundColor(.white)
                                    .opacity(fadeInMenu ? 1 : 0)
                                    .rotation3DEffect(.degrees(flipAngleQuitGame), axis: (x: 0.0, y: 1.0, z: 0.0))
                                    .animation(.default.delay(Double(flip) * 0.1),
                                               value: flipAngleQuitGame)
                            }.simultaneousGesture(TapGesture().onEnded
                            {
//                                soundManager.playEffectPlayer1(data: Constants.ThunderCrash!.data)
                            })
                        }
                    }
                    .padding()

                    .onReceive(timer)
                    { _ in
                        DispatchQueue.main.async {
                            flipAngleNewGame = (flipAngleNewGame == .zero) ? 360 : .zero
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            flipAngleLoadGame = (flipAngleLoadGame == .zero) ? 360 : .zero
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            flipAngleContinueGame = (flipAngleContinueGame == .zero) ? 360 : .zero
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            flipAngleQuitGame = (flipAngleQuitGame == .zero) ? 360 : .zero
                        }
                    }
                }
            }
        }

        .onAppear
        {
            // 19 is the lucky number on the DispatchQueue. Change it back once figured out.
            DispatchQueue.main.asyncAfter(deadline: .now() + 19)
            {
                withAnimation(Animation.linear(duration: 3))
                {
                    fadeInMenu.toggle()
                    withAnimation(.linear(duration: 10))
                    {
                        zoomInTitle.toggle()
                    }
                }
            }
        }
    }
}

#Preview
{
    StartView()
        .preferredColorScheme(.dark)
}
