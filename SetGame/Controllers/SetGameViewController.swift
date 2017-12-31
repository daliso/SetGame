//
//  SetGameViewController.swift
//  SetGame
//
//  Created by Daliso Zuze on 12/31/17.
//  Copyright © 2017 Daliso Zuze. All rights reserved.
//

import UIKit

class SetGameViewController: UIViewController, SetGameDelegate {

    @IBOutlet var cardViews: [SetCardView]!
    
    let theGame = SetGame.sharedInstance
    let numCardsPerScreen = 10
    var cardsOnScreen:[SetCard]? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Play Game!"
        
        cardsOnScreen = theGame.nextBatch(ofSize: numCardsPerScreen)
        
        updateCardView(forCardView: cardViews[0], withColor: .red,
                       withShape: .triangle, withNumber: .one)

        // Do any additional setup after loading the view.
    }
    
    private func updateCardView(
        forCardView   card:SetCardView,
        withColor color:SetCardView.SetCardColor,
        withShape shape:SetCardView.SetCardShape,
        withNumber number:SetCardView.SetCardNumber) {
        
        card.cardColor = color
        card.cardShape = shape
        card.cardNumber = number
    }
    
    //TODO : add code to display the current score on the gameview
    func scoreChanged(_ newScore: Int) {
        <#code#>
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
