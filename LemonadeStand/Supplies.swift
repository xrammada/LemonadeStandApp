//
//  Supplies.swift
//  LemonadeStand
//
//  Created by Adam Marx on 6/7/15.
//  Copyright (c) 2015 Adam Marx. All rights reserved.
//

import Foundation


struct Supplies {
    var money : Int = 0
    var lemons : Int = 0
    var iceCubes : Int = 0
    
    init(aMoney: Int, aLemons:Int, aIceCubes: Int) {
        money = aMoney
        lemons = aLemons
        iceCubes = aIceCubes
    }
}