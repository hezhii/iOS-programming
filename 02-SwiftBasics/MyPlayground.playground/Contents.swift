import UIKit

var str = "Hello, playground"
str = "Hello, Swift"
let constStr = str

// Specifying types
var nextYear: Int = 0
var bodyTemp: Float = 0
var hasPet: Bool = true


// Collection types
var arrayOfInts: Array<Int> = []
var arrayOfStrings: [String] = []
var dictionaryOfCapitalsByCountry: [String: String] = [:]
var winningLotteryNumbers: Set<Int> = []

// Literals and subscripting
let number = 42
let meaningOfLife = String(number)
let fmStation = 91.2
var countingUp = ["one", "two"]
let secondElement = countingUp[1]

// Properties
countingUp.count
let emptyString = String()
emptyString.isEmpty

// Instance methods
countingUp.append("three")

let nameByParkingSpace = [13: "Alice", 27: "Bob"]

// Initializers
let emptyArrayOfInts = [Int]()
let emptySetOfFloats = Set<Float>()
let defaultNumber = Int()
let defaultBool = Bool()
let availableRooms = Set([205, 411, 412])
let defaultFloat = Float()
let floatFromLiteral = Float(3.14)

// Optionals
var reading1: Float?
var reading2: Float?
var reading3: Float?
reading1 = 9.8
reading2 = 9.2
//reading3 = 9.7
//let avgReading = (reading1! + reading2! + reading3!) / 3
if let r1 = reading1,
   let r2 = reading2,
   let r3 = reading3 {
    let avgReading = (r1 + r2 + r3) / 3
    print(avgReading)
} else {
    let errorString = "Instrument reported a reading that was nil."
    print(errorString)
}

// Subscripting dictionaries
let space13Assignee: String? = nameByParkingSpace[13]
let space42Assignee: String? = nameByParkingSpace[42]
