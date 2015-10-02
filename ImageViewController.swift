//
//  ImageViewController.swift
//  Quiz Second Application - Swift
//
//  Created by User on 9/20/15.
//  Copyright © 2015 Elijah Buters. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet var answersButtons: [UIButton]!
    
    @IBAction func answerButtonHandler(sender: UIButton) {
        
        if sender.titleLabel?.text == correctAnswer {
            print("Correct")
        } else {
            sender.backgroundColor = UIColor.redColor()
            print("Wrong")
        }
        
        for button in answersButtons {
            button.enabled = false
            if button.titleLabel?.text == correctAnswer {
                button.backgroundColor = UIColor.greenColor()
            }
        }
    }
    

    @IBOutlet weak var cardButton: UIButton!
    
    @IBAction func cardButtonHandler(sender: UIButton) {
        
        cardButton.enabled = true
        if questionIdx < (imgArray?.count)! - 1 {
            questionIdx++
        } else {
            questionIdx = 0
        }
        nextQuestion()
    }
    
    
    var correctAnswer: String?
    
    var answers = [String]()
    
    var image: String?
    
    var question: String?
    
    var questionIdx = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor(patternImage: UIImage(named: "Night sky-png")!)
        
        cardButton.enabled = false
        nextQuestion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func nextQuestion() {
        
        let currentQuestion = imgArray![questionIdx]
        correctAnswer = currentQuestion["CorrectAnswer"] as? String
        image = currentQuestion["Question"] as? String
        
        titlesForButtons()
    }

    
    func titlesForButtons() {
        for (idx, button) in EnumerateSequence(answersButtons) {
            button.titleLabel?.lineBreakMode = .ByWordWrapping
            button.setTitle(answers[idx], forState: .Normal)
            button.enabled = true
            button.backgroundColor = UIColor(red: 83.0/255.0, green: 184.0/255.0, blue: 224.0/255.0, alpha: 1.0)
        }
        
        imageView.image = UIImage(named: image!)
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
