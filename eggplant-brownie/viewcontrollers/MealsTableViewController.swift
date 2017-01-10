//
//  MealsTableViewController.swift
//  eggplant-brownie
//
//  Created by Bruno Santiago on 10/01/17.
//  Copyright © 2017 Bruno Santiago. All rights reserved.
//

import UIKit

class MealsTableViewContoller : UITableViewController, AddAMealDelegate{
    
    
    
    var meals = [Meal(name:"eggplant browine", happiness: 5),Meal(name: "Açaí", happiness: 5),Meal(name: "Crepe", happiness: 3),Meal(name: "Sorvete", happiness: 4)];
   
    
    func add(_ meal:Meal){
        meals.append(meal);
        tableView.reloadData();
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "addMeal"){
            let view = segue.destination as! ViewController;
            view.delegate = self;
            
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row;
        
        let meal = meals[row];
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: nil);
        
        cell.textLabel!.text = meal.name;
        
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(showDetails));
        
        
        cell.addGestureRecognizer(longPressRecognizer)
        
        return cell;
        
    }
    
    func showDetails(recognizer : UILongPressGestureRecognizer){
        if(recognizer.state == UIGestureRecognizerState.began){
            
            let cell  = recognizer.view as! UITableViewCell;
            
            if let indexPath = tableView.indexPath(for: cell){
                let row = indexPath.row;
                let meal = meals[row];
                
                let alertDetail = UIAlertController(title: meal.name, message: meal.details(), preferredStyle: UIAlertControllerStyle.alert);
                
                let actionOk = UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel, handler: nil);
                
                alertDetail.addAction(actionOk);
                
                present(alertDetail, animated: true, completion: nil);
                
            }
            
        }
    }
    
}
