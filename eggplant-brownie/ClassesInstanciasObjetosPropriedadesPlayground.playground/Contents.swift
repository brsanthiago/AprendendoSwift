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


//OPTIONALS
var name:String?
name = "eggplant brownie"
print(name)
print(name!.uppercased())

class MealOptional{
    var happiness:Int?
    var name:String?
}


var brownieOptional = MealOptional()


print(brownieOptional.happiness)
print(brownieOptional.name)

brownieOptional.happiness = 3
brownieOptional.name = "Optional Brownie"
//print(brownieOptional.name?.uppercased())


if let name = brownieOptional.name{
    print("Opa, eu tenho um nome")
    print(brownieOptional.name)
}


//Métodos que retorna Optional

let numero = Int("5")
if let n = numero{
    print(n)
}

