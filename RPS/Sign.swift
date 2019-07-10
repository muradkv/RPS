//
//  Sign.swift
//  RPS
//
//  Created by murad on 10/07/2019.
//  Copyright © 2019 murad. All rights reserved.
//

import Foundation
import GameplayKit

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

func randomSign() -> Sign {
    let sign = randomChoice.nextInt()
    
    if sign == 0 {
        return Sign.rock
    } else if sign == 1 {
        return Sign.paper
    } else {
        return Sign.scissor
    }
}

enum Sign {
    case rock
    case paper
    case scissor
    
    var emoji: String {
        switch self {
        case .rock:
            return "👊"
        case .paper:
            return "✋"
        case .scissor:
            return "✌️"
        }
    }
    
    func compare(withOpponentsSign sign: Sign) -> GameState {
        switch self {
        case .paper:
            switch sign {
            case .paper:
                return GameState.draw
            case .rock:
                return GameState.win
            case .scissor:
                return GameState.lose
            }
        case .rock:
            switch sign {
            case .paper:
                return GameState.lose
            case .rock:
                return GameState.draw
            case .scissor:
                return GameState.win
            }
        case .scissor:
            switch sign {
            case .paper:
                return GameState.win
            case .rock:
                return GameState.lose
            case .scissor:
                return GameState.draw
            }
        }
    }
}
