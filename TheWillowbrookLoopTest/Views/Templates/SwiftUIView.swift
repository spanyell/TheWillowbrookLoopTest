//
//  SwiftUIView.swift
//  TheWillowbrookLoopTest
//
//  Created by Dan Beers on 7/23/25.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        ZStack {
            LightningView()
            DustyView()
        }

    }
}

#Preview {
    SwiftUIView()
}
