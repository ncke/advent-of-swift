import Foundation

// MARK: - Concordance

struct Concordance<Element: Hashable> {

    private var concordance: [Element: [Int]]

    init(_ array: [Element]) {
        concordance = [:]

        for (index, element) in array.enumerated() {
            concordance.collate(intoKey: element, index)
        }
    }

    subscript(_ element: Element) -> [Int] {
        concordance[element] ?? []
    }

    func mostCommonElement() -> Element? {
        guard
            var commonElement = concordance.keys.first,
            var commonCount = concordance[commonElement]?.count
        else {
            return nil
        }

        for element in concordance.keys {
            let count = concordance[element]!.count
            if count > commonCount {
                commonElement = element
                commonCount = count
            }
        }

        return commonElement
    }

}
