import UIKit


let calories1 = 50.5
let calories2 = 100
let calories3 = 300
let calories4 = 500


let totalCalories:Array<Double> = [50.5, 100, 300, 500]
print(totalCalories)

for i in 0...3{
    print(i)
    print("Calories are \(totalCalories[i])")
}

for i in 0...(totalCalories.count-1){
    print("Calories are \(totalCalories[i])")
}

for calories in totalCalories{
    print("Calories are \(calories)")
}

//return void
func allCalories(calories : Array<Double>){
    var total:Double = 0;
    for c in calories{
        total += c;
    }
}
//return Double -> Double
func allCaloriesReturnDouble(calories : Array<Double>) -> Double{
    var total:Double = 0;
    for c in calories{
        total += c;
    }
    return total
}


allCalories(calories: [10.5,213,12.2,124.5])
allCaloriesReturnDouble(calories: [10.5,213,12.2,124.5])


var values = [1,2]
var total = 0;
for v in values{
    total += v
}
print(total/values.count)


