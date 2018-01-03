//
//  SetCard.swift
//  SetGame
//
//  Created by Daliso Zuze on 12/31/17.
//  Copyright © 2017 Daliso Zuze. All rights reserved.
//

import Foundation

class SetCard {
    
    public var cardColor:SetGame.SetCardColor? = nil
    public var cardShape:SetGame.SetCardShape? = nil
    public var cardNumber:SetGame.SetCardNumber? = nil
    
    init(withColor color:SetGame.SetCardColor,
         withShape shape:SetGame.SetCardShape,
         withNumber num:SetGame.SetCardNumber) {
        cardColor = color
        cardShape = shape
        cardNumber = num
    }
    
}

extension SetCard: Equatable {
    static func == (lhs: SetCard, rhs: SetCard) -> Bool {
        return
            lhs.cardColor == rhs.cardColor &&
                lhs.cardShape == rhs.cardShape &&
                lhs.cardNumber == rhs.cardNumber
    }
}
