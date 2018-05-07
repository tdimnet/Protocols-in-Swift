enum Direction {
    case up
    case down
    case left
    case right
}

protocol Movable {
    func move(_ direction: Direction, by distance: Int)
}

protocol Destructable {
    func decreaseLife(by factor: Int)
}

protocol Player: Destructable {
    var position: Point { get set }
    var life: Int { get set }
    
    init(x: Int, y: Int)
}

protocol Attacker {
    var strength: Int { get }
    var range: Int { get }
    
    func attack(player: Player)
}


struct Point {
    let x: Int
    let y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    /// Returns the surrounding points in range of
    /// the current one
    func points(inRange range: Int = 1) -> [Point] {
        var results = [Point]()
        
        let lowerBoundOfXRange = x - range
        let upperBoundOfXRange = x + range
        
        let lowerBoundOfYRange = y - range
        let upperBoundOfYRange = y + range
        
        for xCoordinate in lowerBoundOfXRange...upperBoundOfXRange {
            for yCoordinate in lowerBoundOfYRange...upperBoundOfYRange {
                let coordinatePoint = Point(x: xCoordinate, y: yCoordinate)
                results.append(coordinatePoint)
            }
        }
        
        return results
    }
}

// Enemy
class Enemy: Player, Attacker, Movable {
    var life: Int = 2
    var position: Point
    var strength: Int = 5
    var range: Int = 2
    
    required init(x: Int, y: Int) {
        self.position = Point(x: x, y: y)
    }
    
    func decreaseLife(by factor: Int) {
        life -= factor
    }
    
    func attack(player: Player) {
        player.decreaseLife(by: strength)
    }
    
    func move(_ direction: Direction, by distance: Int) {
        switch direction {
        case Direction.up: position = Point(x: position.x, y: position.y + 1)
        case Direction.down: position = Point(x: position.x, y: position.y - 1)
        case Direction.left: position = Point(x: position.x - 1, y: position.y)
        case Direction.right: position = Point(x: position.x + 1, y: position.y)
        }
    }
}

// Tower
class Tower {
    let position: Point
    var range: Int = 1
    var strength: Int = 1
    
    init(x: Int, y: Int) {
        self.position = Point(x: x, y: y)
    }
    
    func fire(at enemy: Enemy) {
        if isInRange(of: enemy) {
            enemy.decreaseLife(by: strength)
            print("Gotcha")
        } else {
            print("Darn! Out of range!")
        }
    }
    
    func isInRange(of enemy: Enemy) -> Bool {
        let availablePositions = position.points(inRange: range)
        
        for point in availablePositions {
            if point.x == enemy.position.x && point.y == enemy.position.y {
                return true
            }
        }
        
        return false
    }
}
