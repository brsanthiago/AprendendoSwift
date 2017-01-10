//
//  Item.swift
//  eggplant-brownie
//
//  Created by Bruno Santiago on 09/01/17.
//  Copyright © 2017 Bruno Santiago. All rights reserved.
//

import Foundation

class Item: Equatable{
    let name:String;
    let calories:Double;
    
    init(name:String, calories:Double) {
        self.name = name;
        self.calories = calories;
    }
}
func == (first:Item, second:Item) -> Bool{
    return first.name == second.name && first.calories == second.calories;
}
