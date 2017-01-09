import UIKit

//LET =  CONSTANT
let name:String = "Bruno"

let calories:Double = 50.5

let happiness:Int = 5

let eggplantIsAVegetable:Bool = false //boolean

func helloCalories(){
    let product = "brownie"
    print("Hello Calories \(product)")
}

helloCalories()
helloCalories()

func add(name:String, calories:Double){
    print("adding \(name) with \(calories)")
}

add(name: "Brownie", calories: 30.5)

add(name: "Brownie", calories: 50.5);
