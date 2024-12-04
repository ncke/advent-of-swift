import Foundation

// MARK: - IndexedGrid

class IndexedGrid<Element: Hashable>: Grid<Element> {

    private let index: [Element: [Coord]]

    override init(content: [[Element]]) {
        var index = [Element: [Coord]]()
        content.size.coordinates.forEach { coord in
            index.collate(intoKey: content[coord], coord)
        }

        self.index = index
        super.init(content: content)
    }

    func occurrences(of element: Element) -> [Coord] { index[element] ?? [] }

}
