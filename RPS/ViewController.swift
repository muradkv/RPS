//
//  ViewController.swift
//  RPS
//
//  Created by murad on 10/07/2019.
//  Copyright © 2019 murad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var sign: UILabel!
    @IBOutlet var statusGame: UILabel!
    @IBOutlet var rock: UIButton!
    @IBOutlet var scissors: UIButton!
    @IBOutlet var paper: UIButton!
    @IBOutlet var playAgain: UIButton!
    
    var userChoice: Sign = randomSign()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
  
        playAgain.isHidden = true
        
    }
    
    func updateUI(param: GameState) {
        playAgain.isHidden = false
        
        switch param {
        case .win:
            statusGame.text = "You Win!"
        case .lose:
            statusGame.text = "You Lose!"
        case .draw:
            statusGame.text = "It's draw."
        case .start:
            statusGame.text = "Rock, Paper, Scissors?"
            playAgain.isHidden = true
            rock.isHighlighted = false
            paper.isHighlighted = false
            scissors.isHighlighted = false
            disableButtons(false)
            sign.text = "🤖"
        }
    }
    
    func disableButtons(_ bool: Bool) {
        if bool {
            rock.isEnabled = false
            scissors.isEnabled = false
            paper.isEnabled = false
        } else {
            rock.isEnabled = true
            scissors.isEnabled = true
            paper.isEnabled = true
        }
    }
    
    func whoWin() -> GameState {
        let robotChoice: Sign = randomSign()
        let result = userChoice.compare(withOpponentsSign: robotChoice)
        sign.text = robotChoice.emoji
        return result
    }

    @IBAction func rockTapped(_ sender: UIButton) {
        userChoice = .rock
        let result = whoWin()
        updateUI(param: result)
        
        paper.isHighlighted = true
        scissors.isHighlighted = true
        disableButtons(true)
    }
    
    @IBAction func scissorsTapped(_ sender: UIButton) {
        userChoice = .scissor
        let result = whoWin()
        updateUI(param: result)
        
        rock.isHighlighted = true
        paper.isHighlighted = true
        disableButtons(true)
    }
    
    @IBAction func paperTapped(_ sender: UIButton) {
        userChoice = .paper
        let result = whoWin()
        updateUI(param: result)
        
        rock.isHighlighted = true
        scissors.isHighlighted = true
        disableButtons(true)
    }
    
    @IBAction func playAgainTapped(_ sender: UIButton) {
        updateUI(param: GameState.start)
    }
}

