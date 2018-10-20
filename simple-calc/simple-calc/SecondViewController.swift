//
//  SecondViewController.swift
//  simple-calc
//
//  Created by Ronald Tang on 10/19/18.
//  Copyright © 2018 Ronald Tang. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var historyText: UILabel!
    
    var history : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        historyText.numberOfLines = 0
        historyText.text = history
        historyText.sizeToFit()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let vc = segue.destination as! ViewController
        vc.operation = history
    }

}
