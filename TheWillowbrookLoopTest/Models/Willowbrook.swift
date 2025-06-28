//
//  Willowbrook.swift
//  WillowbrookLoopTest
//
//  Created by Dan Beers on 6/21/25.
//

import Foundation

struct Willowbrook: Decodable
{
    let id: Int
    let storyText: String
    let choice1: String
    let choice1Destination: Int
    let choice2: String?
    let choice2Destination: Int?
    let choice3: String?
    let choice3Destination: Int?
    let choice4: String?
    let choice4Destination: Int?
    let restartGame: Int?
}
