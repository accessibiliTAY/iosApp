/*:
 # Basic Functions
 ---
 
 ## Topic Essentials
 Functions are defined blocks of code that allow us to perform specific tasks in our apps. They can range from simple calculations to taking input parameters and returning specific value types.
 
 ### Objectives
 + Create a simple function that prints out a string
 + Add a return type to the function and pass back a string value
 + Add a function parameter and use it in the print message
 
 [Next Topic](@next)
 
 */
// Basic function
func findNearestAlly(level: Int) -> String {
    print("Searching for ally above level \(level)")
    return "Argus"
}

var ally = findNearestAlly(level: 5)

/*:
 # Overloading Functions
 ---
 
 ## Topic Essentials
 Swift will let us have multiple functions with the same name as long as their function type, or signature, is different. This is called function overloading, and is very useful in cases when you may need constant functionality with dependent or computed results.
 
 ### Objectives
 + Create a base function with no parameters or return values
 + Create an overloaded function with an integer parameter
 + Create another overloaded function with two parameters and a return type
 
 [Previous Topic](@previous)                                                 [Next Topic](@next)

 */
// Base function
func attackEnemy() {
    print("Executing default attack...")
}

// Overloaded functions
func attackEnemy(damage: Int) {
    print("Attacking for \(damage)")
}

func attackEnemy(damage: Double, weapon: String) -> Bool {
    let attackSuccess = true
    print("Attacking enemy for \(damage) with \(weapon)")
    
    return attackSuccess
}

attackEnemy()
attackEnemy(damage: 34)
var enemyDefeated = attackEnemy(damage: 65.988, weapon: "Godly Glaive")

/*:
 # Complex Functions
 ---
 
 ## Topic Essentials
 Functions in Swift can go from simple to complex very quickly with multiple return types, optionals, and even default values.
 
 ### Objectives
 + Create a new function with an optinal return type
 + Create a an overloaded function with two return values
 + Create another overloaded function with two parameters, both with default values
 
 [Previous Topic](@previous)                                                 [Next Topic](@next)

 */
// Optional return value
func setupArenaMatch() -> Bool? {
    return nil
}

if let initSuccess = setupArenaMatch() {
    print("Level initialized: \(initSuccess)")
} else {
    print("Something went terribly wrong...")
}

// Multiple return values
func setupArenaMatch(levelName: String) -> (success: Bool, secretItem: String) {
    print("\(levelName) initialized...")
    return (true, "Minotaur's Head")
}

var levelDetails = setupArenaMatch(levelName: "Poison Flats")
levelDetails.secretItem
levelDetails.success

// Default values
func setupDefaultMatch(levelName: String = "Fire Marshes", opponents: Int = 3) {
    print("Arena match will take place in the \(levelName) between \(opponents) players!")
}

setupDefaultMatch()
setupDefaultMatch(levelName: "Poison Flats", opponents: 10)

/*:
 # Function Types
 ---
 
 ## Topic Essentials
 Every function has a type, or unique signature. Function types can be used in Swift like any other type, such as strings or integers. This can come in handy when you need to pass functions into other functions as parameters, or use them as return types.
 
 ### Objectives
 + Create a function that takes in an integer, multiplies it by 4 and returns it
 + Create another function that takes an integer and a function as parameters
 
 [Previous Topic](@previous)                                                 [Next Topic](@next)

 */
// Function types
func computeBonusDamage(baseDamage: Int) -> Int {
    return baseDamage * 4
}

// (Int) -> Int

// Functions as parameters
func dealDamage(baseDamage: Int, bonusDamage: (Int) -> Int) {
    let bonus = bonusDamage(baseDamage)
    print("Base Damage: \(baseDamage)\nBonus Damage: \(bonus)")
}

dealDamage(baseDamage: 55, bonusDamage: computeBonusDamage)

/*:
 # Understanding Closures
 ---
 
 ## Topic Essentials
 Like functions, closures are enclosed blocks of functionality but with more concise syntax. In Swift closures act like blocks or lambda expressions in other programming languages, allowing us to pass function-like operations around like variables.
 
 ### Objectives
 + Write an empty closure declaration
 + Create a closure that takes in an `Int` parameter and returns an `Int` value
 + Update the closure to use type inference and shorthand
 
 [Previous Topic](@previous)                                                 [Next Topic](@next)

 */
// Defining closures
var closure: () -> () = {}

// Initializing closures
var computeBonusDamage = { base in
    return base * 4
}

computeBonusDamage(25)

/*:
 # Using Closures IRL
 ---
 
 ## Topic Essentials
 There are several ways to use closures now that we know how their syntax works, including with Swift functions that perform operations based on predicates or as input parameters and return values for our own custom functions.
 
 ### Objectives
 + Call the `sorted` function on an array and use the closure to order the items
 + Create a function that takes in a closure as a parameter
 + Create another function that uses a closure as its return type
 + Understand the use cases of these different approaches
 
 [Previous Topic](@previous)                                                 [Next Topic](@next)
 
 */

// Test variables
var highScores = [3412, 0, 1988, 722]
var partyMembers = ["Harrison", "Steven", "Bob the Noob"]

// Existing functions with closures
var ascendingSort = highScores.sorted { (firstValue, secondValue) -> Bool in
    return firstValue < secondValue
}

print(ascendingSort)

// Using custom closures with functions
func activeMembers1(completion: ([String]) -> Void) {
    completion(partyMembers)
}

activeMembers1 { (members) in
    for name in members {
        print("\(name) is active!")
    }
}

func activeMembers1(members: [String]) -> () -> Void {
    let completion: () -> Void = {
        for name in members {
            print("\(name) is present!")
        }
    }
    
    return completion
}

var closureReturn = activeMembers1(members: partyMembers)
closureReturn()

/*:
 # Type Aliasing
 ---
 
 ## Topic Essentials
 Type aliasing is a great tool for combining complex or unwieldy custom values or collections of values into clearer types.
 
 ### Objectives
 + Create a typealias tuple with a type annotation
 + Create a typealias closure and give it a type annotation
 + Use the new tuple typealias as a functions return type
 + Use the new closure typealias as an input parameter for a function
 
 [Previous Topic](@previous)                                                 [Next Topic](@next)

 */
// Test variables
var partyMembers1 = ["Harrison", "Steven", "Bob the Noob"]

// Type alias as a return value
typealias AttackTuple = (name: String, damage: Int, rechargeable: Bool)

var sunStrike: AttackTuple = ("Sun Strike", 45, false)

func levelUpAttack(baseAttack: AttackTuple) -> AttackTuple {
    let increasedAttack: AttackTuple = (baseAttack.name, baseAttack.damage + 10, true)
    return increasedAttack
}

var poweredAttack = levelUpAttack(baseAttack: sunStrike)
    
// Type alias as a function parameter
typealias ArrayClosure = ([String]) -> Void

func activeMembers(completion: ArrayClosure) {
    completion(partyMembers1)
}

activeMembers { (members) in
    for name in members {
        print("\(name) is active")
    }
}
