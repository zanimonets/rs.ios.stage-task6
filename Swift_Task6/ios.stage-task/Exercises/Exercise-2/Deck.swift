import Foundation

protocol DeckBaseCompatible: Codable {
    var cards: [Card] {get set}
    var type: DeckType {get}
    var total: Int {get}
    var trump: Suit? {get}
}

enum DeckType:Int, CaseIterable, Codable {
    case deck36 = 36
}

struct Deck: DeckBaseCompatible {
    
    //MARK: - Properties
    
    var cards = [Card]()
    var type: DeckType
    var trump: Suit?
    
    var total:Int {
        return type.rawValue
    }
}

extension Deck {
    
    init(with type: DeckType) {
        self.type = type
        self.cards = createDeck(suits: [.clubs, .spades, .hearts, .diamonds], values: [.six, .seven, .eight,.nine, .ten, .jack, .queen, .king, .ace])
    }
    
    public func createDeck(suits:[Suit], values:[Value]) -> [Card] {
        var cards = [Card]()
        
        for suit in suits {
            for value in values {
                cards.append(Card(suit: suit, value: value))
            }
        }
        return cards
    }
    
    public mutating func shuffle() {
        cards.shuffle()
    }
    
    public mutating func defineTrump() {
        trump = cards.last?.suit
        setTrumpCards(for: trump!)
    }
    
    public mutating func initialCardsDealForPlayers(players: [Player]) {
        players.forEach() { p in
            p.hand = []
            p.hand?.append(contentsOf: cards.dropLast(6))
            cards.removeLast(6)
        }
    }
    
    public mutating func setTrumpCards(for suit:Suit) {
        cards.enumerated().forEach() { index, card in
            if card.suit == suit {
                self.cards[index].isTrump = true
            }
        }
    }
}

