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

// MARK: - Directions

extension Vec2 {

    static let directions = fromPairs(
        (0,1), (1,1), (1,0), (1,-1), (0,-1), (-1,-1), (-1,0), (-1,1)
    )

    static func fromPairs(_ pairs: (Int, Int)...) -> [Vec2] {
        pairs.map { pair in Vec2(pair) }
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

// MARK: -

extension Vec2: CustomStringConvertible {

    var description: String {
        "[\(self.i),\(self.j)]"
    }

}
