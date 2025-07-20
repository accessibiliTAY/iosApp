/*:
 # Basic Swift Classes
 ---
 
 ## Topic Essentials
 Even though swift has an entire library of built-in classes and structs for us to use in our applications, we’ll still need to know how to create our own. These data structures can have properties, methods, initializers, and in the case of classes can have their own subclasses.
 
 ### Objectives
 + Create a simple class called **Adventurer**
 + Declare instance properties with or without values
 + Define designated and convenience initializers
 + Understand reference type behavior
 
 [Next Topic](@next)
 
 */
// Declaring a new class
class Adventurer {
    var name: String
    let maxHealth: Int
    
    var specialMove: String?
    
    init(name: String, maxHP: Int) {
        self.name = name
        self.maxHealth = maxHP
    }
    
    convenience init(name: String) {
        self.init(name: name, maxHP: 100)
    }
    
    func printStats() {
        print("Character: \(self.name), Max Health: \(self.maxHealth)")
    }
}

var player1 = Adventurer(name: "Harrison", maxHP: 99)
var player2 = Adventurer(name: "Steven")
var defaultPlayer = player1
defaultPlayer.name = "Bob the Noob"
player1.name = "Harrison"

player1.printStats()
player2.printStats()


/*:
 # Access Modifiers and Properties
 ---
 
 ## Topic Essentials
 Like most programming languages, swift allows you to limit, or control, how classes, structs, properties, and other entities are accessed based on the module or file they’re in. There are four levels of access in swift, public, internal, file private, and private.
 
 Swift also allows properties to be declared as static, class, read-only and read-write.
 
 ### Objectives
 + Explore the four available access levels
 + Add a read-only (computed) property to Adventurer
 + Add a read-write property to Adventurer
 + Add a static and class property to Adventurer
 
 [Previous Topic](@previous)                                                 [Next Topic](@next)

 */
// Test class
class Adventurer1 {
    var name: String
    var specialMove: String?
    let maxHealth: Int
    
    var healthLost: Int {
        return maxHealth - health
    }
    
    static var maxActivePlayers = 10
    
    class var credo: String {
        return "Defend the helpless!"
    }
    
    fileprivate var health: Int
    var Health: Int {
        get { return health }
        set {
            if(newValue <= 100) {
                health = newValue
            }
        }
    }
        
    init(name: String, maxHP: Int) {
        self.name = name
        self.maxHealth = maxHP
        self.health = maxHP
    }
    
    convenience init(name: String) {
        self.init(name: name, maxHP: 100)
    }
    
    func printStats() {
        print("Character: \(self.name), Health: \(self.health)/\(self.maxHealth)")
    }
}

var player1b = Adventurer1(name: "Harrison", maxHP: 99)
var player2b = Adventurer1(name: "Steven")

Adventurer1.credo
Adventurer1.maxActivePlayers

player1b.printStats()
player2b.printStats()


/*:
 # Subclassing in Swift
 ---
 
 ## Topic Essentials
 A great way to expand the flexibility of your custom classes is to create subclasses that share the functionality of a parent class.
 
 ### Objectives
 + Create a new class called **Ranger** as a subclass of **Adventurer**
 + Set up it's designated initializer
 + Override the parent class instance method and class property
 
 [Previous Topic](@previous)                                                 [Next Topic](@next)

 */
//Parent class
class Adventurer2 {
    var name: String
    var specialMove: String?
    let maxHealth: Int
    
    fileprivate var health: Int
    var Health: Int {
        get { return health }
        set {
            if (newValue <= 100) {
                health = newValue
            }
        }
    }
    
    static var maxActivePlayers: Int {
        return 10
    }
    
    class var credo: String {
        return "Defend the helpless!"
    }
    
    init(name: String, maxHP: Int) {
        self.name = name
        self.maxHealth = maxHP
        self.health = maxHP
    }
    
