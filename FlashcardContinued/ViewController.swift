 // Use data from the view controller which initiated the unwind segue//
//  ViewController.swift
//  FlashcardContinued
//
//  Created by Benny's on 3/1/20.
//  Copyright © 2020 codepath. All rights reserved.
//

import UIKit
 
 struct Flashcard{
    
    var question: String
    var answer: String
 }

class ViewController: UIViewController {

    
    
    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var backLabel: UILabel!
    @IBOutlet weak var pencilEmoji: UIButton!
    
    //Array to hold our flashcards
    var flashcards = [Flashcard]()
    
    //curent flahscard index
    var currentIndex = 0
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Read saved flashcards
        readSavedFlashcards()
        
        //Adding our initial flshcard if needed
        if flashcards.count == 0{
        updateFlashcard(question: "What's the capital of Brazil?", answer: "Brasilia")
        }else{
            updateLabels()
            updateNextPrevButtons()
        }
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
    
    
    @IBAction func didTapOnNext(_ sender: Any) {
        
        //increase current index
        currentIndex = currentIndex+1
        
        //update labels
        updateLabels()
        
        //udpate buttons
        updateNextPrevButtons()
    }
    
    
    @IBAction func didTapOnPrev(_ sender: Any) {
        
        //decrease current index
        currentIndex = currentIndex-1
        
        //update labels
        updateLabels()
               
        //udpate buttons
        updateNextPrevButtons()
        
    }
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var prevButton: UIButton!
    
    
    
    func updateFlashcard(question: String, answer: String) {
        
        let flashcard = Flashcard(question: question, answer: answer)
        frontLabel.text = flashcard.question
        backLabel.text = flashcard.answer
        
        //Adding flashcard in the flashcards array
        flashcards.append(flashcard)
        
        
        //Logging to the console
        print( "😎 Added new flashcard")
        print( "We now have \(flashcards.count) flashcards")
        
        //Update current index
        currentIndex = flashcards.count-1
        print( "😎 Our current index is \(currentIndex)")
        
        //Update buttons
        updateNextPrevButtons()
        
        //Update labels
        updateLabels()
        
        //call to save all flashcards
        saveAllFlashcardsToDisk()
    }
    
    func updateNextPrevButtons(){
        
        //Disable next button if at the end
        if currentIndex == flashcards.count-1{
            nextButton.isEnabled = false
        }else{
            nextButton.isEnabled = true
        }
        
        if currentIndex == flashcards.count-currentIndex{
                  prevButton.isEnabled = false
              }else{
                  prevButton.isEnabled = true
              }
        
    }
    
    func updateLabels(){
        
        //Get current flashcard
        let currentFlashcard = flashcards[currentIndex]
        
        //Update labels
        frontLabel.text = currentFlashcard.question
        backLabel.text = currentFlashcard.answer
    }
    
    func saveAllFlashcardsToDisk(){
        
        //From flashcard array to dictionary array
        let dictionaryArray = flashcards.map { (card) -> [String: String] in
            return ["question":card.question, "answer": card.answer]
        }
        
        //Save array on disk using UserDefaults
        UserDefaults.standard.set(dictionaryArray, forKey: "flashcards")
        
        //Log it
        print("🎉 Flashcards saveed to UserDefaults")
    }
    
    func readSavedFlashcards(){
        
        //Read dictionary array from disk (if any)
        if let dictionaryArray = UserDefaults.standard.array(forKey: "flashcard") as? [[String: String]]{
            
            //In here we know for sure we have a dictionary array
            let savedCards = dictionaryArray.map { dictionary -> Flashcard in
                return Flashcard(question: dictionary["question"]!, answer: dictionary["answer"]!)
            }
            
            //Put all these cards in our flashcards array
            flashcards.append(contentsOf: savedCards)
        }
    }
}
