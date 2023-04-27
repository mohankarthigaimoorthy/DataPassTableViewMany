//
//  foodTableViewController.swift
//  tableViewDataPass
//
//  Created by Mohan K on 08/02/23.
//

import UIKit

class foodTableViewController: UITableViewController {

    var identifier = "FoodCell"
    var food = [Food]()
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    // MARK: - Table view data source

   

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return food.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        let foods = food[indexPath.row]
        cell.textLabel?.text = foods.name
        
        return cell
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = self.tableView.indexPathForSelectedRow
        guard let selectRow = indexPath?.row
        else { return}
        
        let selectedFood = food[selectRow]
        
        let destinationVC = segue.destination as? listTableViewController
        destinationVC?.listItemses = selectedFood.list.listItems
        
    }
}
