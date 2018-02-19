//
//  HangmanGame.swift
//  Hangman
//
//  Created by Anthony Tong on 2/18/18.
//  Copyright © 2018 iOS DeCal. All rights reserved.
//

import Foundation

class HangmanGame {
    
    public var answer: String;
    public var keyPhrase: [Character];
    public var guesses: [Character];
    public var blanks: [Character];
    public var hangmanState = 1
    public var gameOver = false;
    public var numGuessed = 0;
    public var numToBeGuessed = 0;
    public var winner = false;
    
    init() {
        let hangmanPhrases = HangmanPhrases()
        // Generate a random phrase for the user to guess
        let phrase: String = hangmanPhrases.getRandomPhrase()
        print(phrase)
        self.answer = phrase
        self.keyPhrase = [Character]()
        self.blanks = [Character]()
        for letter in phrase {
            if letter != " " {
                blanks.append("_")
                numToBeGuessed += 1;
            }
            else {
                blanks.append(" ")
            }
            keyPhrase.append(letter)
            
        }
        self.guesses = [Character]()
        self.hangmanState = 1
        self.numGuessed = 0
        
        print(numGuessed)
        print(numToBeGuessed)
        print(keyPhrase)
        print(blanks)
        print(hangmanState)
    }
    
    func update(guess: Character) {
        var numOfGuessCorrect = 0
        if blanks.contains(guess) || guesses.contains(guess) || guess == " " {
            return
        }
        for i in 0...(keyPhrase.count-1) {
            if guess == keyPhrase[i] {
                blanks[i] = guess
                numGuessed += 1
                numOfGuessCorrect += 1
            }
        }
        
        if numOfGuessCorrect <= 0 {
            hangmanState += 1
            guesses.append(guess)
        }
        if hangmanState >= 7 {
            gameOver = true
        }
        if numGuessed >= numToBeGuessed {
            winner = true
        }
    }
    
    

    
}
