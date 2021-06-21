import Foundation

protocol CardBaseCompatible: Hashable, Codable {
    var suit: Suit {get}
    var value: Value {get}
    var isTrump: Bool {get}
    
    func hash(into hasher: inout Hasher)
}

enum Suit: Int, CaseIterable, Codable {
    case clubs
    case spades
    case hearts
    case diamonds
}

enum Value: Int, Codable {
    case six
    case seven
    case eight
    case nine
    case ten
    case jack
    case queen
    case king
    case ace
}

struct Card: CardBaseCompatible {
    let suit: Suit
    let value: Value
    var isTrump: Bool = false
    
    func hash(into hasher: inout Hasher) {
        
    }
    
    static func == (leftH: Self, rightH: Self) -> Bool {
        if (leftH.suit == rightH.suit) && (leftH.value == rightH.value) {
            return true }
        return false
    }
}

extension Card {
    
    func checkIfCanBeat(card: Card) -> Bool {
        if suit == card.suit {
            if value.rawValue > card.value.rawValue {
                return true
            }
        } else {
            if isTrump {
                return true
            }
        }
        return false
    }
    
    func checkValue(card: Card) -> Bool {
        return false
    }
}
