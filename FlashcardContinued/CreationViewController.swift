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
    
    var initialQuestion: String?
    var initialAnswer: String?
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        //Do any additional setup after loading the view.
        questionTextField.text = initialQuestion
        answerTextField.text = initialAnswer
    }

   
    @IBAction func didTapOnCancel(_ sender: Any) {
        dismiss(animated:true)
    }
    
    @IBAction func didTapOnDone(_ sender: Any) {
       
        //Get the text in the question text field
        let questionText = questionTextField.text
        
        //get the text in the answere text field
        let answerText = answerTextField.text
        
        let alert = UIAlertController(title: "Missing text", message: "You need to enter both a question and an answer", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        
        if (questionText == nil || answerText == nil || questionText!.isEmpty || answerText!.isEmpty){
            present(alert, animated: true)
            
        }else{
        
        //Call the function to update the flashcard
        flashcardsController.updateFlashcard(question: questionText!, answer: answerText!)
        
        dismiss(animated:true)
        }
    }
}
