 // Use data from the view controller which initiated the unwind segue//
//  ViewController.swift
//  FlashcardContinued
//
//  Created by Benny's on 3/1/20.
//  Copyright © 2020 codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var backLabel: UILabel!
    
    @IBOutlet weak var pencilEmoji: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //We know the destination of the segue is the Navigation Controller
        let navigationController = segue.destination as! UINavigationController
        
        //We know the Navigation Controller only contains a Creation View Controller
        let creationController = navigationController.topViewController as! CreationViewController
        
        if segue.identifier == "EditSegue"{
            
        creationController.initialQuestion = frontLabel.text
        creationController.initialAnswer = backLabel.text
            
        }
       
        //We set the flashcardsController property to self
        creationController.flashcardsController = self
        
        
    }


    @IBAction func didTapOnFlashcard(_ sender: Any) {
        
        if( frontLabel.isHidden == false){
            frontLabel.isHidden = true
            backLabel.isHidden = false
        }else if (backLabel.isHidden == false){
            backLabel.isHidden = true
            frontLabel.isHidden = false
        }
        
        if( pencilEmoji.isHidden == false){
            pencilEmoji.isHidden = true
        } else{
            pencilEmoji.isHidden = false
        }
       
    }
    
    func updateFlashcard(question: String, answer: String) {
        
        frontLabel.text = question
        backLabel.text = answer
        
    }
    
    
}

