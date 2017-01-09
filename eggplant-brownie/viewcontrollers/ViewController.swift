//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Bruno Santiago on 09/01/17.
//  Copyright © 2017 Bruno Santiago. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet
    var nameField : UITextField?;
    
    @IBOutlet
    var happinessField : UITextField?;
    
    
    @IBAction
    func add(){
        
        if(nameField == nil || happinessField == nil){
            return;
        }
        
        let name:String = nameField!.text!;
        
        if let happiness:Int = Int(happinessField!.text!){
            
        let meal = Meal(name: name,happiness:happiness)
        
        
        print("Eaten \(meal.name) whith happiness \(meal.happiness)!")
            
        }
        
    }

}

