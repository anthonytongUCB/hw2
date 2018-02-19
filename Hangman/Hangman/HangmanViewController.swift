//
//  HangmanViewController.swift
//  Hangman
//
//  Created by Anthony Tong on 2/18/18.
//  Copyright © 2018 iOS DeCal. All rights reserved.
//

import UIKit

class HangmanViewController: UIViewController {
    
    var currentHangmanGame = HangmanGame()
    
    @IBOutlet weak var guessTextField: UITextField!
    
    @IBOutlet weak var hangmanImage: UIImageView!
    
    @IBOutlet weak var hangmanBlanks: UILabel!
    
    @IBOutlet weak var wrongGuesses: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentHangmanGame = HangmanGame()
        let blanks = makeString(charArray: currentHangmanGame.blanks)
        hangmanBlanks?.text = blanks
        let state = String(describing: currentHangmanGame.hangmanState)
        hangmanImage.image = UIImage(named: "hangman" + state)
        guessTextField.text = "";
        wrongGuesses?.text = "Incorrect Guesses: " + makeString(charArray: currentHangmanGame.guesses)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func makeGuess(_ sender: UIButton) {
        var text: Character
        if let textField = guessTextField {
            if textField.text!.count <= 0 || textField.text!.count > 1 {
                return
            }
            text = Character(textField.text!)
            currentHangmanGame.update(guess: text)
        }
        let state = String(describing: currentHangmanGame.hangmanState)
        hangmanImage.image = UIImage(named: "hangman" + state)
        let blanks = makeString(charArray: currentHangmanGame.blanks)
        hangmanBlanks?.text = blanks
        print(blanks)
        guessTextField.text = "";
        wrongGuesses?.text = "Incorrect Guesses: " + makeString(charArray: currentHangmanGame.guesses)
        
        if currentHangmanGame.gameOver {
            let alertController = UIAlertController(title: "Game Over", message: "The Answer was: " + currentHangmanGame.answer, preferredStyle: .alert)
            
            let action = UIAlertAction(title: "New Game", style: .default) { (action:UIAlertAction) in
                print("Starting New Game...");
                self.viewDidLoad()
            }
            alertController.addAction(action)
            self.present(alertController, animated: true, completion: nil)
        }
        
        if currentHangmanGame.winner {
            let alertController = UIAlertController(title: "You Win!", message: "The Answer was: " + currentHangmanGame.answer, preferredStyle: .alert)
            
            let action = UIAlertAction(title: "New Game", style: .default) { (action:UIAlertAction) in
                print("Starting New Game...");
                self.viewDidLoad()
            }
            alertController.addAction(action)
            self.present(alertController, animated: true, completion: nil)
        }
        
    }
    
    func makeString(charArray: [Character]) -> String {
        var str = ""
        var i = 0;
        for char in charArray {
            if char == " " && i > 8 {
                str += "\n"
                i = 0
            }
            else {
                str += String(char) + " "
            }
            i += 1
        }
        return str
    }
    
    @IBAction func startOver(_ sender: UIButton) {
        self.viewDidLoad()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
