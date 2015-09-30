//
//  ViewController.swift
//  Quiz Second Application - Swift
//
//  Created by User on 9/16/15.
//  Copyright © 2015 Elijah Buters. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = UIColor(patternImage: UIImage(named: "Night sky-png")!)
        
        loadQuizData()
    }
    
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadQuizData() {
        //Multiple Choice Data
        let pathMC = NSBundle.mainBundle().pathForResource("MultipleChoice", ofType: "plist")
        let dictMC = NSDictionary(contentsOfFile: pathMC!)
        mcArray = dictMC!["Questions"]!.mutableCopy() as? Array
        
//        //Single Choice Data
//        let pathSC = NSBundle.mainBundle().pathForResource("SingleChoice", ofType: "plist")
//        let dictSC = NSDictionary(contentsOfFile: pathSC!)
//        scArray = dictSC!["Questions"]!.mutableCopy() as? Array
//        
        //Right Or Wrong Data
        let pathROW = NSBundle.mainBundle().pathForResource("RightOrWrong", ofType: "plist")
        let dictROW = NSDictionary(contentsOfFile: pathROW!)
        rowArray = dictROW!["Questions"]!.mutableCopy() as? Array
//
//        //Image Quiz Data
//        let pathIMG = NSBundle.mainBundle().pathForResource("ImageQuiz", ofType: "plist")
//        let dictIMG = NSDictionary(contentsOfFile: pathIMG!)
//        imgArray = dictIMG!["Questions"]!.mutableCopy() as? Array
        
        check()
        
    }
    
    func check() {
        print(mcArray)
        print(scArray)
        print(imgArray)
        print(rowArray)
    }


}

