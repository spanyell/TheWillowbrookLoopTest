//
//  JSONModelData.swift
//  WillowbrookLoopTest
//
//  Created by Dan Beers on 6/21/25.
//

import Foundation

// var willowbrookData: [Willowbrook] = load("WillowbrookTestData.json")

// var willowbrookData: [Willowbrook] = load("WillowbrookLoopTestData2.json")

var willowbrookData: [Willowbrook] = load("TheWillowbrookLoopTestData.json")
// var willowbrookData: [Willowbrook] = load("TWLChapter2Data.json")

func load<T: Decodable>(_ filename: String) -> T
{
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
            
    else
    {
        fatalError("Couldn't find \(filename) in main bundle")
    }

    do
    {
        data = try Data(contentsOf: file)
    }
    catch
    {
        fatalError("Couldn't load \(filename) in main bundle:\n\(error)")
    }

    do
    {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
    catch
    {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
