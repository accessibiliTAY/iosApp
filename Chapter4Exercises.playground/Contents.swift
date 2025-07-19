/*:
 # The IF Statement
 ---
 
 ## Topic Essentials
 If statements are the simplest way to execute conditions in code. An if statement will only execute if some condition is met, or not met, as the case may be.
 
 If statements are best suited to handling decision trees with 3 branching options or less. If you find yourself with an if-else statement extending beyond a few conditions, it’s probably time to consider using a switch statement instead.
 
 ### Objectives
 + Create two variables called **hp** and **maxHP**
 + Write an if-else statement to handle if **hp** drops below **maxHP**
 + Add an else-if statement to handle if **hp** is less than or equal to 50
 + Add a fall-through case to account for all other possible outcomes
 
 [Next Topic](@next)

 */
// Test variables
var currentHealth = 100
var maxHealth = 100

// If statement (<, >, <=, >=, !=, ==)
if currentHealth >= maxHealth {
    print("HP is at maximum")
} else if currentHealth <= 50 {
    print("Grab some health soon!")
} else {
    print("HP is between 50 and 100")
}

if currentHealth > 90 || currentHealth <= maxHealth {
    print("You're doing just fine...")
}

/*:
 # Unwrapping Optionals
 ---
 
 ## Topic Essentials
 Optional unwrapping uses a variation of the if statement to safely check for nil values without crashing the code. If a value exists it will be stored in a local variable that's only accessible within the body of the if statement.

 
 ### Objectives
 + Use optional binding to unwrap a single optional
 + Unwrap multiple optionals in a single line of code for more compact structure
 + Unwrap nested optional values
 
 [Previous Topic](@previous)                                                 [Next Topic](@next)

 */
// Test variables
var itemGathered: String? = "Diamond Longsword"
var isShopOpen: Bool?

var blacksmithShop: [String: Int] = ["Bottle": 10, "Shield": 15, "Ocarina": 100]
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

// Optional binding
if let item = itemGathered {
    print("You found an \(item)")
} else {
    print("Sorry, no item found")
}

if let shopOpen = isShopOpen, let searchedItem = blacksmithShop["Shield"] {
    print("We're open \(shopOpen) and we have a \(searchedItem) in stock!")
} else {
    print("Sorry, either we're not open or don't have your item...")
}

if let fetchGems = questDirectory["Fetch Gemstones"]?["Objective"] {
    print("Active quest object: \(fetchGems)")
} else {
    print("That quest is no longer available")
}

/*:
 # Using FOR-IN Loops
 ---
 
 ## Topic Essentials
 For-in loops are used primarily to iterate, or loop through, sequences. Sequences can be array items, dictionary key-value pairs, ranges, and even characters in a string.
 
 ### Objectives
 + Use a for-in loop to iterate over a string, array, dictionary, and index ranges
 
 [Previous Topic](@previous)                                                 [Next Topic](@next)

 */
// Test variables
let playerGreeting = "Hello fellow Hunter!"
let armorTypes = ["Heavy Plate", "Hunters Gear", "Mage Robes"]
let weapons = ["Longsword": 150, "Dagger": 25, "Mace": 75]

// Strings and arrays
for stringCharacter in playerGreeting {
    print(stringCharacter)
}

for armor in armorTypes {
    print(armor)
}

// Dictionary key-value pairs
for weaponValues in weapons.values {
    print(weaponValues)
}

for (weapon, damage) in weapons {
    print("\(weapon): \(damage)")
}

// Using ranges
for indexNumber in 1...10 {
    print(indexNumber)
}

for armor in armorTypes[0...] {
    print(armor)
}

for indexNumber in 1..<10 {
    print(indexNumber)
}

for armor in armorTypes[..<armorTypes.count] {
    print(armor)
}

/*:
 # WHILE Loops
 ---
 
 ## Topic Essentials
 While loops are exactly what they sound like. While some defined condition is true, do something. There are two types of while loops - traditional while loops check their condition at the beginning of each loop, while repeat-while loops check their condition at the end.
 
 ### Objectives
 + Create a variable called **playerHealth** and assign it a value of 5
 + Use a standard while loop to print out **playerHealth** until it is at 0
 + Use a repeat-while loop to print out **playerHealth** until it is at 0 and see the different behavior
 
 [Previous Topic](@previous)                                                 [Next Topic](@next)

 */
// While loop
var playerHealth = 5

//while playerHealth > 0 {
//    playerHealth -= 1
//    print("Still kicking!")
//}

// Repeat-while loop
repeat {
    playerHealth -= 1
    print("HP at \(playerHealth)")
} while playerHealth > 0


/*:
 # The SWITCH Statement
 ---
 
 ## Topic Essentials
 A switch statement takes a value and runs it against possible matching patterns, with each possible match having a different block of executable code. While that might sound boring, switch statements in Swift have a lot of features that make them excellent for decision logic.
 
 ### Objectives
 + Use a switch statement to execute different code for different **initial** values
 + Use a switch statement to evaluate multiple variables
 + Use value binding and the `where` keyword to add logic to more cases
 
 [Previous Topic](@previous)                                                 [Next Topic](@next)

 */
// Test variables
let initial = "H"
let hp = 30
let mp = 40

// Simple switch
switch initial {
case "H":
    print("I'm guessing Harold?")
case "A":
    print("Maybe Alita?")
default:
    print("I've got nothing...")
}

// Complex variations
switch (mp, hp) {
case (15, 10):
    print("Great job")
case (1...15, 20..<25):
    print("Ranges are the best!")
case (let localMP, let localHP) where localMP + localHP > 20:
    print(localMP, localHP)
default:
    print("I've got nothing...")
}
/*:
 # Using the GUARD Statement
 ---
 
 ## Topic Essentials
 
 Guard statements in Swift act like gate keepers. Code execution can only get past them if their condition is true, otherwise the else statement that accompanies every guard statement will execute.
 
 Guard statements are great for setting up requirements in your code and making sure you don’t have unforeseen errors down the line.

 
 ### Objectives
 + Use a for loop to iterate over **shopItems**
 + Add a `guard` statement to check if you have enough gold to purchase each item
 + Debug both cases inside the for loop
 
 [Previous Topic](@previous)                                                 [Next Topic](@next)

 */
// Test variables
let shopItems = ["Magic wand": 10, "Iron Helm": 5, "Excalibur": 1000]
let currentGold = 16

// Guard statement with for-in loop
for (item, price) in shopItems {
    guard currentGold >= price else {
        print("You can't afford the \(item)")
        continue
    }
    
    print("Go ahead, the \(item) is yours for \(price) gold!")
}

// Guard check for specific item

