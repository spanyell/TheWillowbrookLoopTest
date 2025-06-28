//
//  DoorGroansOpenView.swift
//  TheWillowbrookLoopTest
//
//  Created by Dan Beers on 6/27/25.
//

import SwiftUI

struct DoorGroansOpenView: View {
    
    @State private var doorOpening = false
    
    var body: some View {
        Text("THE DOOR GROANS OPEN.")
            .font(Font.custom("Hoefler Text", size: 90))
            .foregroundStyle(.white)
            .multilineTextAlignment(.leading)
            .frame(width: 400)
            .rotation3DEffect(.degrees(doorOpening ? 90 : 0), axis: (x: 0, y: doorOpening ? 1 : 0, z: 0), anchor: .topLeading)
            .preferredColorScheme(.dark)
            .onAppear
            {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2)
                {
                    withAnimation(.easeInOut(duration: 5))
                    {
                        doorOpening.toggle()
                    }
                }

            }
    }
    
        
}

#Preview {
    DoorGroansOpenView()
}
