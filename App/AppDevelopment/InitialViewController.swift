//
//  ViewController.swift
//  DreamDream
//

import UIKit
import HealthKit

class InitialViewController: UIViewController {
    public var startTime = TimeInterval()
    public var timer1:Timer = Timer()
    public var timer2:Timer = Timer()

//    public var endTime: NSDate!
 //   public var alarmTime: NSDate!
    public let healthStore = HKHealthStore()
    public var buttonflag : Int = 0
    @IBOutlet weak var displayTimeLabel: UILabel!
    
    @IBOutlet weak var alarmTimeLabel: UILabel!
    @IBOutlet weak var dreamIconButton: UIButton!
    @IBOutlet weak var currentTimeLabel: UILabel!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getCurrentTime()
        
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
        
    }
    private func getCurrentTime() {
        timer1 = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(self.currentTime) , userInfo: nil, repeats: true)
    }

    @objc func currentTime() {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm:ss a"
        currentTimeLabel.text = formatter.string(from: Date())
    }
    
    @IBAction func startButtonTapped(_ sender: Any) {
        if self.buttonflag == 0 {
            print("start!!")
            start()
            buttonflag = 1
        }else{
            stop()
            buttonflag = 0
        }
    }
    
    func start(){
        alarmTime = NSDate() as Date
        if (!timer2.isValid) {
            let aSelector : Selector = #selector(InitialViewController.updateTime)
            timer2 = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: aSelector, userInfo: nil, repeats: true)
            startTime = NSDate.timeIntervalSinceReferenceDate
        }
    }
    
  
    func stop() {
        endTime = NSDate() as Date
        saveSleepAnalysis()
        timer2.invalidate()
        
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

