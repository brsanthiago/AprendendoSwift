//
//  GenericDao.swift
//  eggplant-brownie
//
//  Created by Bruno Santiago on 11/01/17.
//  Copyright © 2017 Bruno Santiago. All rights reserved.
//

import Foundation

class GenericDao<T> : Dao{
    
    var archive: String = "";
    
    init() {
        let userDirs = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true);
        
        let dir = userDirs[0];
        archive = "\(dir)/\(self.getFileName()).dados";
        
    }
    
    func getFileName() -> String {
        return "";
    }
    
    func getArchive() -> String {
        return archive;
    }
    
    
    
    func save(_ items:Array<T>){
        NSKeyedArchiver.archiveRootObject(items, toFile: getArchive())
    }
    
    func load() -> Array<T> {
        print("Loadded from: \(getArchive())");
        if let loaded = NSKeyedUnarchiver.unarchiveObject(withFile: getArchive()){
            let items = loaded as! Array<T>;
            return items;
        }
        return Array<T>();
    }
}
