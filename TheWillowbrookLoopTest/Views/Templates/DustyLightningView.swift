//
//  DustyLightningView.swift
//  TheWillowbrookLoopTest
//
//  Created by Dan Beers on 7/23/25.
//

import SwiftUI

struct DustyLightningView: View {
    var body: some View {
        ZStack {
            LightningView()
            DustyView()
            Text("Hello world")
        }

    }
}

#Preview {
    DustyLightningView()
}
