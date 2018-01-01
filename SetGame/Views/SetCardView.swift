//
//  Card.swift
//  SetGame
//
//  Created by Daliso Zuze on 12/31/17.
//  Copyright © 2017 Daliso Zuze. All rights reserved.
//

import UIKit

class SetCardView: UIButton {
    
    public var delegate:SetCardViewDelegate? = nil

    public var cardColor:SetGame.SetCardColor? = nil {
        didSet{
            if (cardShape != nil && cardNumber != nil && delegate != nil){
                updateUI()
            }
        }
    }
    
    
    public var cardShape:SetGame.SetCardShape? = nil {
        didSet{
            if (cardColor != nil && cardNumber != nil  && delegate != nil){
                updateUI()
            }
        }
    }
    
    public var cardNumber:SetGame.SetCardNumber? = nil {
        didSet{
            if (cardShape != nil && cardColor != nil  && delegate != nil){
                updateUI()
            }
        }
    }
    
    
    
    private func updateUI(){
        
        let viewColor = delegate?.viewColorForSetCard(withColor: cardColor!)
        let viewShape = delegate?.viewShapeForSetCard(withShape: cardShape!)
        var titleForCard = ""
        
        for _ in 0..<cardNumber!.rawValue {
            titleForCard = titleForCard + String(viewShape!)
        }
        
        self.setTitle(titleForCard, for:.normal)
        self.setTitleColor(viewColor, for: .normal)
        
    }

}

protocol SetCardViewDelegate {
    func viewColorForSetCard(withColor setColor: SetGame.SetCardColor) -> UIColor
    func viewShapeForSetCard(withShape setShape: SetGame.SetCardShape) -> Character
}

