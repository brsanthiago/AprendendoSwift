//
//  MealsTableViewController.swift
//  eggplant-brownie
//
//  Created by Bruno Santiago on 10/01/17.
//  Copyright © 2017 Bruno Santiago. All rights reserved.
//

import UIKit

class MealsTableViewContoller : UITableViewController, AddAMealDelegate{
    
    
    
    var meals = Array<Meal>();
   
    override func viewDidLoad() {
        
        self.meals = MealDao().load();
    }
    
    
    func add(_ meal:Meal){
        meals.append(meal);
        
        MealDao().save(meals);
        
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
                
                RemoveViewController(controller: self).show(meal, handler: { action in
                    self.meals.remove(at: row);
                    self.tableView.reloadData();
                });
                
            }
            
        }
    }
    
}