    convenience init(name: String) {
        self.init(name: name, maxHP: 100)
    }
    
    func printStats() {
        print("Character: \(self.name), Health: \(self.health)/\(self.maxHealth)")
    }
}

// Subclass
class Ranger: Adventurer2 {
    var classAdvantage: String
    
    override class var credo: String {
        return "To the King!"
    }
    
    init(name: String, advantage: String) {
        self.classAdvantage = advantage
        super.init(name: name, maxHP: 150)
    }
    
    override func printStats() {
        print("\(self.name): Ranger, Advantage: \(self.classAdvantage)")
    }
}

var player1a = Adventurer2(name: "Harrison", maxHP: 99)
player1a.printStats()
Adventurer2.credo
Ranger.credo

var aragorn = Ranger(name: "Aragorn", advantage: "Stealth")
aragorn.printStats()


/*:
 # Basic Swift Structs
 ---
 
 ## Topic Essentials
 Swift structures share a very similar syntax and functionality, but they are useful for creating different kinds of instances. While classes are well suited to complex data structures and are passed by reference, structs are passed by value and better suited to creating simple instances that don't need inheritance or reference capabilities.
 
 ### Objectives
 + Declare a basic struct called **Level**
 + Assign a few instance properties
 + Define two custom initializers
 + Add non-mutating and mutating functions
 
 [Previous Topic](@previous)                                                 [Next Topic](@next)

 */
// Declaring a new struct
struct Level {
    let levelID: Int
    var levelObjectives: [String]
    
    var levelDescription: String {
        return "Level ID: \(self.levelID)"
    }
    
    init(id: Int, objectives: [String]) {
        self.levelID = id
        self.levelObjectives = objectives
    }
    
    func queryObjectives() {
        for objective in levelObjectives {
            print("\(objective)")
        }
    }
    
    mutating func completeObjective(index: Int) {
        levelObjectives.remove(at: index)
    }
}
    

var objectives = ["Find the lost cat", "Collect all gemstones", "Defeat the Big Boss"]
var level1 = Level(id: 1, objectives: objectives)

// Value types again
var defaultLevel = level1

level1.completeObjective(index: 0)
level1.queryObjectives()

defaultLevel.queryObjectives()

/*:
 # Chaining Optionals
 ---
 
 ## Topic Essentials
 Optional chaining allows you to unwrap an optional type that has optional properties of its own. This is most common in classes or structs that contain optional types. It’s handy to think of optional chains in a very literal sense, like a chain link. If all the links are present and strong, the chain continues, but if one link fails, the chain breaks.
 
 ### Objectives
 +
 
 [Previous Topic](@previous)                                                 [Next Topic](@next)

 */
// Test variables
struct Item {
    var description: String
    var previousOwner: Owner?
}

struct Owner {
    var name: String
    
    func returnOwnerInfo() -> String {
         return "\(name) is the current owner!"
    }
}

var questDirectory = [
    "Fetch Gemstones": [
        "Objective": "Retrieve 5 gemstones",
        "Secret": "Complete in under 5 minutes"
    ],
    "Defeat Big Boss": [
        "Objective": "Beat the ultimate boss",
        "Secret": "Win with 50% health left"
    ]
]

// Creating the chain
var rareDagger = Item(description: "A unique dagger of unknown origin", previousOwner: nil)
var daggerOwner = Owner(name: "The Great Thief")
rareDagger.previousOwner = daggerOwner
rareDagger.previousOwner?.name = "The Old Merchant"

if let owner = rareDagger.previousOwner?.name {
    print("This item used to be owned by \(owner)")
} else {
    print("Looks like this items history is unknown...")
}

if let ownerInfo = rareDagger.previousOwner?.returnOwnerInfo() {
    print("Owner found!")
} else {
    print("No owner in our records...")
}

if let gemstoneObjective = questDirectory["Fetch Gemstones"]?["Objective"] {
    print(gemstoneObjective)
}
