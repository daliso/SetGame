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
    var isGameOver = false
    var cardsInPlay:[SetCard]? = nil
    var validSetsInPlay:[[SetCard]]? = nil
    var delegate:SetGameDelegate? = nil
    
    static let sharedInstance = SetGame()

    public func checkIsSet(cardsToMatch:[SetCard]) -> Bool {
        
        var rotate = [[0,1,2,3],[0,2,1,3],[0,3,1,2],[2,3,0,1],[1,3,0,2],[1,2,0,3]];
        
        var itIsASet = true;
        
        for i in 0..<rotate.count {
   
            let a = rotate[i][0]
            let b = rotate[i][1]
            let c = rotate[i][2]
            let d = rotate[i][3]
            
            if (cardsToMatch[a].cardColor==cardsToMatch[b].cardColor)
            {
                if (cardsToMatch[c].cardColor != cardsToMatch[d].cardColor)
                {
                    itIsASet = false;
                    break;
                    
                }
            }
            
            if(cardsToMatch[a].cardShape==cardsToMatch[b].cardShape)
            {
                if(cardsToMatch[c].cardShape != cardsToMatch[d].cardShape)
                {
                    itIsASet = false;
                    break;
                    
                }
            }
            
            if(cardsToMatch[a].cardNumber == cardsToMatch[b].cardNumber)
            {
                if(cardsToMatch[c].cardNumber != cardsToMatch[d].cardNumber)
                {
                    itIsASet = false;
                    break;
                    
                }
            }
        }
        
        return itIsASet;
        
    }
    
    public func initializeGame(ofSize batchSize:Int) {
        cardsInPlay = [SetCard]()

        for index in 0..<batchSize {
            cardsInPlay!.append(cardDeck.getCard(atIndex: index))
        }
        
        deckIndex = batchSize
        updateValidSetsInPlay()

        print(deckIndex)
    }
    
    private func updateValidSetsInPlay(){
        // find all the subsets of cardsInPlay
        
        let size = cardsInPlay!.count
        validSetsInPlay = [[SetCard]]()
        
        for i in 0..<size {
            for j in i+1..<size{
                for k in j+1..<size {
                    for l in k+1..<size {
                        let setToCheck = [cardsInPlay![i],
                                          cardsInPlay![j],
                                          cardsInPlay![k],
                                          cardsInPlay![l]]
                        
                        if checkIsSet(cardsToMatch: setToCheck) {
                            validSetsInPlay!.append(setToCheck)
                        }
                    }
                }
            }
        }
        
        print("Valid sets are: \(validSetsInPlay!)")
    }
    
    public func removeSet(_ setOfCards:[SetCard]) {
        let size = cardsInPlay!.count
        var newCardsInPlay = [SetCard]()
        
        for i in 0..<size {
            if setOfCards.contains(cardsInPlay![i]) {
                if deckIndex < cardDeck.size{
                    newCardsInPlay.append(cardDeck.getCard(atIndex:deckIndex))
                    deckIndex = deckIndex + 1
                }
            }
            else {
                newCardsInPlay.append(cardsInPlay![i])
            }
        }
        
        cardsInPlay = newCardsInPlay
        updateValidSetsInPlay()
        
        if validSetsInPlay!.count < 1 {
            isGameOver = true
        }
        score = score + 1
        delegate?.scoreChanged(score)
        print(deckIndex)
    }
    
}

extension SetGame {
    public enum SetCardColor {
        case red
        case yellow
        case blue
        case black
        
        static let allValues = [red,yellow,blue,black]
        
        var description:String {
            switch self {
            case .red:
                return "red"
            case .yellow:
                return "yellow"
            case .blue:
                return "blue"
            case .black:
                return "black"
            }
        }
        
    }
    
    public enum SetCardShape {
        case triangle
        case square
        case star
        case circle
        
        static let allValues = [triangle,square,star,circle]
        
        var description:String {
            switch self {
            case .triangle:
                return "triangle"
            case .square:
                return "square"
            case .star:
                return "star"
            case .circle:
                return "circle"
            }
        }
    }
    
    public enum SetCardNumber: Int {
        case one = 1
        case two = 2
        case three = 3
        case four = 4
        
        static let allValues = [one,two,three,four]
        
        var description:String {
            switch self {
            case .one:
                return "one"
            case .two:
                return "two"
            case .three:
                return "three"
            case .four:
                return "four"
            }
        }
    }
}


protocol SetGameDelegate {
    func scoreChanged(_ newScore:Int)
}
