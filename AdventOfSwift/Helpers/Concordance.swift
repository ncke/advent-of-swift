import Foundation

// MARK: - Concordance

struct Concordance<Element: Hashable> {

    private let concordance: [Element: [Int]]

    init(_ array: [Element]) {
        var concordance = [Element: [Int]]()
        for (index, element) in array.enumerated() {
            concordance.collate(intoKey: element, index)
        }

        self.concordance = concordance
    }

    subscript(_ element: Element) -> [Int] { concordance[element] ?? [] }

    func mostCommonElement() -> Element? {
        concordance.keys.reduce((nil, 0)) { partial, element in
            let (_, maxCount) = partial
            let count = concordance[element]!.count
            return count > maxCount ? (element, count) : partial
        }.0
    }

}
