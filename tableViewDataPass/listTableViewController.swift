//
//  listTableViewController.swift
//  tableViewDataPass
//
//  Created by Mohan K on 08/02/23.
//

import UIKit

class listTableViewController: UITableViewController {
var identifier = "listItemCell"
    
    var listItemses = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    // MARK: - Table view data source

    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listItemses.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        
        let listItem = listItemses[indexPath.row]
        
        cell.textLabel?.text = listItem
        
        return cell
    }
}
