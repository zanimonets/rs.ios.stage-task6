import Foundation

class CoronaClass {
    
    var seats = [Int]()
    let deskInClass : Int
    
    init(n: Int) {
        deskInClass = n
    }
    
    func seat() -> Int {
        if seats.isEmpty {
            seats.append(0)
            return 0
        }
        
        return 0
    }
    
    func leave(_ p: Int) {
        
    }
}
