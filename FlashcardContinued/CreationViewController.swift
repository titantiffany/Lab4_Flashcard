//
//  CreationViewController.swift
//  FlashcardContinued
//
//  Created by Benny's on 3/4/20.
//  Copyright © 2020 codepath. All rights reserved.
//

import UIKit

class CreationViewController: UIViewController {

    var flashcardsController: ViewController!
    
    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var answerTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

   
    @IBAction func didTapOnCancel(_ sender: Any) {
        dismiss(animated:true)
    }
    
    @IBAction func didTapOnDone(_ sender: Any) {
       
        //Get the text in the question text field
        let questionText = questionTextField.text
        
        //get tje text in the answere text field
        let answerText = answerTextField.text
        
        //Call the function to update the flashcard
        flashcardsController.updateFlashcard(question: questionText!, answer: answerText!)
        
        dismiss(animated:true)
    }
}
