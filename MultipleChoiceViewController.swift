//
//  MultipleChoiceViewController.swift
//  Quiz Second Application - Swift
//
//  Created by User on 9/20/15.
//  Copyright © 2015 Elijah Buters. All rights reserved.
//

import UIKit

class MultipleChoiceViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet var answerButtons: [UIButton]!
    @IBAction func answerButtonHandler(sender: UIButton) {
        
        if sender.titleLabel?.text == correctAnswer {
            print("Correct")
        } else {
            print("Wrong Answer")
        }
    }

    @IBOutlet weak var cardButton: UIButton!
    
    @IBAction func cardButtonHandler(sender: UIButton) {
    }
    
    //var correctAnswer = "2015"
    var correctAnswer: String?
    var question: String?
    //var answers = ["1990", "1995", "2005", "2015"]
    var answers = [String]()
    
    var questionIdx = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor(patternImage: UIImage(named: "Night sky-png")!)
        
        titlesForButtons()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func titlesForButtons() {
        for (idx, button) in EnumerateSequence(answerButtons) {
            button.setTitle(answers[idx], forState: .Normal)
        }
        
        questionLabel.text = "What year is it?"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
