//
//  SetGameViewController.swift
//  SetGame
//
//  Created by Daliso Zuze on 12/31/17.
//  Copyright © 2017 Daliso Zuze. All rights reserved.
//

import UIKit

class SetGameViewController: UIViewController, SetGameDelegate, SetCardViewDelegate {

    @IBOutlet var cardViews: [SetCardView]!
    
    let theGame = SetGame.sharedInstance
    let numCardsPerScreen = 10
    var cardsOnScreen:[SetCard]? = nil {
        didSet{
            updateUI()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        for cardView in cardViews {
            cardView.delegate = self
        }
        
        self.navigationItem.title = "Play Game!"
        
        cardsOnScreen = theGame.nextBatch(ofSize: numCardsPerScreen)

        // Do any additional setup after loading the view.
    }
    
    private func updateUI(){
        
        var i:Int = 0
        
        for card in cardsOnScreen! {
            cardViews[i].cardColor = card.cardColor
            cardViews[i].cardShape = card.cardShape
            cardViews[i].cardNumber = card.cardNumber
            i = i + 1
        }
        
    }
    
    //TODO : add code to display the current score on the gameview
    func scoreChanged(_ newScore: Int) {
        // todo
    }
    

    func viewColorForSetCard(withColor setColor: SetGame.SetCardColor) -> UIColor {
        
        switch setColor {
        case .black:
            return UIColor.black
        case .blue:
            return UIColor.blue
        case .red:
            return UIColor.red
        case .yellow:
            return UIColor.yellow
        }
        
    }
    
    func viewShapeForSetCard(withShape setShape: SetGame.SetCardShape) -> Character {
        switch setShape {
        case .circle:
            return "⬤"
        case .square:
            return "⬛️"
        case .star:
            return "★"
        case .triangle:
            return "▲"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
