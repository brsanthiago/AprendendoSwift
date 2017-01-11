//
//  Alert.swift
//  eggplant-brownie
//
//  Created by Bruno Santiago on 11/01/17.
//  Copyright © 2017 Bruno Santiago. All rights reserved.
//

import Foundation
import UIKit

class Alert{
    
    let controller:UIViewController;
    
    init(controller:UIViewController) {
        self.controller = controller;
    }
    
    func show(_ title:String = "Sorry", message:String = ("Unexpected error!")){
        
        let errorAlert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert);
        
        let actionUnderstood = UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel, handler: nil);
        
        errorAlert.addAction(actionUnderstood);
        
        controller.present(errorAlert, animated: true, completion: nil);
    }
    
}
