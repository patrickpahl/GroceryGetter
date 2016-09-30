//
//  IntroViewController.swift
//  GroceryGetter
//
//  Created by Patrick Pahl on 9/29/16.
//  Copyright © 2016 Patrick Pahl. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        startButton.layer.borderWidth = 2.0
        startButton.layer.borderColor = UIColor.whiteColor().CGColor
        startButton.layer.cornerRadius = 8.0
        startButton.layer.backgroundColor = UIColor.whiteColor().CGColor
      
        self.navigationController?.navigationBarHidden = true
    }
    
    @IBOutlet weak var appImage: UIImageView!
    @IBOutlet weak var startButton: UIButton!

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
