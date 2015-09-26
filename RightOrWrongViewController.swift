//
//  RightOrWrongViewController.swift
//  Quiz Second Application - Swift
//
//  Created by User on 9/20/15.
//  Copyright © 2015 Elijah Buters. All rights reserved.
//

import UIKit

class RightOrWrongViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet var answersButtons: [UIButton]!
    
    @IBAction func answerButtonHandler(sender: UIButton) {
        
        if sender.titleLabel?.text == correctAnswer {
            print("Correct")
        } else {
            print("Wrong")
        }
    }
    
    var correctAnswer = "Right"
    
    var answers = ["Wrong", "Right"]
    
    
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
        for (idx, button) in EnumerateSequence(answersButtons) {
            button.setTitle(answers[idx], forState: .Normal)
        }
        
        questionLabel.text = "Barack Obama is the president of the United States of America"
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
