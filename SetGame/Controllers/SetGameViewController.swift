//
//  SetGameViewController.swift
//  SetGame
//
//  Created by Daliso Zuze on 12/31/17.
//  Copyright © 2017 Daliso Zuze. All rights reserved.
//

import UIKit

class SetGameViewController: UIViewController, SetGameDelegate, SetCardViewDelegate {

    
    let CHECK_RESULT_SEGUE = "display_result_of_check_is_set"
    
    @IBOutlet var cardViews: [SetCardView]!
    
    let theGame = SetGame.sharedInstance
    let numCardsPerScreen = SetGame.NUM_CARDS_PER_SCREEN
    var cardsOnScreen:[SetCard]? = nil {
        didSet{
            updateUI()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        for cardView in cardViews {
            cardView.delegate = self
            cardView.layer.cornerRadius = 5
            cardView.clipsToBounds = true
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
            cardViews[i].setCard = card
            i = i + 1
        }
        
    }
    
    
    @IBAction func cardPressed(_ sender: SetCardView) {
        sender.cardSelected = !sender.cardSelected
        checkIfMaxSelected()
    }
    
    
    private func checkIfMaxSelected(){
    // Todo - if 4 selected then send submission to game objecr
        
        var selectedCards = [SetCard]()
        
        for cardView in cardViews{
            if cardView.cardSelected {
                selectedCards.append(cardView.setCard!)
            }
        }
        
        if selectedCards.count == SetGame.NUM_CARDS_TO_MATCH {
            let isSet = theGame.checkIsSet(cards: selectedCards)
            
            performSegue(withIdentifier: CHECK_RESULT_SEGUE, sender: self)
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
