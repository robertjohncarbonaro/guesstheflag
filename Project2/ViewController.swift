//
//  ViewController.swift
//  Project2
//
//  Created by Robert Carbonaro on 13/05/2021.
//


// guesstheflag

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var totalNumberOfQuestions = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["Estonia", "France", "Germany", "Ireland", "Italy", "Monaco", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
    
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        
        
        
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = "\(countries[correctAnswer].uppercased()): SCORE:\(score)"
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong, you chose \(countries[sender.tag])"
            score -= 1
        }
        totalNumberOfQuestions += 1
        
        if totalNumberOfQuestions < 10 // if question asked 10 times
        {
        let ac = UIAlertController(title: title, message: "Your score is: \(score)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
        }
        else { // present final score and reset game
            let ac = UIAlertController(title: title, message: "FINAL score is: \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(ac, animated: true)
            
            score = 0
            correctAnswer = 0
            totalNumberOfQuestions = 0
        }
        
    }
    

}

