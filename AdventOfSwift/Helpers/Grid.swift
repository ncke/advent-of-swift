import Foundation

// MARK: - Grid

/// A grid of Element values that is addressable by coordinate.
class Grid<Element> {

    private var content: [[Element]]

    var size: Size

    init(content: [[Element]]) {
        self.content = content
        self.size = content.size
    }

    convenience init(string: String) where Element == Character {
        let content = Grid.extractFromString(string)
        self.init(content: content)
    }

    subscript(_ coord: Coord) -> Element? {
        get { size.contains(coord) ? content[coord.j][coord.i] : nil }
        set { content[coord.j][coord.i] = newValue! }
    }

}

// MARK: - Extraction

extension RandomAccessCollection where Element: RandomAccessCollection {

    subscript(_ coord: Coord) -> Element.Element {
        let y = index(self.startIndex, offsetBy: coord.j)
        let row = self[y]
        let x = row.index(row.startIndex, offsetBy: coord.i)
        return row[x]
    }

    var size: Size {
        let height = self.count
        return Size(height > 0 ? self.first!.count : 0, height)
    }

}

extension Grid {

    private static func extractFromString(_ string: String) -> [[Character]] {
        string.lines.map { line in
            (0..<line.count).map { index in line.at(index) }
        }
    }

}

// MARK: - Comparison

extension Grid where Element: Equatable {

    func countOccurrences(of element: Element) -> Int {
        size.coordinates.count { coord in self[coord] == element }
    }

}

// MARK: - Description

extension Grid: CustomStringConvertible where Element: CustomStringConvertible {

    var description: String {
        var desc = ""
        for y in 0..<size.height {
            for x in 0..<size.width {
                desc += content[Vec2(x, y)].description
            }
            desc += "\n"
        }

        return desc
    }

}
