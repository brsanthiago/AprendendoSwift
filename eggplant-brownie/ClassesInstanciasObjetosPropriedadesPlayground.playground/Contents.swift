import UIKit

class Meal{
    var happiness:Int = 5
    var name:String = "eggplant brownie"
}

let brownie = Meal()
print(brownie.happiness)
print(brownie.name)

var sundubu = Meal()
sundubu.name = "Sundubu"
print(sundubu.name)