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
        timer.invalidate()
        
        if sender.titleLabel?.text == correctAnswer {
            print("Correct")
        } else {
            sender.backgroundColor = UIColor.redColor()
            print("Wrong Answer")
        }
        for button in answerButtons {
            button.enabled = false
            if button.titleLabel?.text == correctAnswer {
                button.backgroundColor = UIColor.greenColor()
            }
        }
        cardButton.enabled = true
    }

    @IBOutlet weak var cardButton: UIButton!
    
    @IBAction func cardButtonHandler(sender: UIButton) {
        
        cardButton.enabled = true
        if questionIdx < (mcArray?.count)! - 1 {
            questionIdx++
        } else {
            questionIdx = 0
        }
        nextQuestion()
    }
    
    @IBOutlet weak var progressView: UIProgressView!
    
    //var correctAnswer = "2015"
    var correctAnswer: String?
    var question: String?
    //var answers = ["1990", "1995", "2005", "2015"]
    var answers = [String]()
    
    var questionIdx = 0
    
    var timer = NSTimer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor(patternImage: UIImage(named: "Night sky-png")!)
        
        progressView.transform = CGAffineTransformScale(progressView.transform, 1, 10)
        
        cardButton.enabled = false
        titlesForButtons()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func nextQuestion() {
        let currentQuestion = mcArray![questionIdx]
        
        answers = currentQuestion["Answers"] as! [String]
        correctAnswer = currentQuestion["CorrectAnswer"] as? String
        question = currentQuestion["Question"] as? String
        
        titlesForButtons()
    }
    
    func titlesForButtons() {
        for (idx, button) in EnumerateSequence(answerButtons) {
            button.titleLabel?.lineBreakMode = .ByWordWrapping
            button.setTitle(answers[idx], forState: .Normal)
            button.enabled = true
            button.backgroundColor = UIColor(red: 83.0/255.0, green: 184.0/255.0, blue: 224.0/225.0, alpha: 1.0)
        }
        
        questionLabel.text = question
        startTimer()
    }
    
    func startTimer() {
        progressView.progress = 1
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: "updateProgressView", userInfo: nil, repeats: true)
    }
    
    func updateProgressView() {
        progressView.progress -= 0.01/30
        if progressView.progress <= 0 {
            outOfTime()
        }
    }
    
    func outOfTime() {
        timer.invalidate()
        showAlert()
        disableButtons()
    }
    
    func disableButtons() {
        for button in answerButtons {
            button.enabled = false
        }
    }
    
    func showAlert() {
        let alertController = UIAlertController(title: "Out of time!", message: "Too slow!", preferredStyle: UIAlertControllerStyle.Alert)
        
        let ok = UIAlertAction(title: "OK", style: .Default, handler: {  (alert: UIAlertAction!) in
            })
            
            alertController.addAction(ok)
            self.presentViewController(alertController, animated: true, completion: nil)
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
