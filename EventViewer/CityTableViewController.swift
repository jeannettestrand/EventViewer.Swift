//
//  CityTableViewController.swift
//  EventViewer
//
//  Created by Jeannette on 2018-02-28.
//  Copyright © 2018 Jeannette. All rights reserved.
//

import UIKit

class CityTableViewController: UITableViewController {
    
    var items = [City]()
    let cellIdentifier = "CityTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCityData()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    // Configures and provides a cell to display for a given row
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Requests a cell from the table view
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CityTableViewCell else {
            fatalError("Selected cell is not of type \(cellIdentifier)")
        }
        
        // Fetches the appropriate item for data source layout
        let city = items[indexPath.row]
        
        cell.cityName.text = city.cityName
        cell.cityImage.image = city.cityImage
        return cell
    }
    
    // Creates data item to pass to View Controller for display
    // If error encountered fatalError message sent
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        super.prepare(for: segue, sender: sender)
        if segue.identifier == "ShowDetail" {
            guard let listViewController = segue.destination as? EventTableViewController else {
                fatalError("Unexpected destination \(segue.destination)")
            }
            guard let selectedTableViewCell = sender as? CityTableViewCell else {
                fatalError("Unexpected destination \(String(describing: sender))")
            }
            guard let indexPath = tableView.indexPath(for: selectedTableViewCell) else {
                fatalError("Unexpected index path for \(selectedTableViewCell)")
            }
            listViewController.city = items[indexPath.row]
        }
    }
    
    // Catches cancel function segue from View Controller
    @IBAction func unwindToConversionList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? EventTableViewController, let item = sourceViewController.city {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                // Edit
                items[selectedIndexPath.row] = item
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            }
        }
    }
    
    func loadCityData(){
        guard let victoria = City(cityName: "Victoria", cityImage: #imageLiteral(resourceName: "calgary"))
            else { fatalError("Unable to instantiate City") }
        guard let vancouver = City(cityName: "Vancouver", cityImage: #imageLiteral(resourceName: "vancouver"))
            else { fatalError("Unable to instantiate City") }
        guard let kelowna = City(cityName: "Kelowna", cityImage: #imageLiteral(resourceName: "kelowna"))
            else { fatalError("Unable to instantiate City") }
        guard let edmonton = City(cityName: "Edmonton", cityImage: #imageLiteral(resourceName: "edmonton"))
            else { fatalError("Unable to instantiate City") }
        guard let calgary = City(cityName: "Calgary", cityImage: #imageLiteral(resourceName: "victoria"))
            else { fatalError("Unable to instantiate City") }
        items += [victoria, vancouver, kelowna, edmonton, calgary]
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
