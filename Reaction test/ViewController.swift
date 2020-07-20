//
//  ViewController.swift
//  Reaction test
//
//  Created by Sebastian on 20/07/2020.
//  Copyright © 2020 Sebastian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var instructionLabel: UILabel!
    
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var stopButton: UIButton!
    
    var counter = 0.00
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        timerLabel.alpha = 0
        stopButton.alpha = 0
        
        styleFilledButton(stopButton)
        styleFilledButton(playButton)
        
        timerLabel.text = "Click Play, wait for Stop button, tap it as fast as you can!"
        
    }
    
    @IBAction func playButtonAction(_ sender: Any) {
        playButton.alpha = 0
        instructionLabel.alpha = 0
        timerLabel.alpha = 0
        stopButton.alpha = 0
        
        counter = 0.00
        
        flashDelay()
    }
    
    
    @IBAction func stopButtonAction(_ sender: Any) {
        
        timer.invalidate()
        
        playButton.alpha = 1
    }
    
    func flashDelay() {
        let randomNumber = Double.random(in: 0.5...2.00)
        let delayTime = DispatchTime.now() + randomNumber
        DispatchQueue.main.asyncAfter(deadline: delayTime, execute: {self.showGame()})
        DispatchQueue.main.asyncAfter(deadline: delayTime, execute: {self.startTimer()})
    }
    
    func showGame() {
        timerLabel.alpha = 1
        stopButton.alpha = 1
    }
    
    func startTimer() {
        
        
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        counter = counter + 0.01
        timerLabel.text = String(format: "%.2f", counter)
    }
    
    func styleFilledButton(_ button:UIButton) {
        
        // Filled rounded corner style
        
        button.layer.cornerRadius = 10.0
        
    }
    
}

