//: Criando classes e aplicativos que nunca quebram com nulos
import UIKit

class Meal{
    var happiness:Int;
    var name:String;
    var items = Array<Item>();

    init(name:String, happiness:Int){
        self.name = name;
        self.happiness = happiness;
    }
    
    func totalCallories() -> Double{
        var total = 0.0;
        for i in items{
            total += i.calories;
        }
        return total;
    }
}


class Item{
    var name:String;
    var calories:Double;
    
    init(name:String, calories:Double) {
        self.name = name;
        self.calories = calories;
    }
    
}

let brownie = Meal(name: "eggplant brownie", happiness: 5)
print(brownie.name)

let item1 = Item(name: "Brownie", calories: 115)
let item2 = Item(name: "Vegan cream", calories: 40)
brownie.items.append(item1)
brownie.items.append(item2)

print(brownie.totalCallories())
