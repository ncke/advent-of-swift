import Foundation

// MARK: - Plutonian Pebbles

struct PlutonianPebbles {

    static func solve() {
        var stones = input.words.numbers

        func splitEvens(stone: Int) -> [Int]? {
            let str = String(stone)
            guard str.count % 2 == 0 else { return nil }
            let mid = str.index(str.startIndex, offsetBy: str.count / 2)
            let lhs = str[str.startIndex..<mid]
            let rhs = str[mid..<str.endIndex]
            return [Int(lhs)!, Int(rhs)!]
        }

        func blink(stones: [Int]) -> [Int] {
            stones.flatMap { stone in
                if let splits = splitEvens(stone: stone) { return splits }
                if stone == 0 { return [1] }
                return [stone * 2024]
            }
        }

        for i in 1...25 {
            let start = Date()
            stones = blink(stones: stones)
            let elapsed = -start.timeIntervalSinceNow
            print(i, stones.count, elapsed)
        }

        let s1 = stones.count

        printSolutions(s1, nil)
    }

}

// MARK: - Input

extension PlutonianPebbles {

    static let input = """
1950139 0 3 837 6116 18472 228700 45
"""

}
