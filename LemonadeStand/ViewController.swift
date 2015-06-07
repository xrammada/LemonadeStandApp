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
    
    var supplies = Supplies(aMoney: 10, aLemons: 1, aIceCubes: 1)
    var price = Price()
    
    var lemonsToPurchase = 0
    var iceCubesToPurchase = 0
    
    var lemonsToMix = 0
    var iceCubesToMix = 0
    
    var weatherArray : [[Int]] = [[-10, -9, -5, -7], [5, 8, 10, 9], [22, 25, 27, 23]]
    var weatherToday : [Int] = [0, 0, 0, 0]
    
    var weatherImageView: UIImageView = UIImageView(frame: CGRectMake(20, 50, 50, 50))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateMainView()
        simulateWeatherToday()
        self.view.addSubview(weatherImageView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //IBActions

    @IBAction func lemonPurchasePlus(sender: UIButton) {
        if supplies.money >= price.lemon {
            lemonsToPurchase += 1
            supplies.money -= price.lemon
            supplies.lemons += 1
            updateMainView()
        }
        else {
            showAlertWithText(message: "You don't have enough money")
    
        }
        
    }
    
    @IBAction func lemonPurchaseMinus(sender: UIButton) {
        
        if lemonsToPurchase > 0 {
            lemonsToPurchase -= 1
            supplies.money += price.lemon
            supplies.lemons -= 1
            updateMainView()
        }
        else {
            showAlertWithText(message: "You don't have lemons in your cart")
            
        }
    }
    
    @IBAction func iceCubePurchasePlus(sender: UIButton) {
        if supplies.money >= price.iceCube {
            iceCubesToPurchase += 1
            supplies.money -= price.iceCube
            supplies.iceCubes += 1
            updateMainView()
        }
        else {
            showAlertWithText(header: "Error", message: "You don't have enough money")
            
        }
    }
    
    @IBAction func iceCubePurchaseMinus(sender: UIButton) {
        
        if iceCubesToPurchase > 0 {
            iceCubesToPurchase -= 1
            supplies.money += price.iceCube
            supplies.iceCubes -= 1
            updateMainView()
        }
        else {
            showAlertWithText(message: "You don't have ice cubes in your cart")
            
        }
    }
    
    @IBAction func lemonMixPlus(sender: UIButton) {
        if supplies.lemons > 0 {
            lemonsToPurchase = 0
            supplies.lemons -= 1
            lemonsToMix += 1
            updateMainView()
            
        }
        else {
            showAlertWithText(header: "What!", message: "You don't have enough supplies")
        }
    }
    
    @IBAction func lemonMixMinus(sender: UIButton) {
        if lemonsToMix > 0 {
            lemonsToPurchase = 0
            lemonsToMix -= 1
            supplies.lemons += 1
            updateMainView()
        }
        else {
            showAlertWithText(message: "You have nothing to un-mix")
        }
    }
    
    @IBAction func iceCubeMixPlus(sender: UIButton) {
        if supplies.iceCubes > 0 {
            iceCubesToPurchase = 0
            supplies.iceCubes -= 1
            iceCubesToMix += 1
            updateMainView()
        }
        else {
            showAlertWithText(message: "You don't have enough inventory")
        }
    }
    
    @IBAction func iceCubeMixMinus(sender: UIButton) {
        if iceCubesToMix > 0 {
            iceCubesToPurchase = 0
            iceCubesToMix -= 1
            supplies.iceCubes += 1
            updateMainView()
        }
        else {
            showAlertWithText(message: "You have nothing to un-mix")
        }
    }
    
    @IBAction func startDay(sender: UIButton) {
        
        let average = findAverage(weatherToday)
        let customers = Int(arc4random_uniform(UInt32(abs(average))))
        
        println("customers: \(customers)")

        if (lemonsToMix == 0 || iceCubesToMix == 0) {
            showAlertWithText(message: "You need to add at least one lemon and one ice cube")
        }
        else {
            let lemonadeRatio = Double(lemonsToMix) / Double(iceCubesToMix)
            
            for x in 0...customers {
                let preference = Double(arc4random_uniform(101))/100
                
                if preference < 0.4 && lemonadeRatio > 1 {
                    supplies.money += 1
                    println("Paid")
                }
                else if preference > 0.6 && lemonadeRatio < 1 {
                    supplies.money += 1
                    println("Paid")
                }
                else if preference <= 0.6 && preference >= 0.4 && lemonadeRatio == 1 {
                    supplies.money += 1
                    println("Paid")
                }
                else {
                    println("else statement evaluating")
                }
            }
            
            lemonsToPurchase = 0
            iceCubesToPurchase = 0
            lemonsToMix = 0
            iceCubesToMix = 0
            
            simulateWeatherToday()
            updateMainView()
        }
        
    }
    
    //helper functions
    func updateMainView() {
        MoneySupplyCount.text = "$\(supplies.money)"
        LemonSupplyCount.text = "\(supplies.lemons) Lemons"
        IceCubeSupplyCount.text = "\(supplies.iceCubes) Ice Cubes"
    
        lemonPurchaseCount.text = "\(lemonsToPurchase)"
        iceCubePurchaseCount.text = "\(iceCubesToPurchase)"
        
        lemonMixCount.text = "\(lemonsToMix)"
        iceCubeMixCount.text = "\(iceCubesToMix)"
        
    }
    
    func showAlertWithText(header : String = "Warning", message : String) {
        var alert = UIAlertController(title : header, message : message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func simulateWeatherToday() {
        let index = Int(arc4random_uniform(UInt32( weatherArray.count)))
        weatherToday = weatherArray[index]
        
        switch index {
        case 0: weatherImageView.image = UIImage(named: "Cold")
        case 1: weatherImageView.image = UIImage(named: "Mild")
        case 2: weatherImageView.image = UIImage(named: "Warm")
        default: weatherImageView.image = UIImage(named: "Warm")
        }
        
    }
    
    func findAverage(data:[Int]) -> Int {
        
        var sum = 0
        for x in data {
            sum += x
        }
        
        //Get the average of the items in the sum variable and then round up using the ceil function.
        
        var average:Double = Double(sum) / Double(data.count)
        var rounded:Int = Int(ceil(average))
        return rounded
    }
    
}

