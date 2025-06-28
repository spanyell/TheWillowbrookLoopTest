//
//  StoryView.swift
//  WillowbrookLoopTest
//
//  Created by Dan Beers on 6/21/25.
//

import SwiftUI

struct StoryView: View

{
    @Binding var choiceMade: Int

    @Namespace private var namespace

    // StoryText States
    @State private var opacityStoryText = false
    @State private var blurStoryText = false
    @State private var spinStoryText = false
    @State private var shadowStoryText = false

    // Choices States
    @State private var offsetChoices = false
    @State private var blurChoices = false
    @State private var opacityChoices = false
    @State private var navigateTo: StoryNavigation? = nil

    var body: some View
    {
        let currentPage: Willowbrook = willowbrookData[choiceMade]

        NavigationStack
        {
            ZStack
            {
                VStack
                {
                    // Story Text
                    Text("\(currentPage.storyText)")
                        .font(Font.custom("Hoefler Text", size: 20))
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.leading)
                        .frame(width: 400)
                        .padding()
                        .blur(radius: blurStoryText ? 0 : 20)
//                        .rotationEffect(.degrees(spinStoryText ? 0 : 720))

                    // Ellipse glow
                    Ellipse()
                        .fill(.white)
                        .frame(width: 375, height: 10)
                        .padding()
                        .opacity(opacityStoryText ? 1 : 0)
                        .shadow(radius: shadowStoryText ? 5 : 10)

                        // Not 100% sure the colors even matter.
                        .addGlowEffect(color1: .green, color2: .yellow, color3: .blue)
                        .onAppear
                        {
                            withAnimation(.linear(duration: 15))
                            {
                                opacityStoryText.toggle()
                            }
                            withAnimation(.linear(duration: 15))
                            {
                                shadowStoryText.toggle()
                            }
                        }

                    // Choices
                    Button
                    {
                        withAnimation(.easeInOut(duration: 2))
                        {
                            offsetChoices.toggle()
                            opacityChoices.toggle()
                            blurChoices.toggle()
                            blurStoryText.toggle()
                            shadowStoryText.toggle()
                            opacityStoryText.toggle()
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2)
                        {
                            navigateTo = .choice1(currentPage.choice1Destination)
                        }
                    } label: {
                        Text("\(currentPage.choice1)")
                            .font(Font.custom("Hoefler Text", size: 20))
                            .foregroundColor(.white)
                            .padding()
                            .offset(y: offsetChoices ? 0 : 300)
                            .opacity(opacityChoices ? 1 : 0)
                            .blur(radius: blurChoices ? 0 : 10)
                            .navigationTransition(.zoom(sourceID: "zoom", in: namespace))
                    }

                    // Optional choices
                    if currentPage.choice2Destination != nil
                    {
                        Button
                        {
                            withAnimation(.easeInOut(duration: 2))
                            {
                                offsetChoices.toggle()
                                opacityChoices.toggle()
                                blurChoices.toggle()
                                blurStoryText.toggle()
                                opacityStoryText.toggle()
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
                                .offset(y: offsetChoices ? 0 : 300)
                                .opacity(opacityChoices ? 1 : 0)
                                .blur(radius: blurChoices ? 0 : 10)
                                .navigationTransition(.zoom(sourceID: "zoom", in: namespace))
                        }
                    }
                    if currentPage.choice3Destination != nil
                    {
                        Button
                        {
                            withAnimation(.easeInOut(duration: 2))
                            {
                                offsetChoices.toggle()
                                opacityChoices.toggle()
                                blurChoices.toggle()
                                blurStoryText.toggle()
                                opacityStoryText.toggle()
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2)
                            {
                                navigateTo = .choice3(currentPage.choice3Destination ?? 0)
                            }
                        } label: {
                            Text("\(currentPage.choice3 ?? "")")
                                .font(Font.custom("Hoefler Text", size: 20))
                                .foregroundColor(.white)
                                .padding()
                                .offset(y: offsetChoices ? 0 : 300)
                                .opacity(opacityChoices ? 1 : 0)
                                .blur(radius: blurChoices ? 0 : 10)
                                .navigationTransition(.zoom(sourceID: "zoom", in: namespace))
                        }
                    }
                    if currentPage.choice4Destination != nil
                    {
                        Button
                        {
                            withAnimation(.easeInOut(duration: 2))
                            {
                                offsetChoices.toggle()
                                opacityChoices.toggle()
                                blurChoices.toggle()
                                blurStoryText.toggle()
                                opacityStoryText.toggle()
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2)
                            {
                                navigateTo = .choice4(currentPage.choice4Destination ?? 0)
                            }
                        } label: {
                            Text("\(currentPage.choice4 ?? "")")
                                .font(Font.custom("Hoefler Text", size: 20))
                                .foregroundColor(.white)
                                .padding()
                                .offset(y: offsetChoices ? 0 : 300)
                                .opacity(opacityChoices ? 1 : 0)
                                .blur(radius: blurChoices ? 0 : 10)
                                .navigationTransition(.zoom(sourceID: "zoom", in: namespace))
                        }
                    }
                }
                .preferredColorScheme(.dark)
                .navigationBarBackButtonHidden(true)
                .ignoresSafeArea()
                .onAppear
                {
                    withAnimation(.easeInOut(duration: 4))
                    {
                        blurStoryText.toggle()
                        spinStoryText.toggle()
                        offsetChoices.toggle()
                        opacityChoices.toggle()
                        blurChoices.toggle()
                    }
                }
            }
            // This is where the view changes
            .navigationDestination(item: $navigateTo)
            { nav in
                switch nav
                {
                case .choice1:
                    StoryViewStripped(choiceMade: .constant(nav.destinationValue))
                case .choice2:
                    StoryViewStripped(choiceMade: .constant(nav.destinationValue))
                case .choice3:
                    StoryViewStripped(choiceMade: .constant(nav.destinationValue))
                case .choice4:
                    StoryViewStripped(choiceMade: .constant(nav.destinationValue))
                case .restartGame:
                    StoryView0(choiceMade: .constant(0))
                }
            }
        }
    }
}

#Preview
{
    StoryView(choiceMade: .constant(0))
}
