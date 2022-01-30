//
//  HomeEntity.swift
//  quick-draw-ios
//
//  Created by Betül Çalık on 30.01.2022.
//

import Foundation

enum Categories: String, CaseIterable {
    case apple
    case banana
    case bread
    case broccoli
    case cake
    case carrot
    case coffeeCup = "coffee cup"
    case cookie
    case donut
    case grapes
    case hotDog = "hot dog"
    case iceCream = "ice cream"
    case lollipop
    case mushroom
    case peanut
    case pear
    case pineapple
    case pizza
    case potato
    case sandwich
    case steak
    case strawberry
    case watermelon

    static var getRandom: String {
        return allCases.randomElement()?.rawValue ?? "apple"
    }
}
