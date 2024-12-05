import Foundation

// MARK: - String Helpers

extension StringProtocol where SubSequence == Substring {

    var lines: [Substring] {
        self.split(separator: /\n+/)
    }

    var words: [Substring] {
        self.split(separator: /\s+/)
    }

    var commaSeparatedValues: [Substring] {
        self.split(separator: /,/)
    }

    var columns: [[Substring]] {
        self.lines.reduce(into: []) { partial, substring in
            let wds = substring.words
            if partial.isEmpty {
                partial = [[Substring]](repeating: [], count: wds.count)
            }
            for (index, wd) in wds.enumerated() {
                partial[index].append(wd)
            }
        }
    }

    func at(_ index: Int) -> Character {
        let stringIndex = String.Index(utf16Offset: index, in: self)
        return self[stringIndex]
    }

}
