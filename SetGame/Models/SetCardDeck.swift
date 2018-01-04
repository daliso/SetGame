//
//  CardDeck.swift
//  SetGame
//
//  Created by Daliso Zuze on 12/31/17.
//  Copyright © 2017 Daliso Zuze. All rights reserved.
//

import Foundation
import GameplayKit

class SetCardDeck {
    
    lazy public var size:Int = deck.count
    public var deck:[SetCard] {
        var deckOfCards = [SetCard]()
        
        for color in SetGame.SetCardColor.allValues {
            for shape in SetGame.SetCardShape.allValues {
                for number in SetGame.SetCardNumber.allValues {
                    deckOfCards.append(SetCard(withColor: color, withShape: shape, withNumber: number))
                }
            }
        }
        
        return GKRandomSource.sharedRandom().arrayByShufflingObjects(in: deckOfCards) as! [SetCard]
    }
    public func getCard(atIndex index:Int) -> SetCard {
        return deck[index]
    }
    
    
}

//extension MutableCollection {
//    /// Shuffles the contents of this collection.
//    mutating func shuffle() {
//        let c = count
//        guard c > 1 else { return }
//
//        for (firstUnshuffled, unshuffledCount) in zip(indices, stride(from: c, to: 1, by: -1)) {
//            let d: IndexDistance = numericCast(arc4random_uniform(numericCast(unshuffledCount)))
//            let i = index(firstUnshuffled, offsetBy: d)
//            swapAt(firstUnshuffled, i)
//        }
//    }
//}
//
//extension Sequence {
//    /// Returns an array with the contents of this sequence, shuffled.
//    func shuffled() -> [Element] {
//        var result = Array(self)
//        result.shuffle()
//        return result
//    }
//}
