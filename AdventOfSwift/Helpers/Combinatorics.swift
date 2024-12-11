import Foundation

// MARK: - Combinations

extension RandomAccessCollection where
    Self.Index: Strideable,
    Self.Index.Stride: SignedInteger
{

    func combinations(_ n: Int, current: [Element] = []) -> [[Element]] {
        n <= 0 ? [current] : (self.startIndex..<self.endIndex).flatMap {
            index in

            self[index.advanced(by: 1)..<self.endIndex]
                .combinations(n - 1, current: current + [self[index]])
        }
    }

}

extension Set {

    func combinations(_ n: Int, current: [Element] = []) -> [[Element]] {
        Array(self).combinations(n)
    }

}

// MARK: - Permutations

extension Set {

    func permutations(
        _ n: Int,
        allowRepetition: Bool = false
    ) -> [[Element]]  {
        n <= 0 ? [[]] : self.flatMap { element in
            var permuteSet = self
            if !allowRepetition { permuteSet.remove(element) }

            return permuteSet.permutations(
                n - 1,
                allowRepetition: allowRepetition)
            .map { sub in [element] + sub }
        }
    }

}
