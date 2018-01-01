//
//  CardDeck.swift
//  SetGame
//
//  Created by Daliso Zuze on 12/31/17.
//  Copyright © 2017 Daliso Zuze. All rights reserved.
//

import Foundation

class SetCardDeck {
    
    public var size:Int = 4*4*4
    public var deck:[SetCard] {
        var deckOfCards = [SetCard]()
        
        for color in SetGame.SetCardColor.allValues {
            for shape in SetGame.SetCardShape.allValues {
                for number in SetGame.SetCardNumber.allValues {
                    deckOfCards.append(SetCard(withColor: color, withShape: shape, withNumber: number))
                }
            }
        }
        
        return deckOfCards
    }
    public func getCard(atIndex index:Int) -> SetCard {
        return deck[index]
    }
    
    
}
