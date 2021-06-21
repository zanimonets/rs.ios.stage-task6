//
//  Game.swift
//  DurakGame
//
//  Created by Дима Носко on 16.06.21.
//

import Foundation

protocol GameCompatible {
    var players: [Player] { get set }
}

struct Game: GameCompatible {
    var players: [Player]
}

extension Game {
    
    func defineFirstAttackingPlayer(players: [Player]) -> Player? {
        if players.count == 0 {
            return nil
        }
        else if players.count == 1 {
            return players[0]
        }
        
        var minCard = players[0].hand?[0]
        var attacker = players[0]
        
        for player in players {
            guard let hand = player.hand else {
                return nil
            }
            for card in hand {
                guard let minCardValue = minCard?.value.rawValue else { return nil }
                
                if (card.isTrump) && (card.value.rawValue <= minCardValue) {
                    minCard = card
                    attacker = player
                }
            }
        }
        return attacker
    }
}
