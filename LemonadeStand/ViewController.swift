//
//  ViewController.swift
//  LemonadeStand
//
//  Created by Adam Marx on 6/6/15.
//  Copyright (c) 2015 Adam Marx. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var MoneySupplyCount: UILabel!
    @IBOutlet weak var LemonSupplyCount: UILabel!
    @IBOutlet weak var IceCubeSupplyCount: UILabel!
    @IBOutlet weak var lemonPurchaseCount: UILabel!
    @IBOutlet weak var iceCubePurchaseCount: UILabel!
    @IBOutlet weak var lemonMixCount: UILabel!
    @IBOutlet weak var iceCubeMixCount: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //IBActions

    @IBAction func lemonPurchasePlus(sender: UIButton) {
    }
    
    @IBAction func lemonPurchaseMinus(sender: UIButton) {
    }
    
    @IBAction func iceCubePurchasePlus(sender: UIButton) {
    }
    
    @IBAction func iceCubePurchaseMinus(sender: UIButton) {
    }
    
    @IBAction func lemonMixPlus(sender: UIButton) {
    }
    
    @IBAction func lemonMixMinus(sender: UIButton) {
    }
    
    @IBAction func iceCubeMixPlus(sender: UIButton) {
    }
    
    @IBAction func iceCubeMixMinus(sender: UIButton) {
    }
    
    @IBAction func startDay(sender: UIButton) {
    }
    
}

