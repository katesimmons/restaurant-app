//
//  RestaurantDetailViewController.swift
//  Restaurant App
//
//  Created by Kate Simmons on 2/3/16.
//  Copyright © 2016 Kate Simmons. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UIViewController {
    
    //This variable will be using data passing.
    var restaurantData = Restaurant!()

    @IBOutlet weak var restaurantImageView: UIImageView!
    @IBOutlet weak var restaurantNameLabel: UILabel!
    @IBOutlet weak var restaurantLocationLabel: UILabel!
    @IBOutlet weak var restaurantTypeLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        restaurantImageView.image = UIImage(named: restaurantData.image)
        restaurantNameLabel.text = restaurantData.name
        restaurantLocationLabel.text = restaurantData.location
        restaurantTypeLabel.text = restaurantData.type
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated);
        
    }
    
}
