import UIKit

var greeting = "Hello, playground"

print("heello")

let mystr1 = "2330"
let mystr = Int(mystr1)!

Int("2330")
//let convertedTime =  ((mystr / 100) * 60 + mystr.truncatingRemainder(dividingBy: 100)) / 60
//print(convertedTime)

2330 / 100

mystr
mystr / 100
mystr % 100

func stringTimeToDouble(stringTime:[String])->[Double]{
    var returnArray : [Double] = []
    for i in stringTime{
        let intTime = Int(i)!
        let convertedTime =  ((intTime / 100) * 60 + intTime % 100) / 60
        returnArray.append(Double(convertedTime))
    }
    return returnArray
}

let test =  ["0200", "2200", "2330", "2220"]

stringTimeToDouble(stringTime: test)
let one :Int!
one = Int("2330")
let convert = ((one / 100) * 60 + one % 100)
Double(convert) / 60
let result : Double!
result = Double(convert) / 60

print(result)
