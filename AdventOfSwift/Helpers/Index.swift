import Foundation

// MARK: - Index

typealias Index<Key: Hashable, Element> = [Key: [Element]]

extension Dictionary where Value: RangeReplaceableCollection {

    mutating func collate(
        _ sequence: any Sequence<Value.Element>,
        using key: Key
    ) {
        sequence.forEach { element in
            insert(element, using: key)
        }
    }

    mutating func insert(_ element: Value.Element, using key: Key) {
        if var array = self[key] {
            array.append(element)
            self[key] = array
        } else {
            self[key] = [element] as? Value
        }
    }

    func mostCommonKey() -> Key? {
        keys.reduce((nil, 0)) { partial, element in
            let (_, maxCount) = partial
            let count = self[element]!.count
            return count > maxCount ? (element, count) : partial
        }.0
    }

    func pairs() -> [(Key, Value.Element)] {
        keys.flatMap { key in self[key]!.map { value in (key, value) } }
    }

}

// MARK: - Concordance

extension Sequence where Element: Hashable {

    func concordance() -> Index<Element, Int> {
        var index = Index<Element, Int>()
        for (i, element) in self.enumerated() {
            index.insert(i, using: element)
        }

        return index
    }

}
