//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // access dice one on left side and dice two on right side
    // @IBOutlet means its an interface builder connection.
    // when we want our code to change any of our UI elements we use IBOutlet.
    @IBOutlet weak var diceImageViewOne: UIImageView!
    @IBOutlet weak var diceImageViewTwo: UIImageView!
        
    // when view/app loads up, execute code in this block.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // once app loads up, whatever code is written here will run.
        
    }

    //IBAction: code that gets triggered when an action occurs on the following UI element.
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        let diceArray = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")] // we use let so that this array can't be mutated
        
        // roll dice. just like i would roll dice irl, change each image view to something random
        // by using diceArray.randomElement()
        diceImageViewOne.image = diceArray.randomElement()
        diceImageViewTwo.image = diceArray.randomElement()
        
        // alternatively, i can do this:
//        diceImageViewOne.image = diceArray[Int.random(in: 0...5)]
//        diceImageViewTwo.image = diceArray[Int.random(in: 0...5)]
        
    }
    
}

