import Foundation

// MARK: - Array Helpers

extension Array where Element: StringProtocol {

    var numbers: [Int] { self.map { str in Int(str)! } }

}

extension Array where Element: AdditiveArithmetic {

    var sum: Element { self.reduce(Element.zero, +) }

}

extension Array where Element: Comparable {

    func count(_ matching: Element) -> Int {
        self.count { element in element == matching }
    }

}

extension Array {

    func mapConsecutive<T>(_ transform: (Element, Element) -> T) -> [T] {
        guard var previous = self.first else { return [] }
        var result = [T]()
        self.dropFirst().forEach { element in
            result.append(transform(previous, element))
            previous = element
        }

        return result
    }

    func allSatisfyConsecutively(
        _ predicate: (Element, Element) -> Bool
    ) -> Bool {
        guard var previous = self.first else { return true }
        for element in self.dropFirst() {
            guard predicate(previous, element) else { return false }
            previous = element
        }

        return true
    }

}
