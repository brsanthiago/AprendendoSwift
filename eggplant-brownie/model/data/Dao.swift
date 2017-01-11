//
//  Dao.swift
//  eggplant-brownie
//
//  Created by Bruno Santiago on 11/01/17.
//  Copyright © 2017 Bruno Santiago. All rights reserved.
//

import Foundation

protocol Dao{
    func getFileName() -> String;
    func getArchive() -> String;
}
