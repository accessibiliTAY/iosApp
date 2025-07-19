/*:
 # Swift Arrays
 ---
 
 ## Topic Essentials
 Swift arrays are **ordered lists**, meaning that the position of each element is determined by the order it was added. Arrays work off of indexes, which can be used to access and modify the values of individual items.
 
 ### Objectives
 + Create arrays with different syntax
 + Add initial values
 + Use the `count` and `isEmpty` methods
 + Access and update array values using subscripts
 
 [Next Topic](@next)
 
 */

// Creating arrays
var levelDifficulty: [String] = ["Easy", "Moderate", "Veteran", "Nightmare"]
var extraSyntax1: Array<String> = Array<String>()

// Count and isEmpty
levelDifficulty.count
levelDifficulty.isEmpty

// Accessing array values
var mostDifficult = levelDifficulty[3]
levelDifficulty[3] = "Utter Ridiculousness"


/*:
 # Core Array Methods
 ---
 
 ## Topic Essentials
 Now that we know how to create and access arrays, we need to learn how to dynamically modify them. Like `Strings`, `Arrays` come with several handy methods built right in for just that purpose.
 
 ### Objectives
 + Create an array called **characterClasses** and assign it initial values
 + Use `append` and += operator to add items
 + Use the `insert` and `remove` methods to change the array further
 + Explore the `reverse`, `contains`, and`sort` methods
 + Create a jagged array called **skillTree** that stores arrays as its values
 + Use chained **subscript syntax** to access a value in **skillTree**
 
  [Previous Topic](@previous)                                                 [Next Topic](@next)
 
 */
// Changing & appending items
var characterClasses = ["Ranger", "Paladin", "Druid"]
characterClasses.append("Gunslinger")
characterClasses += ["Healer", "Berserker"]

//Inserting and removing items
characterClasses.insert("Beast Master", at: 2)
characterClasses.remove(at: 1)

// Ordering and querying values
characterClasses.reverse()
var reversedClasses = characterClasses.reversed()

characterClasses.sort()
var sortedClasses = characterClasses.sorted()

characterClasses.contains("Gunslinger")

print(characterClasses)

// 2D arrays and subscripts
var skillTree: [[String]] = [
    ["Attack+", "Barrage", "Heavy Hitter"],
    ["Guard+", "Evasion", "Run"]
]

var attackTreeSkill = skillTree[0][2]


/*:
 # Swift Dictionaries
 ---
 
 ## Topic Essentials
 Like arrays, dictionaries are collection types, but instead of holding single values accessed by indexes, they hold **key-value** pairs. All keys need to be of the same type, and the same goes for values. It's important to know that dictionary items are **unordered**, and their values are accessed with their associated keys.
 
 ### Objectives
 + Understand basic dictionary syntax
 + Create a dictionary called **blacksmithShop** and fill it with a few items
 + Access and udpate key-value pairs using subscript
 + Access all the keys and values of **blacksmithShopItems**
 
 [Previous Topic](@previous)                                                 [Next Topic](@next)

 */
// Creating dictionaries
var blacksmithShop: [String: Int] = ["Bottle": 10, "Shield": 15, "Ocarina": 1000]

// Accessing and modifying values
var shieldPrice = blacksmithShop["Shield"]
blacksmithShop["Bottle"] = 11

blacksmithShop["Towel"] = 1
print(blacksmithShop)

// All keys and values
let allKeys = [String](blacksmithShop.keys)
let allValues = [Int](blacksmithShop.values)

/*:
 # Core Dictionary Methods
 ---
 
 ## Topic Essentials
Dictionary elements can be easily updated and removed using subscript syntax or class methods.
 
 ### Objectives
 + Create a dictionary called **playerStats** and initialize it with key-value pairs
 + Update **playerStats** using different methods
 + Remove key-value pairs from **playerStats** using different methods
 + Create a 2 dimensional dictionary called **questBoard** and populate it
 + Use chained subcripts to access a nested key-value pair
 
 [Previous Topic](@previous)                                                 [Next Topic](@next)

 */
