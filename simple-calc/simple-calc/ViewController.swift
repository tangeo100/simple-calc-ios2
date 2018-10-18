//
//  ViewController.swift
//  simple-calc
//
//  Created by Ronald Tang on 10/15/18.
//  Copyright © 2018 Ronald Tang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    var args : [String] = []
    var count : [String] = []
    var avg : [String] = []
    var number: String = ""
    
    @IBOutlet weak var labelText: UILabel!
    
    @IBAction func numButton(_ sender: UIButton ) {
        number = number + sender.titleLabel!.text!
        labelText.text = number
    }
    
    @IBAction func functionButton(_ sender: UIButton) {
        args.append(labelText.text!)
        number = ""
        args.append(sender.titleLabel!.text!)
    }
    
    @IBAction func plusMinus(_ sender: UIButton) {
        if number != ""{
            if number.prefix(1) != "-"{
                number = "-" + number
            } else {
                number.remove(at: number.startIndex)
            }
        }
        labelText.text = number
    }
    
    @IBAction func enterButton(_ sender: UIButton) {
        if(args.count > 0){
            args.append(labelText.text!)
            let ans = calculate()
            if floor(ans) == ans {
                labelText.text = String(Int(ans))
                number = ""
                args = []
                count = []
                avg = []
                return
            }
            
            labelText.text = String(ans)
            number = ""
            args = []
            count = []
            avg = []
        }
    }
    
    @IBAction func factorial(_ sender: UIButton) {
        if(floor(Double(labelText.text!)!) == Double(labelText.text!)!) {
            var num : Int = Int(labelText.text!)!
            var total : Int = 1
            while(num != 0){
                total = total * num
                num = num - 1
            }
            labelText.text = String(total)
            number = ""
            return
        }
        labelText.text = "Can only factorial integers"
    }
    
    @IBAction func average(_ sender: UIButton) {
        avg.append(labelText.text!)
        args.append("avg")
        number = ""
    }
    
    @IBAction func count(_ sender: UIButton) {
        count.append(labelText.text!)
        args.append("count")
        number = ""
    }
    
    @IBAction func clear(_ sender: UIButton) {
        args = []
        count = []
        avg = []
        number = ""
        labelText.text = ""
    }
    
    public func calculate() -> Double {
        switch args[args.count - 2]{ //check what "mode" the calculator is in
        case "count":
            return Double(count.count) //return the number of values in count
        case "avg":
            var total:Double = 0;
            for i in 0...avg.count - 1{ //loop through array and add all numbers
                total += Double(avg[i])!
            }
            return total/Double(avg.count) //return average
        default: //if there is none of the previous options, by default calculate expression
            switch args[1]{
            case "+":
                return Double(args[0])! + Double(args[2])!
            case "-":
                return Double(args[0])! - Double(args[2])!
            case "x":
                return Double(args[0])! * Double(args[2])!
            case "/":
                if Double(args[2])! == 0 { //check to prevent devision by 0
                    return 0 //default value <- normally should be nil
                }
                return Double(args[0])! / Double(args[2])!
            case "%":
                if Double(args[2])! == 0 { //check to prevent devision by 0
                    return 0 //default value <- normally should be nill
                }
                return Double(Int(args[0])! % Int(args[2])!)
            default:
                return 0
            }
        }
    }
    
}

