//
//  SetGame.swift
//  SetGame
//
//  Created by Daliso Zuze on 12/31/17.
//  Copyright © 2017 Daliso Zuze. All rights reserved.
//

import Foundation


class SetGame {
    
    var score:Int = 0
    let cardDeck = SetCardDeck()
    var deckIndex = 0
    
    static let sharedInstance = SetGame()

    public func checkIsSet(cards:[SetCard]) -> Bool {
        return false
    }
    
    public func nextBatch(ofSize batchSize:Int) -> [SetCard] {
        var nextCardBatch = [SetCard]()
        
        let lastIndex = min(deckIndex + batchSize, cardDeck.size)
        
        for index in deckIndex..<lastIndex {
            nextCardBatch.append(cardDeck.getCard(atIndex: index))
        }
        
        return nextCardBatch
    }
    
}

extension SetGame {
    public enum SetCardColor {
        case red
        case yellow
        case blue
        case black
        
        static let allValues = [red,yellow,blue,black]
        
    }
    
    public enum SetCardShape {
        case triangle
        case square
        case star
        case circle
        
        static let allValues = [triangle,square,star,circle]
    }
    
    public enum SetCardNumber: Int {
        case one = 1
        case two = 2
        case three = 3
        case four = 4
        
        static let allValues = [one,two,three,four]
    }
}

extension SetGame {
    public static let NUM_CARDS_PER_SCREEN = 10
    public static let NUM_CARDS_TO_MATCH = 4
}

protocol SetGameDelegate {
    func scoreChanged(_ newScore:Int)
}
