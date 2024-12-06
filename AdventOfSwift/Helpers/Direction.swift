import Foundation

// MARK: - Direction

enum Direction {

    case north, east, south, west

    var step: Vec2 {
        switch self {
        case .north: return Vec2(0, -1)
        case .east: return Vec2(1, 0)
        case .south: return Vec2(0, 1)
        case .west: return Vec2(-1, 0)
        }
    }

    func advance(coord: Coord, distance: Int = 1) -> Coord {
        coord + distance * step
    }

    func turnedRight() -> Direction {
        switch self {
        case .north: return .east
        case .east: return .south
        case .south: return .west
        case .west: return .north
        }
    }

}
