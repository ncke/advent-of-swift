import Foundation

// MARK: - Direction

enum Direction: CaseIterable {

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

    var orthogonals: (Direction, Direction) {
        switch self {
        case .north, .south: return (.east, .west)
        case .east, .west: return (.north, .south)
        }
    }

    var opposite: Direction {
        switch self {
        case .north: return .south
        case .east: return .west
        case .south: return .north
        case .west: return .east
        }
    }

}

// MARK: - Vec2

extension Vec2 {

    func advanced(_ direction: Direction) -> Vec2 { self + direction.step }

}

// MARK: - Description

extension Direction: CustomStringConvertible {

    var description: String {
        switch self {
        case .north: return "north"
        case .south: return "south"
        case .east: return "east"
        case .west: return "west"
        }
    }

}
