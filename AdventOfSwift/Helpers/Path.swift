import Foundation

struct Path {

    private struct Step {
        let coord: Coord
        let direction: Direction
    }

    private var visited = Index<Coord, Step>()
    private var steps = [Step]()
    private(set) var hasLoop = false

    mutating func addStep(to coord: Coord, direction: Direction) {
        let makesLoop = (visited[coord] ?? []).contains {
            step in step.direction == direction
        }

        if makesLoop { hasLoop = true }

        let step = Step(coord: coord, direction: direction)
        steps.append(step)
        visited.insert(step, using: coord)
    }

    func visitedCoordinates() -> Set<Coord> { Set(visited.keys) }

}
