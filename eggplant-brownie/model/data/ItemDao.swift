//
//  ItemDao.swift
//  eggplant-brownie
//
//  Created by Bruno Santiago on 11/01/17.
//  Copyright © 2017 Bruno Santiago. All rights reserved.
//

import Foundation

class ItemDao : GenericDao<Item>{
    
    override func getArchive() -> String {
        return super.getArchive();
    }
    
    override func getFileName() -> String {
        return "items";
    }
    
}
