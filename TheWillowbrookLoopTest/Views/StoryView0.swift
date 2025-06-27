//
//  StoryView0.swift
//  WillowbrookLoopTest
//
//  Created by Dan Beers on 6/23/25.
//

import SwiftUI

struct StoryView0: View
{
    @Binding var choiceMade: Int

    @Namespace private var namespace

    // Choices States
    @State private var navigateTo: StoryNavigation? = nil

    // Animation States
    @State private var offsetStoryText = false
    @State private var offsetEllipse = false
    @State private var offsetChoices = false
    @State private var fadeIn = false
    @State private var blurAmount: CGFloat = 20
    @State private var storyTextRotation: Double = 0

    var body: some View
    {
        let currentPage: Willowbrook = willowbrookData[choiceMade]

        NavigationStack
        {
            ZStack
            {
                LightningView()
                VStack
                {
                    // Story Text
                    Text("\(currentPage.storyText)")
                        .font(Font.custom("Hoefler Text", size: 20))
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.leading)
                        .frame(width: 400)
                        .padding()
                        .offset(x: offsetStoryText ? -1000 : 0)
                        .rotationEffect(.degrees(storyTextRotation))
                        .opacity(fadeIn ? 1 : 0)
                        .blur(radius: blurAmount)

                    // Ellipse glow
                    GlowingEllipseView()
                        .offset(x: offsetEllipse ? -1000 : 0)
                        .opacity(fadeIn ? 1 : 0)

                    // Choices
                    Button
                    {
                        handleChoiceSelectionOpenCurtains(destination: .choice1(currentPage.choice1Destination), preAnimationDelay: 0.5)
                    } label: {
                        Text("\(currentPage.choice1)")
                            .font(Font.custom("Hoefler Text", size: 20))
                            .foregroundColor(.white)
                            .padding()
                            .offset(x: offsetChoices ? 1000 : 0)
                            .opacity(fadeIn ? 1 : 0)
                            .blur(radius: blurAmount)
                    }

                    // Optional choices
                    if currentPage.choice2Destination != nil
                    {
                        Button
                        {
                            withAnimation(.easeInOut(duration: 2))
                            {
                                fadeIn = false
                                blurAmount = 100
                                storyTextRotation = -360
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2)
                            {
                                navigateTo = .choice2(currentPage.choice2Destination ?? 0)
                            }
                        } label: {
                            Text("\(currentPage.choice2 ?? "")")
                                .font(Font.custom("Hoefler Text", size: 20))
                                .foregroundColor(.white)
                                .padding()
                                .offset(x: offsetChoices ? 1000 : 0)
                                .opacity(fadeIn ? 1 : 0)
                                .blur(radius: blurAmount)
                        }
                    }
                    if currentPage.choice3Destination != nil
                    {
                        Button
                        {
                            navigateTo = .choice3(currentPage.choice3Destination ?? 0)
                        } label: {
                            Text("\(currentPage.choice3 ?? "")")
                                .font(Font.custom("Hoefler Text", size: 20))
                                .foregroundColor(.white)
                                .padding()
                                .offset(x: offsetChoices ? 1000 : 0)
                                .opacity(fadeIn ? 1 : 0)
                                .blur(radius: blurAmount)
                        }
                    }
                    if currentPage.choice4Destination != nil
                    {
                        Button
                        {
                            navigateTo = .choice4(currentPage.choice4Destination ?? 0)
                        } label: {
                            Text("\(currentPage.choice4 ?? "")")
                                .font(Font.custom("Hoefler Text", size: 20))
                                .foregroundColor(.white)
                                .padding()
                                .offset(x: offsetChoices ? 1000 : 0)
                                .opacity(fadeIn ? 1 : 0)
                                .blur(radius: blurAmount)
                        }
                    }
                }
                .onAppear
                {
                    withAnimation(.easeInOut(duration: 5))
                    {
                        fadeIn = true
                        blurAmount = 0
                        storyTextRotation = 360
                    }
                }
                .preferredColorScheme(.dark)
                .navigationBarBackButtonHidden(true)
                .ignoresSafeArea()
                .navigationTransition(.zoom(sourceID: "zoom", in: namespace))
            }

            // This is where the view changes
            .navigationDestination(item: $navigateTo)
            { nav in
                switch nav
                {
                case .choice1:
                    StoryView3(choiceMade: .constant(nav.destinationValue))
                case .choice2:
                    StoryView1(choiceMade: .constant(nav.destinationValue))
                case .choice3:
                    StoryView2(choiceMade: .constant(nav.destinationValue))
                case .choice4:
                    StoryViewStripped(choiceMade: .constant(nav.destinationValue))
                }
            }
        }
    }

    private func handleChoiceSelectionOpenCurtains(destination: StoryNavigation, preAnimationDelay: Double = 0.0)
    {
        DispatchQueue.main.asyncAfter(deadline: .now() + preAnimationDelay)
        {
            withAnimation(.easeInOut(duration: 1))
            {
                offsetStoryText.toggle()
                offsetEllipse.toggle()
                offsetChoices.toggle()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1)
            {
                navigateTo = destination
            }
        }
    }
}

#Preview
{
    StoryView0(choiceMade: .constant(0))
}
