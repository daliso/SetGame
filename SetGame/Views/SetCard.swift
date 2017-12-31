//
//  Card.swift
//  SetGame
//
//  Created by Daliso Zuze on 12/31/17.
//  Copyright © 2017 Daliso Zuze. All rights reserved.
//

import UIKit

class SetCard: UIButton {
    
    public enum SetCardColor {
        case red
        case green
        case blue
    }
    
    public enum SetCardShape {
        case triangle
        case square
        case star
    }
    
    public enum SetCardNumber {
        case one
        case two
        case three
    }

    public var cardColor:SetCardColor? = nil {
        didSet{
            if (cardShape != nil && cardNumber != nil){
                updateUI()
            }
        }
    }
    
    
    public var cardShape:SetCardShape? = nil {
        didSet{
            if (cardColor != nil && cardNumber != nil){
                updateUI()
            }
        }
    }
    
    public var cardNumber:SetCardNumber? = nil {
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
