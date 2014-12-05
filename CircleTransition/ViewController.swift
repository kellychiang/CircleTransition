//
//  ViewController.swift
//  CircleTransition
//
//  Created by kelly on 2014/12/5.
//  Copyright (c) 2014年 kelly. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    @IBOutlet weak var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction  func circleTapped(sender: UIButton) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
}

