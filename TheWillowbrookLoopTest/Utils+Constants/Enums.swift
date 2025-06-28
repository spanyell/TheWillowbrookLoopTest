//
//  Enums.swift
//  WillowbrookLoopTest
//
//  Created by Dan Beers on 6/21/25.
//

import Foundation

enum StoryNavigation: Hashable, Identifiable {
    case choice1(Int)
    case choice2(Int)
    case choice3(Int)
    case choice4(Int)
    case restartGame(Int)

    var id: String {
        switch self {
        case .choice1(let dest): return "choice1_\(dest)"
        case .choice2(let dest): return "choice2_\(dest)"
        case .choice3(let dest): return "choice3_\(dest)"
        case .choice4(let dest): return "choice4_\(dest)"
        case .restartGame(let dest): return "restartGame_\(dest)"
        }
    }
    var destinationValue: Int {
        switch self {
        case .choice1(let dest), .choice2(let dest), .choice3(let dest), .choice4(let dest), .restartGame(let dest):
            return dest
        }
    }
}
