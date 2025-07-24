//
//  StoryView4.swift
//  TheWillowbrookLoopTest
//
//  Created by Dan Beers on 6/27/25.
//

import SwiftUI

struct StoryView4: View
{
    @Binding var choiceMade: Int

    @Namespace private var namespace

    // StoryText States

    // Choices States
    @State private var navigateTo: StoryNavigation? = nil
    @State private var fadeIn = false
    @State private var blurAmount: CGFloat = 20

    var body: some View
    {
        let currentPage: Willowbrook = willowbrookData[choiceMade]

        NavigationStack
        {
            ZStack
            {
                LightningView()
                DoorGroansOpenView()
                VStack
                {
                    // Story Text
                    Text("\(currentPage.id)")
                    Text("\(currentPage.storyText)")
                        .font(Font.custom("Hoefler Text", size: 20))
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.leading)
                        .frame(width: 400)
                        .padding()
                        .opacity(fadeIn ? 1 : 0)
                        

                    // Ellipse glow
                    GlowingEllipseView()
                        .opacity(fadeIn ? 1 : 0)

                    // Choices
                    Button
                    {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2)
                        {
                            navigateTo = .choice1(currentPage.choice1Destination)
                        }
                    } label: {
                        Text("\(currentPage.choice1)")
                            .font(Font.custom("Hoefler Text", size: 20))
                            .foregroundColor(.white)
                            .padding()
                            .opacity(fadeIn ? 1 : 0)
                    }

                    // Optional choices
                    if currentPage.choice2Destination != nil
                    {
                        Button
                        {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2)
                            {
                                navigateTo = .choice2(currentPage.choice2Destination ?? 0)
                            }
                        } label: {
                            Text("\(currentPage.choice2 ?? "")")
                                .font(Font.custom("Hoefler Text", size: 20))
                                .foregroundColor(.white)
                                .padding()
                                .opacity(fadeIn ? 1 : 0)
                        }
                    }
                    if currentPage.choice3Destination != nil
                    {
                        Button
                        {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2)
                            {
                                navigateTo = .choice3(currentPage.choice3Destination ?? 0)
                            }
                        } label: {
                            Text("\(currentPage.choice3 ?? "")")
                                .font(Font.custom("Hoefler Text", size: 20))
                                .foregroundColor(.white)
                                .padding()
                                .opacity(fadeIn ? 1 : 0)
                        }
                    }
                    if currentPage.choice4Destination != nil
                    {
                        Button
                        {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2)
                            {
                                navigateTo = .choice4(currentPage.choice4Destination ?? 0)
                            }
                        } label: {
                            Text("\(currentPage.choice4 ?? "")")
                                .font(Font.custom("Hoefler Text", size: 20))
                                .foregroundColor(.white)
                                .padding()
                                .opacity(fadeIn ? 1 : 0)
                        }
                    }
                }
                .onAppear
                {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 7)
                    {
                        withAnimation(.easeInOut(duration: 2))
                        {
                            fadeIn.toggle()
                        }
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
                    StoryView5(choiceMade: .constant(nav.destinationValue))
                case .choice2:
                    StoryView6(choiceMade: .constant(nav.destinationValue))
                case .choice3:
                    StoryView7(choiceMade: .constant(nav.destinationValue))
                case .choice4:
                    StoryView18(choiceMade: .constant(nav.destinationValue))
                case .restartGame:
                    StoryView0(choiceMade: .constant(0))
                }
            }
        }
    }
}

#Preview
{
    StoryView4(choiceMade: .constant(4))
}
