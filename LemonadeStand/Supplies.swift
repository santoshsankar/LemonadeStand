//
//  Supplies.swift
//  LemonadeStand
//
//  Created by Santosh Sankar on 1/6/15.
//  Copyright (c) 2015 Santosh Sankar. All rights reserved.
//

import Foundation


// struct since we dont need to subclass anything here
struct Supplies{
    
    var money = 0.0
    var lemons = 0
    var icecubes = 0
    
    
    // customer initializer takes 3 parameters and sets properties. This is done automatically for us-- just showing it
    init (aMoney: Double, aLemons: Int, aIcecubes: Int){
        money = aMoney
        lemons = aLemons
        icecubes = aIcecubes
    }
    
}