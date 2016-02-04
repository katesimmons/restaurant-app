//
//  RestaurantDetailViewController.swift
//  Restaurant App
//
//  Created by Kate Simmons on 2/3/16.
//  Copyright © 2016 Kate Simmons. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UIViewController {
    
    //for passing data
    var restaurantImage = ""
    var restaurantName = ""
    var restaurantLocation = ""
    var restaurantType = ""
    

    @IBOutlet weak var restaurantImageView: UIImageView!
    @IBOutlet weak var restaurantNameLabel: UILabel!
    @IBOutlet weak var restaurantLocationLabel: UILabel!
    @IBOutlet weak var restaurantTypeLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        restaurantImageView.image = UIImage(named: restaurantImage)
        restaurantNameLabel.text = restaurantName
        restaurantLocationLabel.text = restaurantLocation
        restaurantTypeLabel.text = restaurantType
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated);
        
    }
    
}
