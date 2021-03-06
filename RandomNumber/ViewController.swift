//
//  ViewController.swift
//  RandomNumber
//
//  Created by Evgenia Galetskaya on 10/19/18.
//  Copyright © 2018 Evgenia Galetskaya. All rights reserved.
//


import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var randomNumberLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var newGameButton: UIButton!
    
    var arrayOfNumbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    @IBAction func nextButtonPressed(_ sender: UIButton) {
        newGameButton.isEnabled = true
        let randomNumber = arrayOfNumbers.remove(at: arrayOfNumbers.count.arc4random)
        numberLabel.text = "\(randomNumber)"
        if arrayOfNumbers.isEmpty {
            numberLabel.text = "Out of numbers"
            nextButton.isHidden = true
        }
    }
    
    @IBAction func startNewGame(_ sender: UIButton) {
        arrayOfNumbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        numberLabel.text = "Click \"Next\" button"
        newGameButton.isEnabled = false
        nextButton.isHidden = false
        nextButton.isEnabled = true
    }
    
    func configureView() {
        newGameButton.isEnabled = false
        nextButton.isHidden = false
        nextButton.isEnabled = true
        numberLabel.text = "Click \"Next\" button"
        self.view.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.9628801167, blue: 0.610055735, alpha: 1)
    }
}


extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self))) }
        else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}
