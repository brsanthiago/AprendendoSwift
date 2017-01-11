//
//  RemoveViewController.swift
//  eggplant-brownie
//
//  Created by Bruno Santiago on 11/01/17.
//  Copyright © 2017 Bruno Santiago. All rights reserved.
//

import Foundation
import UIKit

class RemoveViewController{
    
    let controller:UIViewController;
    
    init(controller:UIViewController) {
        self.controller = controller;
    }
    
    func show(_ meal:Meal, handler: @escaping (UIAlertAction) -> Void){
        let alertDetail = UIAlertController(title: meal.name, message: meal.details(), preferredStyle: UIAlertControllerStyle.alert);
        
    
        let actionOk = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil);
        
        let actionRemove = UIAlertAction(title: "Remove", style: UIAlertActionStyle.destructive, handler: handler);
        
        alertDetail.addAction(actionOk);
        alertDetail.addAction(actionRemove);
        
        controller.present(alertDetail, animated: true, completion: nil);
    }
    
}
