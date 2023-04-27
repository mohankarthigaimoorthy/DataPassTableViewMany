//
//  countryTableViewController.swift
//  tableViewDataPass
//
//  Created by Mohan K on 08/02/23.
//

import UIKit

class countryTableViewController: UITableViewController {

    let identifier = "CountryCell"
    
    var countries = [Country]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countries = loadData()
    }

    func loadData() -> [Country] {
        
        let list1 = List(listItems: ["burkerKing", "hotChips", "hot dog", "doritos", "pops", "candy"])
        let list2 = List(listItems: ["tacobell", "snicker", "tortilla chips", "pop", "puckalo"])
        let list3 = List(listItems: ["pizza", "lotichacopie", "salad", "calzone", "softdrinks", "funcchips"])
        
        let foodlist1  = Food(name: "the Le meridian", list: list1)
        let foodlist2 = Food(name: "the Taco Taco", list: list2)
        let foodlist3 = Food(name: "the Pizza Hut", list: list3)
        
        let list4 = List(listItems: ["kebab", "vegRice", "hummus", "momo's", "chickenRice", "mushroomRice"])
        let list5 = List(listItems: ["pulled Pork", "sandwitch", "BBQ chips", "french fries", "frenchies", "wrap"])
        let list6 = List(listItems: ["chickennugglet", "pork", "beaf", "veg rice", "hammburger", "spegattie"])
        let foodlist4 = Food(name: "rajaKannapas", list: list4)
        let foodlist5 = Food(name: "muniyandivilas", list: list5)
        let foodlist6 = Food(name: "sangam", list: list6)
        
        let list7 = List(listItems: ["chicken cuury", "idian sytle rice", "thaliStylrice", "variety rice", "veg panner", "gobi rice"])
        let list8 = List(listItems: ["italliansoup", "idiyapapa", "leg soup", "crab", "sqwid", "wedgee"])
        let list9 = List(listItems: ["hot water", "maggiee", "pannersoup", "damro", "dingo", "rat"])
        let foodlist7 = Food(name: "karuppanaswamy", list: list7)
        let foodlist8 = Food(name: "muthaiyan", list: list8)
        let foodlist9 = Food(name: "the madras residency", list: list9)
        
        let chennai = Country(name: "chennai", food: [foodlist1, foodlist2, foodlist3])
        let madurai = Country(name: "Madurai", food: [foodlist4, foodlist5, foodlist6])
        let trichy = Country(name: "trichy", food: [foodlist7, foodlist8, foodlist9])
        return [chennai, madurai, trichy]
    }
   

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return countries.count
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        let country = countries[indexPath.row]
        cell.textLabel?.text = country.name
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = tableView.indexPathForSelectedRow
        guard let selectedRow = indexPath?.row
        else {return}
        
        let selectedCountry = countries[selectedRow]
        let destinationVC = segue.destination as? foodTableViewController
        destinationVC?.food = selectedCountry.food
    }
}
