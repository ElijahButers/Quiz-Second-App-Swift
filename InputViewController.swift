//
//  InputViewController.swift
//  Quiz Second Application - Swift
//
//  Created by User on 9/20/15.
//  Copyright © 2015 Elijah Buters. All rights reserved.
//

import UIKit

class InputViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var questionLabel: UILabel!

    @IBOutlet weak var correctAnswerLabel: UILabel!
    
    @IBOutlet weak var inputTextField: UITextField!
    
    @IBOutlet weak var cardButton: UIButton!
    
    @IBAction func cardButtonHandler(sender: UIButton) {
        
        cardButton.enabled = true
        if questionIdx < (scArray?.count)! - 1 {
            questionIdx++
        } else {
            questionIdx = 0
        }
        
        nextQuestion()
    }
    
    var enteredAnswer: String?
    
    var correctAnswer: String?
    
    var question: String?
    
    var questionIdx = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        inputTextField.delegate = self
        
        titlesForLabels()
        
        cardButton.enabled = false
        nextQuestion()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func nextQuestion() {
        
        let currentQuestion = scArray![questionIdx]
        
        correctAnswer = currentQuestion["CorrectAnswer"] as? String
        question = currentQuestion["Question"] as? String
        
        titlesForLabels()
    }
    
    func titlesForLabels() {
        questionLabel.text = question
        correctAnswerLabel.text = correctAnswer
        correctAnswerLabel.hidden = true
        
        inputTextField.text = nil
        inputTextField.enabled = true
    }
    
    func keyboardWillShow(notification: NSNotification) {
        let userInfo = notification.userInfo!
        
        let keyboardFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
        
        UIView.animateWithDuration(0.1, animations: { () -> Void in
            self.view.frame.origin.y = -keyboardFrame.size.height
        })
    }
    
    func keyboardWillHide(notification: NSNotification) {
        
        UIView.animateWithDuration(0.1, animations: { () -> Void in
            self.view.frame.origin.y = 0
        })

    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        enteredAnswer = textField.text
        
        textField.enabled = false
        cardButton.enabled = true
        
        checkForCorrectAnswer()
        return true
    }
    
    func checkForCorrectAnswer() {
        if enteredAnswer?.lowercaseString == correctAnswer!.lowercaseString {
            print("Right")
            correctAnswerLabel.textColor = UIColor.greenColor()
        } else {
            print("Wrong")
            correctAnswerLabel.textColor = UIColor.redColor()
        }
        correctAnswerLabel.hidden = false
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
