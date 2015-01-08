//
//  ViewController.swift
//  LemonadeStand
//
//  Created by Santosh Sankar on 1/6/15.
//  Copyright (c) 2015 Santosh Sankar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Global Variables
    var supplies = Supplies(aMoney: 10.0, aLemons: 1, aIcecubes: 1) //use custom initializer to assign values at onset
    let price = Price()                                             //bring pricing into the view controller
    
    var lemonsToPurchase = 0
    var icecubesToPurchase = 0
    
    var lemonstoMix = 0
    var icecubesToMix = 0
    
    // Current Inventory Labels
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var lemonInvtyLabel: UILabel!
    @IBOutlet weak var icecubeInvtyLabel: UILabel!
    
    // Purchasing Labels
    
    @IBOutlet weak var lemonPurchaseLabel: UILabel!
    @IBOutlet weak var icecubePurchaseLabel: UILabel!
    
    //Lemon Purchasing Buttons
    
    @IBAction func lemonPurchaseIncrease(sender: AnyObject) {
     
        if supplies.money >= price.kLemonPrice {
            lemonsToPurchase += 1
            supplies.money -= price.kLemonPrice
            supplies.lemons += 1
            updateMainView()
        } else {
            println("Need more money")
            showAlertWithText(header: "Need More Money", message: "Need more money, lemons cost $2")
        }
        
        
    }
    
    @IBAction func lemonPurchaseDecrease(sender: AnyObject) {
        
        if lemonsToPurchase > 0{
            lemonsToPurchase -= 1
            supplies.money += price.kLemonPrice
            supplies.lemons -= 1
            updateMainView()
        } else{
            println("Nothing to put back")
            showAlertWithText(message: "You're basket is empty")
        }
        
        
    }
    
    // Ice Cube Purchasing Buttons
    
    @IBAction func icecubePurchaseIncrease(sender: AnyObject) {
        
        if supplies.money >= price.kIcecubePrice {
            icecubesToPurchase += 1
            supplies.money -= price.kIcecubePrice
            supplies.icecubes += 1
            updateMainView()
        } else {
            println("Need more money")
            showAlertWithText(header: "Need More Money", message: "Need more money, ice cubes cost $1.50")
        }
        
    }
    
    @IBAction func icecubePurchaseDecrease(sender: AnyObject) {
        
        if icecubesToPurchase > 0{
            icecubesToPurchase -= 1
            supplies.money += price.kIcecubePrice
            supplies.icecubes -= 1
            updateMainView()
        } else{
            println("Nothing to put back")
            showAlertWithText(message: "You're basket is empty")
        }
    }
    
    // Mix Lemonade Labels
    
    @IBOutlet weak var lemonMixLabel: UILabel!
    @IBOutlet weak var icecubeMixLabel: UILabel!
    
    
    // Mix Lemons Buttons
    
    @IBAction func lemonMixIncrease(sender: AnyObject) {
        if supplies.lemons > 0 {
            lemonsToPurchase = 0
            supplies.lemons -= 1
            lemonstoMix += 1
            updateMainView()
        } else{
            showAlertWithText(message: "Not enough inventory")
        }
        
    }
    
    
    @IBAction func lemonMixDecrease(sender: AnyObject) {

        if supplies.lemons > 0 {
            lemonsToPurchase = 0
            supplies.lemons += 1
            lemonstoMix -= 1
            updateMainView()
        } else{
            showAlertWithText(message: "Nothing to unmix")
        }
    }
    
    // Mix Ice Buttons
    
    @IBAction func icecubeMixIncrease(sender: AnyObject) {
        
        if supplies.icecubes > 0 {
            icecubesToPurchase = 0
            supplies.icecubes -= 1
            icecubesToMix += 1
            updateMainView()
        } else{
            showAlertWithText(message: "Not enough inventory")
        }
        
    }
    
    
    @IBAction func icecubeMixDecrease(sender: AnyObject) {
        
        if supplies.icecubes > 0 {
            icecubesToPurchase = 0
            supplies.icecubes += 1
            icecubesToMix -= 1
            updateMainView()
        } else{
            showAlertWithText(message: "Not enough inventory")
        }
        
    }
    
    // Start Day Button
    @IBAction func startDay(sender: AnyObject) {
        
        if supplies.lemons == 0 && supplies.icecubes == 0 {
            showAlertWithText(header: "Need Supplies", message: "You need at least 1 lemon and 1 ice cube")
        } else{
            CustomerGeneration(LemonadeRatio(lemonstoMix, icecubesToMix), supplies.money
            )
            updateMainView()
        }
        
        lemonsToPurchase = 0
        icecubesToPurchase = 0
        lemonstoMix = 0
        icecubesToMix = 0
        
        updateMainView()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateMainView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // Update main view helper function
    
    func updateMainView(){
        
        moneyLabel.text = ("$\(supplies.money)")
        lemonInvtyLabel.text = "\(supplies.lemons)"
        icecubeInvtyLabel.text = "\(supplies.icecubes)"
        
        lemonPurchaseLabel.text = "\(lemonsToPurchase)"
        icecubePurchaseLabel.text = "\(icecubesToPurchase)"
        
        lemonMixLabel.text = "\(lemonstoMix)"
        icecubeMixLabel.text = "\(icecubesToMix)"
        
        
    }
    
    func showAlertWithText(header: String = "Warning", message: String){
        
        var alert = UIAlertController(title: header, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert,animated: true, completion: nil)
        
    }
    
    
    
}

