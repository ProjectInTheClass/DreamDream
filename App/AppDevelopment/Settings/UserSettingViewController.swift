//
//  UserSettingViewController.swift
//  DreamDream
//
//  Created by 원석 on 2021/05/04.
//

import UIKit

class UserSettingViewController: UIViewController {

    @IBOutlet weak var hopeSleepingHourInputField: UITextField!
    
    @IBOutlet weak var wakeUpTimePicker: UIDatePicker!
    public var setWakeUpTime : String = "미입력"
    override func viewDidLoad() {
        super.viewDidLoad()
        wakeUpTimePicker.backgroundColor = .white

    
    }
    
    @IBAction func wakeUpTimeChanged(_ sender: Any) {
        let settingdateformatter = DateFormatter()
        settingdateformatter.dateFormat = "HH : mm"
        setWakeUpTime = settingdateformatter.string(from: wakeUpTimePicker.date)
        print("피커로 받은 값 (변환전) \(wakeUpTimePicker.date)")
        print(setWakeUpTime)

    
             
      

    }
    
// 기상시각 - 수면시각 - 현재시각 = 잠자리에 들어야하는 시각!!
// 잠자리에 들어야하는 시각 - 현재시간 = 잠자리에 들기까지 남은 시간!!

}
