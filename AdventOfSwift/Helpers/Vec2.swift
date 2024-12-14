import Foundation

// MARK: - Coord

typealias Coord = Vec2

// MARK: - Vec2

struct Vec2 {
    let i, j: Int

    init(_ i: Int, _ j: Int) {
        self.i = i
        self.j = j
    }

    init(_ pair: (Int, Int)) {
        let (i, j) = pair
        self.init(i, j)
    }

}

// MARK: - Directions and Neighbours

extension Vec2 {

    static let directions = fromPairs(
        (0,1), (1,1), (1,0), (1,-1), (0,-1), (-1,-1), (-1,0), (-1,1)
    )

    static let cardinalDirections = fromPairs(
        (0,1), (1,0), (0,-1), (-1,0)
    )

    static func fromPairs(_ pairs: (Int, Int)...) -> [Vec2] {
        pairs.map { pair in Vec2(pair) }
    }

    func neighbours() -> [Vec2] {
        Self.directions.map { direction in self + direction }
    }

    func cardinalNeighbours() -> [Vec2] {
        Self.cardinalDirections.map { direction in self + direction }
    }

}

extension Array where Element == Vec2 {

    func containsNeighbourOf(
        _ coord: Vec2,
        cardinalsOnly: Bool = false
    ) -> Bool {
        let neighbours = cardinalsOnly
        ? coord.cardinalNeighbours()
        : coord.neighbours()

        return first { element in
            neighbours.contains(element)
        } != nil
    }

    func indicesNeighbouring(
        _ coord: Vec2,
        cardinalsOnly: Bool = false
    ) -> [Int] {
        let neighbours = cardinalsOnly
        ? coord.cardinalNeighbours()
        : coord.neighbours()

        return self.enumerated().compactMap { (index, element) in
            neighbours.contains(element) ? index : nil
        }
    }

    func corners() -> (Vec2, Vec2)? {
        guard count > 0 else { return nil }

        var (c1, c2) = (first!, last!)
        self.forEach { coord in
            if coord.i < c1.i { c1 = Vec2(coord.i, c1.j) }
            if coord.i > c2.i { c2 = Vec2(coord.i, c2.j) }
            if coord.j < c1.j { c1 = Vec2(c1.i, coord.j) }
            if coord.j > c2.j { c2 = Vec2(c2.i, coord.j) }
        }

        return (c1, c2)
    }

}

// MARK: - Negation

extension Vec2 {

    static prefix func - (value: Vec2) -> Vec2 { Vec2(-value.i, -value.j) }

}

// MARK: - Scalar Multiplication

extension Vec2 {

    static func * (lhs: Int, rhs: Vec2) -> Vec2 {
        Vec2(lhs * rhs.i, lhs * rhs.j)
    }

    static func * (lhs: Vec2, rhs: Int) -> Vec2 { rhs * lhs }

}

// MARK: - Additive Arithmetic

extension Vec2: AdditiveArithmetic {

    static var zero: Vec2 { return Vec2(0, 0) }

    static func + (lhs: Vec2, rhs: Vec2) -> Vec2 {
        return Vec2(lhs.i + rhs.i, lhs.j + rhs.j)
    }

    static func - (lhs: Vec2, rhs: Vec2) -> Vec2 {
        return Vec2(lhs.i - rhs.i, lhs.j - rhs.j)
    }

}

// MARK: - Hashable

extension Vec2: Hashable {}

// MARK: - Description

extension Vec2: CustomStringConvertible {

    var description: String {
        "[\(self.i),\(self.j)]"
    }

}
