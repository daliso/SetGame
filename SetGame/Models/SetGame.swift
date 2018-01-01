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

    public func checkIsSet(cards:[SetCard]){
    
    }
    
    public func nextBatch(ofSize batchSize:Int) -> [SetCard] {
        var nextCardBatch = [SetCard]()
        
        let lastIndex = max(deckIndex + batchSize, cardDeck.size)
        
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
    
    public enum SetCardNumber {
        case one
        case two
        case three
        case four
        
        static let allValues = [one,two,three,four]
    }
}

protocol SetGameDelegate {
    func scoreChanged(_ newScore:Int)
}
