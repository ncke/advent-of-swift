import Foundation

// MARK: - Size

struct Size {

    let dimensions: Vec2

    var width: Int { dimensions.i }

    var height: Int { dimensions.j }

    init(_ width: Int, _ height: Int) {
        self.dimensions = Vec2(width, height)
    }

    var coordinates: [Coord] {
        (0..<dimensions.j).flatMap { y in
            (0..<dimensions.i).map { x in Coord(x, y) }
        }
    }

    func contains(_ coord: Coord) -> Bool {
        (0..<dimensions.j).contains(coord.j)
            && (0..<dimensions.i).contains(coord.i)
    }

}
