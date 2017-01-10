//
//  Meal.swift
//  eggplant-brownie
//
//  Created by Bruno Santiago on 09/01/17.
//  Copyright © 2017 Bruno Santiago. All rights reserved.
//

import Foundation

class Meal{
    let name:String;
    let happiness:Int;
    let items:Array<Item>;
    
    init(name:String, happiness:Int, items:Array<Item> = []) {
        self.name = name;
        self.happiness = happiness;
        self.items = items;
    }
    //Opcional no caso de não receber um array de items vazio por padrão
    init(name:String, happiness:Int) {
        self.name = name;
        self.happiness = happiness;
        self.items = [];
    }
    
    func allCalories() -> Double {
        var total = 0.0;
        for item in items{
            total += item.calories;
        }
        return total;
    }
}
