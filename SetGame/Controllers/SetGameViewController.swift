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
    let NUM_CARDS_PER_SCREEN = 10
    let NUM_CARDS_TO_MATCH = 4
    var isSet:Bool? = nil
    var selectedCards:[SetCard]? = nil
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet var cardViews: [SetCardView]!
    
    var theGame = SetGame()
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
        
            cardView.layer.shadowColor = UIColor.black.cgColor
            cardView.layer.shadowOffset = CGSize(width: 5, height: 5)
            cardView.layer.shadowRadius = 5
            cardView.layer.shadowOpacity = 0.5
            cardView.layer.borderWidth = 1
            cardView.layer.borderColor = UIColor.green.cgColor
            cardView.layer.masksToBounds = false
        }
        
        self.navigationItem.title = "Play Game!"
        theGame.delegate = self
        
        theGame.initializeGame(ofSize: NUM_CARDS_PER_SCREEN)
        cardsOnScreen = theGame.cardsInPlay
  
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if theGame.isGameOver {
            self.navigationController?.popViewController(animated: true)
        }
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
    
    public func clearSelections(){
        for cardView in cardViews {
            cardView.cardSelected = false
        }
    }
    
    public func proceedToNextBatch(){
        for cardView in cardViews {
            cardView.cardSelected = false
            cardView.setTitle("", for: .normal)
        }
        cardsOnScreen = theGame.cardsInPlay
    }
    
    
    private func checkIfMaxSelected(){
    // Todo - if 4 selected then send submission to game objecr
        
        selectedCards = [SetCard]()
        
        for cardView in cardViews{
            if cardView.cardSelected {
                selectedCards!.append(cardView.setCard!)
            }
        }
        
        if selectedCards!.count == NUM_CARDS_TO_MATCH {
            isSet = theGame.checkIsSet(cardsToMatch: selectedCards!)
            if isSet! {
                theGame.removeSet(selectedCards!)
            }
            performSegue(withIdentifier: CHECK_RESULT_SEGUE, sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == CHECK_RESULT_SEGUE {
            let gameResultVC = segue.destination as! setResultsViewController
            gameResultVC.delegate = self
            gameResultVC.isGameOver = theGame.isGameOver
            gameResultVC.isSet = isSet
        }
    }
    
    //TODO : add code to display the current score on the gameview
    func scoreChanged(_ newScore: Int) {
        scoreLabel.text = "Score : \(newScore)"
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
            return UIColor(red:0.94, green:0.89, blue:0.00, alpha:1.0) //UIColor.yellow
        }
        
    }
    
    func viewShapeForSetCard(withShape setShape: SetGame.SetCardShape) -> Character {
        switch setShape {
        case .circle:
            return "⚫︎"
        case .square:
            return "￭"
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


}

