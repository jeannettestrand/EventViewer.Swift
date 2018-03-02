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
        cell.eventLocation.text = event.locationLabel
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
        switch (cityName) {
            case "Victoria":
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
                    items += [one, two, three, four]
            
        case "Vancouver":
                guard let one = Event(
                    eventName: "Beginning with the Seventies: GLUT exhibition",
                    locationLabel: "Morris and Helen Belkin Art Gallery,",
                    eventInfo: "JCelebrating the excessive abundance of the archive, Beginning with the Seventies: GLUT is concerned with language, depictions of the woman reader as an artistic genre and the potential of reading as performed resistance. ",
                    eventDate: "to Apr 8",
                    hostLabel: "Main Mall, UBC",
                    eventImage: #imageLiteral(resourceName: "art"))
                    else { fatalError("Unable to instantiate Event") }
                
                guard let two = Event(
                    eventName: "200 Hour Yoga Teacher Training",
                    locationLabel: "1985 W. Broadway, Vancouver",
                    eventInfo: "Our part-time 200 Hour Yoga Teacher Training Program in Vancouver is the best choice if you have commitments to work, family, schooling and other activities during your course of study. This program allows you study at your own pace with our top yoga teacher training faculty.",
                    eventDate: "to Apr 1, 7:30-10 pm",
                    hostLabel: "Semperviva Yoga",
                    eventImage: #imageLiteral(resourceName: "yoga"))
                    else { fatalError("Unable to instantiate Event") }
                
                guard let three = Event (
                    eventName: "Canadian Abstraction: Works On Paper",
                    locationLabel: "HSBC Bldg., 885 W. Georgia, Vancouver",
                    eventInfo: "Works on paper by the great Canadian abstractionists: Jean Paul Riopelle, Rita Letendre, Jean McEwen, Yves Gaucher, Harold Klunder, William Perehudoff, Ronald Bloore, Ann Kipling, Ray Mead, John Meredith, Michael Morris, Harold Town et al. Presented by Winchester Galleries of Victoria",
                    eventDate: "to Mar 3",
                    hostLabel: "Pendulum Gallery",
                    eventImage: #imageLiteral(resourceName: "abstract"))
                    else { fatalError("Unable to instantiate Event") }
                
                guard let four = Event (
                    eventName: "Eastside Flea Spring Markets 2018",
                    locationLabel: "1024 Main",
                    eventInfo: "EVERY OTHER WEEKEND Starting January 26-28! Saturday & Sunday 11am-5pm, with special edition Friday evening Shop n' Bops on select weekends! We're excited to kick off another season of bi-weekly markets in the historic Ellis Building! Featuring 50+ local vendors, rotating food trucks, seasonal drink specials, artisan showrooms, pinball, door prizes, great tunes, cute dogs, and the nicest folks around! See you at the Flea!",
                    eventDate: "To Apr 22",
                    hostLabel: "The Ellis Building",
                    eventImage: #imageLiteral(resourceName: "market"))
                    else { fatalError("Unable to instantiate Event") }
                items += [one,two,three,four]
        
        
        case "Kelowna":
                guard let one = Event(
                    eventName: "Bartending 101: Sparkling Cocktails",
                    locationLabel: "Okanagan Spirits - Kelowna",
                    eventInfo: "Join us in Kelowna for our Bartending 101 series - Sparkling Cocktails Edition featuring bubbly from Summerhill Pyramid Winery!",
                    eventDate: "March 1, 2018",
                    hostLabel: "Summerhill Winery",
                    eventImage: #imageLiteral(resourceName: "bar"))
                    else { fatalError("Unable to instantiate Event") }
                
                guard let two = Event(
                    eventName: "Italian Cooking w/Giulio Piccioli",
                    locationLabel: "Start Fresh Kitchen",
                    eventInfo: "Our Italian brother Giulio keeps his Italian roots near him in the kitchen -- little waste and BIG taste. Owner of Kelowna's One Big Table premier cooperative grocery store, Chef G has a special knack for using what's plentiful and good. Even in these deep winter months, he will show you how to create seasonally-inspired foods that will serve well for both your tastebuds and your healthy side. Come over to the Kitchen for an evening of great stories, slow-steady-cooking, and enjoying tastes all the way to the dinner table. We always cap the evening off with a beautiful family-style meal served at our big table. Buon Appetito!",
                    eventDate: "March 1, 2018",
                    hostLabel: "Start Fresh Kitchen",
                    eventImage: #imageLiteral(resourceName: "food"))
                    else { fatalError("Unable to instantiate Event") }
                
                guard let three = Event (
                    eventName: "Adult Hip Hop & Dance Fitness Classes",
                    locationLabel: "Studio M",
                    eventInfo: "Fun and easy classes for everyone! No registration required - just come on down to Studio M on Harvey Avenue and join the party!",
                    eventDate: "Recurring weekly on Thursday",
                    hostLabel: "Studio M",
                    eventImage: #imageLiteral(resourceName: "dance"))
                    else { fatalError("Unable to instantiate Event") }
                items += [one,two,three]

        case "Edmonton":
                guard let one = Event(
                    eventName: "HempFest Cannabis Expo Edmonton",
                    locationLabel: "Shaw Conference Centre",
                    eventInfo: "The HempFest Cannabis Expo returns to Edmonton for it's second year!",
                    eventDate: "Sat, 24 Mar ",
                    hostLabel: "THFC Productions",
                    eventImage: #imageLiteral(resourceName: "hemp"))
                    else { fatalError("Unable to instantiate Event") }
                
                guard let two = Event(
                    eventName: "3rd ANNUAL EDMONTON NATURAL HAIR SHOW",
                    locationLabel: "Boyle Street Plaza",
                    eventInfo: "JThe Edmonton Natural Hair Show (ENHS) inspires people of all ages to embrace their natural hair as part of what makes them uniquely beautiful.",
                    eventDate: "Sat, 7 Apr 2018",
                    hostLabel: "Edmonton Natural Hair Show",
                    eventImage: #imageLiteral(resourceName: "hair"))
                    else { fatalError("Unable to instantiate Event") }
                
                guard let three = Event (
                    eventName: "Midnight Market",
                    locationLabel: "Alberta Aviation Museum",
                    eventInfo: "Edmonton's first 18+ Midnight Market with local food, local beer, local makers and local entertainment.",
                    eventDate: "Sat, 26 May 2018",
                    hostLabel: "Midnight Market",
                    eventImage: #imageLiteral(resourceName: "midnite"))
                    else { fatalError("Unable to instantiate Event") }
                
                items += [one,two,three]
            
        case "Calgary":
                guard let one = Event(
                    eventName: "Ai Yah! Sweet and Sour Secrets",
                    locationLabel: "Lunchbox Theatre",
                    eventInfo: "Jade Wong is in a tricky place. Wong, a Chinese-Canadian, is trying to live up to her family's expectations of her while at the same time being true to who she is. Things escalate — and become truly awkward — during Chinese New Year, when her father invites an unexpected guest to dinner. Family secrets come out and connections are tested.",
                    eventDate: "Mar 1, 2018 - Mar 10, 2018",
                    hostLabel: "lunchboxtheatre.com",
                    eventImage: #imageLiteral(resourceName: "play"))
                    else { fatalError("Unable to instantiate Event") }
              
                items += [one]
            
        default:
                fatalError("Unable to instantiate Event")
        }
    }
}


