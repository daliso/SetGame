//
//  Card.swift
//  SetGame
//
//  Created by Daliso Zuze on 12/31/17.
//  Copyright © 2017 Daliso Zuze. All rights reserved.
//

import UIKit

class SetCardView: UIButton {

    public var cardColor:SetGame.SetCardColor? = nil {
        didSet{
            if (cardShape != nil && cardNumber != nil){
                updateUI()
            }
        }
    }
    
    
    public var cardShape:SetGame.SetCardShape? = nil {
        didSet{
            if (cardColor != nil && cardNumber != nil){
                updateUI()
            }
        }
    }
    
    public var cardNumber:SetGame.SetCardNumber? = nil {
        didSet{
            if (cardShape != nil && cardColor != nil){
                updateUI()
            }
        }
    }
    
    
    
    private func updateUI(){
        self.setTitle("Hello", for:.normal)
    }


}
