/*:
 # Swift Enumerations
 ---
 
 ## Topic Essentials
 Swift enumerations allow you to put related values together into a group that you can use and access. Like switch statements, each value in an enum is considered a different case, which is one of the many reasons they go so well together.
 
 ### Objectives
 + Declare a basic enum called **GameState**
 + Store an enum case as a variable and print out its value
 + Use a switch statement to define actions for each enum case
 + Understand default cases and the **@unknown** keyword
 
 [Next Topic](@next)
 
 */
// Declaring an enum
enum GameState {
    case Completed
    case Initializing
    case LoadingData
    case Restarting
}

//enum GameState { case Completed, Initializing, LoadingData }

// Storing and switching on an enum value
var currentState = GameState.Completed
print("Current state is \(currentState)")

switch currentState {
case .Completed:
    print("Completed processing all tasks...")
case .Initializing:
    print("Still initializing data...")
case .LoadingData:
    print("Player data correctly unpacked...")
@unknown default:
    print("Unknown game state detected...")
}

/*:
 # Raw and Associated Values
 ---
 
 ## Topic Essentials
 Enumerations can be expanded to include raw values, which can store unique or sequential values, or associated values, which can capture case specific parameters for use in their respective code blocks.
 
 ### Objectives
 + Declare an enum with a raw value
 + Declare an enum with associated values
 + Add a method inside the enum to execute a switch statement for each case
 
 [Previous Topic](@previous)                                                 [Next Topic](@next)

 */
// Raw values
enum NonPlayableCharacters: String {
    case Villager = "Common, not much useful info there"
    case Blacksmith = "One per village, will have quest information"
    case Merchant = "No limit per village, will make you cool stuff"
}

var blacksmith = NonPlayableCharacters.Blacksmith
print(blacksmith.rawValue)

// Associated values
enum PlayerState {
    case Alive
    case KO(level: Int)
    case Unknown(debugError: String)
    
    func evaluateCase() {
        switch self {
        case .Alive:
            print("Still kicking!")
        case .KO(let restartLevel):
            print("Sorry, back to level \(restartLevel) for you...")
        case .Unknown(let message):
            print(message)
        default:
            print("Unknown state encountered...")
        }
    }
}

PlayerState.KO(level: 1).evaluateCase()

/*:
 # Introducing Protocols
 ---
 
 ## Topic Essentials
 Swift protocols are essentially groups of properties and behaviors that can be adopted by a class or struct. If a class or struct implements a protocol, that class or struct enters into an agreement that says they will follow the blueprint the protocol has set out.
 
 ### Objectives
 + Declare a protocol
 + Add properties, a function and an initializer
 + Create a struct that adopts the protocol
 + Adopt multiple protocols
 
 [Previous Topic](@previous)                                                 [Next Topic](@next)
 
 */
// Declare a protocol
protocol Collectable {
    var name: String { get }
    var price: Int { get set }
    
    init(withName: String, startingPrice: Int)
    func collect() -> Bool
}

extension Collectable {
    var priceIncrease: Int {
        return self.price * 10
    }
    
    init(name: String) {
        self.init(withName: name, startingPrice: 100)
    }
    
    func collect() -> Bool {
        print("Default item couldn't be collected...")
        return false
    }
}

protocol Usable {
    func use()
}

// Protocol adoption
class Item: Collectable, Usable {
    var name: String
    var price: Int
    
    required init(withName: String, startingPrice: Int) {
        self.name = withName
        self.price = startingPrice
    }
    
//    func collect() -> Bool {
//        print("Item collected!")
//        return true
//    }
    
    func use() {
        print("Item used!")
    }
}

let potion = Item(withName: "High Potion", startingPrice: 35)
potion.collect()
potion.use()

let antidote = Item(name: "Antidote")
antidote.price

extension String {
    func fancyDebug() {
        print("This string has \(self.count) characters")
    }
}

antidote.name.fancyDebug()


/*:
 # Using Extensions
 ---
 
 ## Topic Essentials
 Any class, struct, or protocol can be extended, regardless of whether you created it or it's part of the Swift language. Extensions can either be used to add default implementations of existing features, or new computed properties and functions.
 
 ### Objectives
 + Extend a custom protocol
 + Add computed properties and convenience initializer
 + Create a default function implementation
 + Extend an existing Swift class
 
 [Previous Topic](@previous)                                                 [Next Topic](@next)
 
 */
// added to example above

/*:
 # Throwing Errors
 ---
 
 ## Topic Essentials
 Optionals are great for handling values that might be nil, but optionals alone won't account for situations when you need the program to send out and interpret an error. Swift makes throwing and responding to errors almost second nature, allowing you to customize how your code responds to unexpected actions.
 
 ### Objectives
 + Declare an error enumeration
 + Create a function that can throw an error
 + Use the **try** keyword to call throwing functions
 
 [Previous Topic](@previous)                                                 [Next Topic](@next)
 
 */
// Error enum
enum DataError: Error {
    case EmptyPath
    case InvalidPath
}

// Throwing functions
func loadData(path: String) throws {
    guard path.contains("/") else {
        throw DataError.InvalidPath
    }
    
    guard !path.isEmpty else {
        throw DataError.EmptyPath
    }
}

/*:
 # Handling Errors
 ---
 
 ## Topic Essentials
 Errors that are thrown from functions need to be handled with a combination of the **try** keyword and a **do-catch** statement. The idea behind this is delegation - where do we want to send out an error and how does it need to be addressed.
 
 ### Objectives
 + Understand error propagation
 + Use the **do-catch** statement to handle errors effectively
 
 [Previous Topic](@previous)
 
 */
// Test code
enum DataError1: Error {
    case EmptyPath
    case InvalidPath
}

let playerDataPath = "/example/data.txt"

func loadData1(path: String) throws -> Bool? {
    guard path.contains("/") else {
        throw DataError1.InvalidPath
    }
    
    guard !path.isEmpty else {
        throw DataError1.EmptyPath
    }
    
    return true
}

// Do-Catch statements
do {
    try loadData1(path: playerDataPath)
    print("Data fetch successful!")
} catch is DataError {
    print("Invalid or empty path detected...")
} catch {
    print("Unknown error detected...")
}

if let dataLoaded1 = try? loadData(path: playerDataPath) {
    print("Data fetch went just fine...")
}

// Propagating errors
func propagateDataError() throws {
    try loadData1(path: playerDataPath)
}

do {
    try propagateDataError()
    print("Propagated data fetch successful!")
} catch DataError1.EmptyPath {
    print("Empty path detected...")
} catch DataError1.InvalidPath {
    print("Invalid path detected...")
} catch {
    print("Unknown error...")
}

