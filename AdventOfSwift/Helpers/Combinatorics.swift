import Foundation

extension Set {

    func combinationsWithRepetition(_ n : Int) -> [[Element]]  {
        n <= 0 ? [[]] : self.flatMap { element in
            combinationsWithRepetition(n - 1).map { sub in [element] + sub }
        }
    }

}