// Caching and overwriting items
var playerStats: [String: Int] = ["HP": 100, "Attack": 35, "Gold": 29]
var oldValue = playerStats.updateValue(30, forKey: "Attack")

//playerStats = ["Evasion": 12, "MP": 55]

// Caching and removing items
//playerStats["Gold"] = nil
var removedValue = playerStats.removeValue(forKey: "Gold")

print(playerStats)

// Nested dictionaries
var questBoard = [
    "Fetch Gemstones": [
        "Objective": "Retrieve 5 gemstones",
        "Secret": "Complete in under 5 mintues"
    ],
    "Defeat Big Boss": [
        "Objective": "Beat the boss",
        "Secret": "Win with 50% health"
    ]
]

var gemstoneObjective = questBoard["Fetch Gemstones"]?["Objective"]

/*:
 # Working with Sets
 ---
 
 ## Topic Essentials
 Sets are a great tool you need to store unique, unorderd values in a collection, as opposed to arrays and dictionaries which can hold duplicates with no issue.
 
 ### Objectives
 + Create a set named **activeQuests** and understand the syntax
 + `insert` and `remove` elements from **activeQuests**
 + Sort **activeQuests** and check if it `contains` a certain value
 
 [Previous Topic](@previous)                                                 [Next Topic](@next)

 */
// Creating sets
var activeQuests1: Set = ["Fetch Gemstones", "Big Boss", "The Undertaker", "Granny Needs Firewood"]

// Inserting and removing elements
activeQuests1.insert("Only the Strong")
activeQuests1.remove("The Undertaker")

print(activeQuests1)

// More common methods
activeQuests1.contains("All-4-One")
activeQuests1.sorted()

/*:
 # Core Set Methods
 ---
 
 ## Topic Essentials
 Because sets only store unique values, there are a number of useful operations you can perform on them without having to reinvent the sorting/filtering wheel. These include the `intersection` and difference of set values, as well as `union` and `subtraction`.
 
 ### Objectives
 + Copy and paste the **allQuests** set from the previous page
 + Create a new set called **completedQuests** and assign it a subset of quests from **allQuests**
 + Try out the different operations the `Set` class can perform
 
 [Previous Topic](@previous)                                                 [Next Topic](@next)

 */
// Test variables
var activeQuests2: Set = ["Fetch Gemstones", "Big Boss", "The Undertaker", "Granny Needs Firewood"]
var completedQuests: Set = ["Big Boss", "All-4-One", "The Hereafter"]

// Set operations
var commonQuests = activeQuests2.intersection(completedQuests)
var differentQuests = activeQuests2.symmetricDifference(completedQuests)
var allQuests = activeQuests2.union(completedQuests)
var clippedQuests = activeQuests2.subtracting(completedQuests)

/*:
 # Swift Tuples
 ---
 
 ## Topic Essential
 In Swift, tuples can take a group of values and store them as one compound value. Unlike arrays, tuples can store values of different types, so you can mix and match as much as you need.
 
 Tuples are great for returning values from functions, and storing temporary groups of values. However, as tempting as it may be to use tuples to create and store complex data structures, it’s still a better idea to use classes and structs for that, as we’ll see later on.
 
 ### Objectives
 + Create a simple tuple named **uppercutAttack** with initial values and no value names
 + Create another tuple named **planetSmashAttack** with initial values and value names
 + Create a final tuple named **shieldStompAttack** with no initial values and a type annotation
 + Explore what tuples have to offer
 
 [Previous Topic](@previous)                                                 [Next Topic](@next)

 */
// Simple tuple
var uppercutAttack: (String, Int, Bool) = ("Uppercut Smash", 25, true)
uppercutAttack.0
uppercutAttack.1
uppercutAttack.2

var (attack, damage, rechargeable) = uppercutAttack
attack
damage
rechargeable

// Naming tuple values
var planetSmash = (name: "Planet Smash", damage: 45, rechargeable: true)
planetSmash.rechargeable

// Naming values with type annotation
var shieldStomp: (name: String, damage: Int, rechargeable: Bool)
shieldStomp.damage = 100
