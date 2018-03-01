//
//  ViewController.swift
//  EventViewer
//
//  Created by Jeannette on 2018-02-28.
//  Copyright © 2018 Jeannette. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: properties
    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var eventDate: UILabel!
    @IBOutlet weak var eventInfo: UILabel!
    var item: Event?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Retrieves data passed from table view controller
        
        // Initializes data for the view controller, if error encountered fatalError message sent
        if let item = item {
            eventName.text = item.eventName
            //locationLabel.text = item.locationLabel
            eventDate.text = item.eventDate
            eventInfo.text = item.eventInfo
            eventImage.image = item.eventImage
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


}

