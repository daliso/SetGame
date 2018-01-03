//
//  setResultsViewController.swift
//  SetGame
//
//  Created by Daliso Zuze on 1/1/18.
//  Copyright © 2018 Daliso Zuze. All rights reserved.
//

import UIKit

class setResultsViewController: UIViewController {
    
    var delegate:SetGameViewController? = nil
    var isGameOver:Bool? = nil
    var isSet:Bool? = nil
    
    @IBOutlet weak var resultsLabel: UILabel!
    @IBOutlet weak var closeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if isGameOver! {
            resultsLabel.text = "Congratulations, you've completed the game!"
            closeButton.setTitle("Return To Home Screen", for: .normal)
        } else if isSet! {
            resultsLabel.text = "Congratulations, you found a set!"
            closeButton.setTitle("Continue to next batch of cards", for: .normal)
        } else {
            resultsLabel.text = "Sorry the cards you selected do not form a set"
            closeButton.setTitle("Try again", for: .normal)
        }

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        
        if isGameOver! {
            self.dismiss(animated: true, completion: nil)
        } else if isSet! {
            delegate?.proceedToNextBatch()
            self.dismiss(animated: true, completion: nil)
        } else {
            delegate?.clearSelections()
            self.dismiss(animated: true, completion: nil)
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
