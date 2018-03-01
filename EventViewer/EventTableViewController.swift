//
//  ConvertorTableViewController.swift
//  Handles Table View drawing.
//
//  Created by Jeannette on 2018-02-18.
//  Copyright © 2018 Jeannette. All rights reserved.
//

import UIKit


class EventTableViewController: UITableViewController {
    
    //MARK: Properties
    var items = [Event]()
    var city : City?
    let cellIdentifier = "EventTableViewCell"
    
    // Initializes the Table View Controller class
    override func viewDidLoad() {
        super.viewDidLoad()
        if let city = city {
            loadSampleData(cityName : city.cityName )
        } else {
            fatalError("Unable to open view controller")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Handles back button actions
    @IBAction func cancel(_ sender: Any) {
        if presentingViewController is UINavigationController {
            // Add
            dismiss(animated: true, completion: nil)
        } else if let owningNavigationController = navigationController {
            // Edit
            owningNavigationController.popViewController(animated: true)
        }
    }
    
    // Tells the table view how many sections to display
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Tells the table view how many rows to Create
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    // Service to a cell to return information required for content drawing
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Requests a cell from the table view
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? EventTableViewCell else {
            fatalError("Selected cell is not of type \(cellIdentifier)")
        }
        // Fetches the appropriate item for data source layout
        let event = items[indexPath.row]
        cell.eventDate.text = event.eventDate
        cell.eventImage.image = event.eventImage
        cell.eventName.text = event.eventName
        return cell
    }
    
    // Creates data item to pass to View Controller for display
    // If error encountered fatalError message sent
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        super.prepare(for: segue, sender: sender)
        if segue.identifier == "ShowDetail" {
            guard let detailViewController = segue.destination as? ViewController else {
                fatalError("Unexpected destination \(segue.destination)")
            }
            guard let selectedTableViewCell = sender as? EventTableViewCell else {
                fatalError("Unexpected destination \(String(describing: sender))")
            }
            guard let indexPath = tableView.indexPath(for: selectedTableViewCell) else {
                fatalError("Unexpected index path for \(selectedTableViewCell)")
            }
            detailViewController.item = items[indexPath.row]
        }
    }
    
    // Catches cancel function segue from View Controller
    @IBAction func unwindToConversionList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? ViewController, let item = sourceViewController.item {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                // Edit
                items[selectedIndexPath.row] = item
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            }
        }
    }
    
    // MARK: Private Methods
    // Instantiate default Conversion data objects for application
    private func loadSampleData(cityName : String) {
        if cityName == "Victoria" {
            guard let one = Event(
                eventName: "Propagating and Growing Native Plants Workshop",
                locationLabel: "Greater Victoria Public Library - Central Branch",
                eventInfo: "Join Kristen Miskelly of Saanich Native Plants for an in-depth look at propagating and growing native plants in the Capital Region. Kristen is the co-founder of Saanich Native Plants and has extensive experience in the region propagating and growing native plants in a variety of contexts. She'll discuss suitable plants in different locales and strategies for propagating and growing a wide variety of native plants.",
                eventDate: "Thu, 22 March 2018",
                hostLabel: "The Victoria Seed Library",
                eventImage: #imageLiteral(resourceName: "plant"))
                else { fatalError("Unable to instantiate Event") }
            
            guard let two = Event(
                eventName: "Saving Seed From Flowers",
                locationLabel: "Greater Victoria Public Library - Central Branch",
                eventInfo: "Join the Victoria Seed Library for an engaging conversation about how to grow and save seeds from many of Victoria’s most prominent ornamental flowers. Learn the science and art of seed saving and extend your garden enjoyment by saving some seeds from your favorite flowers.",
                eventDate: "Wed, 25 April 2018",
                hostLabel: "The Victoria Seed Library",
                eventImage: #imageLiteral(resourceName: "seeds"))
                else { fatalError("Unable to instantiate Event") }
            
            guard let three = Event (
                eventName: "Healthy Soil for a Hearty Garden",
                locationLabel: "Greater Victoria Public Library - Central Branch",
                eventInfo: "Join the Compost Education Centre for a fascinating look into the life of soil and learn how to keep your garden soil rich and healthy year-round. The soil contains a fascinating and complex diversity of life; feeding and caring for this community is essential to productive organic gardening. Join the Compost Ed Centre's site manager Alysha Punnet for a fascintating dive into the earth!",
                eventDate: "Sat, 26 May 2018",
                hostLabel: "The Victoria Seed Library",
                eventImage: #imageLiteral(resourceName: "soil"))
                else { fatalError("Unable to instantiate Event") }
            
            guard let four = Event (
                eventName: "Planning Your Year Round Veggie Garden #3",
                locationLabel: "1216 N Park St",
                eventInfo: "Here in Victoria good planning makes it possible to harvest produce from our gardens during every month of the year. Knowing when to sow seeds is important. But it’s just as crucial to know when and how to transition one crop to another. This presentation will show you how to plan to grow year round, protect your crops in winter, and we’ll even touch on pests and diseases!",
                eventDate: "Sat, 17 March 2018",
                hostLabel: "Compost Education Centre",
                eventImage: #imageLiteral(resourceName: "veggie"))
                else { fatalError("Unable to instantiate Event") }
            
            
            // Add Conversion objects to items array for cell population
            items += [one,two,three,four]
        }
    }
}


