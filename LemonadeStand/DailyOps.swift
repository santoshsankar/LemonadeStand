//
//  DailyOps.swift
//  LemonadeStand
//
//  Created by Santosh Sankar on 1/7/15.
//  Copyright (c) 2015 Santosh Sankar. All rights reserved.
//

import Foundation

func LemonadeRatio(lemons: Int, icecubes: Int) -> Double{
    
    var amtLemons = lemons
    var amtIcecubes = icecubes
    
    let ratio = Double(amtLemons/amtIcecubes)

    return ratio
    
}

func CustomerGeneration(drinkRatio: Double, money: Double) -> Double{
    
    let numOfCustomers = Int(arc4random_uniform(UInt32(11)))
    println("\(numOfCustomers)")
    
    var money = money
    
    
    for x in 0...numOfCustomers{
        let customerPref = Double(arc4random_uniform(UInt32(101)))/100
        
        if customerPref < 0.4 && drinkRatio > 1{
            money += 1.0
            println("Acid Lemonade")
        } else if customerPref <= 0.6 && customerPref >= 0.4 && drinkRatio == 1 {
            money += 1.0
            println("Equal parts")
        } else if customerPref > 0.6 && drinkRatio < 1 {
            money += 1.0
            println("Diluted")
        }
    }
    
    return money

}