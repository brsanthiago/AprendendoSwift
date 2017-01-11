//
//  MealDao.swift
//  eggplant-brownie
//
//  Created by Bruno Santiago on 11/01/17.
//  Copyright © 2017 Bruno Santiago. All rights reserved.
//

import Foundation

class MealDao : GenericDao<Meal>{
    
    override func getArchive() -> String {
        return super.getArchive();
    }
    
    override func getFileName() -> String {
        return "meals";
    }
    
}
