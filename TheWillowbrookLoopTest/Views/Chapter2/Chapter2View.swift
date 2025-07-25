//
//  Chapter2View.swift
//  TheWillowbrookLoopTest
//
//  Created by Dan Beers on 6/28/25.
//

import SwiftUI

struct Chapter2View: View {
    @Binding var choiceMade: Int

    @Namespace private var namespace

    // StoryText States

    // Choices States
    @State private var navigateTo: StoryNavigation? = nil
    

    var body: some View
    {
        let currentPage: Willowbrook = willowbrookData[choiceMade]

        NavigationStack
        {
            ZStack
            {
                DancersViewProtocols(dancingPattern: 0.4)
                VStack
                {
                    // Temporary Restart Game button
                    Button(action: {
                        navigateTo = .restartGame(0)
                    })
                    {
                        Text("Restart Game")
                            .font(.caption)
                            .foregroundColor(.white)
                            .padding(8)
                            .background(Color.black.opacity(0.7))
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                    .padding()
                    
                    // Story Text
                    Text("\(currentPage.storyText)")
                        .font(Font.custom("Hoefler Text", size: 20))
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.leading)
                        .frame(width: 400)
                        .padding()

                    // Ellipse glow
                    GlowingEllipseView()
                    
                    // Choices with a 2 second delay between button press and view change
                    Button {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            navigateTo = .choice1(currentPage.choice1Destination)
                        }
                    } label: {
                        Text("\(currentPage.choice1)")
                            .font(Font.custom("Hoefler Text", size: 20))
                            .foregroundColor(.white)
                            .padding()
                    }

                    // Optional choices
                    if currentPage.choice2Destination != nil
                    {
                        Button {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                navigateTo = .choice2(currentPage.choice2Destination ?? 0)
                            }
                        } label: {
                            Text("\(currentPage.choice2 ?? "")")
                                .font(Font.custom("Hoefler Text", size: 20))
                                .foregroundColor(.white)
                                .padding()
                        }
                    }
                    if currentPage.choice3Destination != nil
                    {
                        Button {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                navigateTo = .choice3(currentPage.choice3Destination ?? 0)
                            }
                        } label: {
                            Text("\(currentPage.choice3 ?? "")")
                                .font(Font.custom("Hoefler Text", size: 20))
                                .foregroundColor(.white)
                                .padding()
                        }
                    }
                    if currentPage.choice4Destination != nil
                    {
                        Button {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                navigateTo = .choice4(currentPage.choice4Destination ?? 0)
                            }
                        } label: {
                            Text("\(currentPage.choice4 ?? "")")
                                .font(Font.custom("Hoefler Text", size: 20))
                                .foregroundColor(.white)
                                .padding()
                        }
                    }
                }
                .preferredColorScheme(.dark)
                .navigationBarBackButtonHidden(true)
                .ignoresSafeArea()
            }
            
            // This is where the view changes
            .navigationDestination(item: $navigateTo) { nav in
                switch nav {
                case .choice1:
                    Chapter2View(choiceMade: .constant(nav.destinationValue))
                case .choice2:
                    Chapter2View(choiceMade: .constant(nav.destinationValue))
                case .choice3:
                    Chapter2View(choiceMade: .constant(nav.destinationValue))
                case .choice4:
                    Chapter2View(choiceMade: .constant(nav.destinationValue))
                case .restartGame:
                    Chapter2View(choiceMade: .constant(0))
                }
            }
        }
    }
}

#Preview {
    Chapter2View(choiceMade: .constant(0))
}
