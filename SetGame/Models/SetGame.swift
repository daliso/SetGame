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
        
        for index in deckIndex..<deckIndex + batchSize {
            nextCardBatch.append(cardDeck.getCard(atIndex: index))
        }
        
        return nextCardBatch
    }
    
    
}

protocol SetGameDelegate {
    func scoreChanged(_ newScore:Int)
}
