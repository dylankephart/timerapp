//
//  ViewController.swift
//  navigation
//
//  Created by Dylan Kephart on 12/16/19.
//  Copyright © 2019 Dylan Kephart. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    var seconds = 210
    var timer = Timer()
    var isTimeRunning = false;
    func runTimer() {
         timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    @objc func updateTimer() {
        seconds -= 1     //This will decrement(count down)the seconds.
        label.text = "\(seconds)" //This will update the label.
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func pause(_ sender: UIBarButtonItem) {
        timer.invalidate()
    }
    @IBAction func play(_ sender: UIBarButtonItem) {
        if !timer.isValid {
            runTimer()
        }
    }
    @IBAction func addTen(_ sender: UIBarButtonItem) {
        seconds += 10
    }
    @IBAction func reset(_ sender: UIBarButtonItem) {
        timer.invalidate()
        seconds = 210    //Here we manually enter the restarting point for the seconds, but it would be wiser to make this a variable or constant.
        label.text = "\(seconds)"
    }
    @IBAction func minusTen(_ sender: UIBarButtonItem) {
        seconds -= 10
    }
}

