//
//  ViewController.swift
//  Timer aap
//
//  Created by Shubh Patni on 05/01/1939 Saka.
//  Copyright © 1939 Saka Shubh Patni. All rights reserved.
//

import UIKit

import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    
    var audioPlayer = AVAudioPlayer()
    
     var timer = Timer()
    
    func decreseTimer(){
        
        if time > 0{
            
            time -= 1
            
            timerLabel.text = String(time)
            
        }else{
            
            timer.invalidate()
            
        }
        
        slider.setValue(Float(timerLabel.text!)!, animated: true)
        
        if timerLabel.text == String(0){
            
            audioPlayer.play()
            
        }
        
    }

    @IBOutlet var play: UIBarButtonItem!
    
    @IBOutlet var timerLabel: UILabel!
    
    @IBOutlet var slider: UISlider!
   
    var time = 0
    
    @IBAction func reset(_ sender: Any) {
        
        time = 0
        
        timerLabel.text = String(time)
        
        slider.isEnabled = true
        
        play.isEnabled = true
        
        slider.setValue(0, animated: true)
        
        audioPlayer.pause()
        
    }
    
    @IBAction func playButton(_ sender: Any) {
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.decreseTimer), userInfo: nil, repeats: true)
        
        play.isEnabled = false
        
        slider.isEnabled = false
        
    }
    
    @IBAction func pauseButton(_ sender: Any) {
   
        timer.invalidate()
        
        play.isEnabled = true
        
        audioPlayer.pause()
        
    }

    @IBAction func slider(_ sender: UISlider) {
  
    time = Int(sender.value)
        
    timerLabel.text = String(time)
    
    }
    @IBAction func plusTen(_ sender: Any) {
   
    time += 10
        
        timerLabel.text = String(time)

    }
    @IBAction func minusTen(_ sender: Any) {
    
        if time > 10 {
            
            time -= 10
            
            timerLabel.text = String(time)
            
        }else{
            
            //do nothing
            
        }
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        do{
            
          let audioPath = Bundle.main.path(forResource: "alarm", ofType: ".mp3")
            
            try audioPlayer = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            
        }catch{
            
            // show an error message
            
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

