//
//  ViewController.swift
//  DreamDream
//

import UIKit
import HealthKit

class InitialViewController: UIViewController {
    public var startTime = TimeInterval()
    public var timer:Timer = Timer()
    public var endTime: NSDate!
    public var alarmTime: NSDate!
    public let healthStore = HKHealthStore()
    
    @IBOutlet weak var displayTimeLabel: UILabel!
    
    @IBOutlet weak var dreamIconButton: UIButton!

    @IBOutlet weak var currentTimeLabel: UILabel!
    override func viewDidLoad() {
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "HH:mm:ss"
        let formattedDate = format.string(from: date)
        currentTimeLabel.text = formattedDate
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
        
        
    }
    @IBAction func startButtonTapped(_ sender: Any) {
        alarmTime = NSDate()
        if (!timer.isValid) {
            let aSelector : Selector = #selector(InitialViewController.updateTime)
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: aSelector, userInfo: nil, repeats: true)
            startTime = NSDate.timeIntervalSinceReferenceDate
        }
    }
    
    @objc func updateTime() {
        let currentTime = NSDate.timeIntervalSinceReferenceDate
        
        //Find the difference between current time and start time.
        var elapsedTime: TimeInterval = currentTime - startTime
        let hours = UInt8(elapsedTime / 3600)
        
        //calculate the minutes in elapsed time.
        let minutes = UInt8(elapsedTime / 60.0)
        elapsedTime -= (TimeInterval(minutes) * 60)
        
        //calculate the seconds in elapsed time.
        let seconds = UInt8(elapsedTime)
        elapsedTime -= TimeInterval(seconds)
        
        //find out the fraction of milliseconds to be displayed.
        //let fraction = UInt8(elapsedTime * 100)
        
        //add the leading zero for minutes, seconds and millseconds and store them as string constants
        let setHours = String(format: "%02d", hours)
        let strMinutes = String(format: "%02d", minutes)
        let strSeconds = String(format: "%02d", seconds)
        //let strFraction = String(format: "%02d", fraction)
        
        //concatenate minuets, seconds and milliseconds as assign it to the UILabel
        displayTimeLabel.text = "\(setHours):\(strMinutes):\(strSeconds)"
    }
}

