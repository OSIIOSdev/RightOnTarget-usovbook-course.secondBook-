//
//  ViewController.swift
//  RightOnTarget
//
//  Created by OSIIOSdev on 20.07.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    @IBOutlet var button: UIButton!
    
    var number = 0
    var round = 0
    var points = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.configuration = buttonSetup(for: "Confirm")
    }
    
    @IBAction func checkNumber() {
        if number == 0 {
            number = Int.random(in: 1...50)
            label.text = String(number)
            round = 1
        } else {
            let numSlider = Int(slider.value.rounded())
            
            if numSlider > number {
                points += 50 - numSlider + number
            } else if numSlider < number {
                points += 50 - number + numSlider
            } else {
                points += 50
            }
            
            if round == 5 {
                let alert = UIAlertController(title: "Game over",
                                              message: "You have \(points) points",
                                              preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Try again", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
                round = 1
                points = 0
            } else {
                round += 1
            }
            
            number = Int.random(in: 1...50)
            label.text = String(number)
        }
    }

    private func buttonSetup(for title: String) -> UIButton.Configuration {
        var button = UIButton.Configuration.filled()
        button.title = title
        button.baseBackgroundColor = #colorLiteral(red: 0.3210597634, green: 0.4023810029, blue: 0.3317038417, alpha: 1)
        button.cornerStyle = .large
        button.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            
            return outgoing }
        
        return button
    }
    
}

