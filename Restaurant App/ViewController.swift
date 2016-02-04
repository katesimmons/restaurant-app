//
//  ViewController.swift
//  Restaurant App
//
//  Created by Kate Simmons on 1/27/16.
//  Copyright © 2016 Kate Simmons. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!

/*
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats And Deli", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]

    var restaurantImages = ["cafedeadend.jpg", "homei.jpg", "teakha.jpg", "cafeloisl.jpg", "petiteoyster.jpg", "forkeerestaurant.jpg", "posatelier.jpg", "bourkestreetbakery.jpg", "haighschocolate.jpg", "palominoespresso.jpg", "upstate.jpg", "traif.jpg", "grahamavenuemeats.jpg", "wafflewolf.jpg", "fiveleaves.jpg", "cafelore.jpg", "confessional.jpg", "barrafina.jpg", "donostia.jpg", "royaloak.jpg", "thaicafe.jpg"]

    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]
    
    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
*/
    
    var restaurantIsVisited = [Bool](count: 21, repeatedValue: false)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantNames.count //<<this is the Int
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIndentifier = "cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIndentifier, forIndexPath: indexPath) as! RestaurantTableViewCell
       
        cell.nameLabel?.text = restaurantNames[indexPath.row]
        cell.locationLabel?.text = restaurantLocations[indexPath.row]
        cell.typeLabel?.text = restaurantTypes[indexPath.row]
        cell.thumbnailImage?.image = UIImage(named: restaurantImages[indexPath.row])
        
        cell.accessoryType = restaurantIsVisited[indexPath.row] ? .Checkmark : .None
        
        //make thumbnails circles
        //cell.thumbnailImage.layer.cornerRadius = 30
        //cell.thumbnailImage.clipsToBounds = true
        
        return cell
        
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        
        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .ActionSheet)
        
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        optionMenu.addAction(cancelAction)

        
        let callActionHandler = { (action:UIAlertAction!) -> Void in
            //Body of closure
            let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry, the call feature is not available yet. Please retry later.", preferredStyle: .Alert)
            alertMessage.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(alertMessage, animated: true, completion: nil)

    }
        
        let callAction = UIAlertAction(title: "Call " + "123-000-\(indexPath.row)", style: UIAlertActionStyle.Default, handler: callActionHandler)

        optionMenu.addAction(callAction)
        
        
        let isVisitedTitle = (restaurantIsVisited[indexPath.row]) ? "I've not been here" : "I've been here"
        let isVisitedAction = UIAlertAction(title: isVisitedTitle, style: .Default, handler: {
            (action:UIAlertAction!) -> Void in
            // Retrieves the selected table cell using indexpath, which contains the index of the selected cell.
            let cell = tableView.cellForRowAtIndexPath(indexPath)
            self.restaurantIsVisited[indexPath.row] = (self.restaurantIsVisited[indexPath.row]) ? false : true
            
            // AccessoryType property of the cell with a check mark.
            cell?.accessoryType = (self.restaurantIsVisited[indexPath.row]) ? .Checkmark : .None
            })
            optionMenu.addAction(isVisitedAction)
        
        self.presentViewController(optionMenu, animated: true, completion: nil)
    
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        
    }

    
    
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {


        // Social Sharing Button
        let shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Share", handler: { (action, indexPath) -> Void in

            let defaultText = "Just checking in at " + self.restaurantNames[indexPath.row]
            if let imageToShare = UIImage(named: self.restaurantImages[indexPath.row]) {
                let activityController = UIActivityViewController(activityItems: [defaultText, imageToShare], applicationActivities: nil)
                self.presentViewController(activityController, animated: true, completion: nil)
            }
        })

        shareAction.backgroundColor = UIColor(red: 28.0/255, green: 165.0/255, blue: 253.0/255.0, alpha: 1.0)

        // Delete button
        let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Delete",handler: { (action, indexPath) -> Void in

            //Delete the row from the data source

            self.restaurantNames.removeAtIndex(indexPath.row)
            self.restaurantLocations.removeAtIndex(indexPath.row)
            self.restaurantTypes.removeAtIndex(indexPath.row)
            self.restaurantIsVisited.removeAtIndex(indexPath.row)
            self.restaurantImages.removeAtIndex(indexPath.row)
    

            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            })
        
            deleteAction.backgroundColor = UIColor(red: 202.0/255, green: 202.0/255, blue: 203.0/255.0, alpha: 1.0)

        
            return [deleteAction, shareAction]
        
        }
    
    //for navigation to detail page
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        if segue.identifier == "showRestaurantDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destinationViewController as! RestaurantDetailViewController
            
                destinationController.restaurantImage = restaurantImages[indexPath.row]
                destinationController.restaurantName = restaurantNames[indexPath.row]
                destinationController.restaurantLocation = restaurantLocations[indexPath.row]
                destinationController.restaurantType = restaurantTypes[indexPath.row]
                
    
                
                }
            
            }
        
        }
    
}

