//
//  SleepSetting.swift
//  DreamDream
//
//  Created by 이원석 on 2021/06/04.
//

import Foundation
import HealthKit


var startTime = TimeInterval()
var timer:Timer = Timer()
var endTime = Date()

var alarmTime = Date()
let healthStore = HKHealthStore()

//희망하는 수면시각
var timeToSleep: Double = 22 // 디폴트는 밤 10시

//희망하는 수면시각
var myEnoughSleepTime: Double = 7

func saveSleepAnalysis() {
    // alarmTime and endTime are NSDate objects
    if let sleepType = HKObjectType.categoryType(forIdentifier: HKCategoryTypeIdentifier.sleepAnalysis) {
        
        // we create our new object we want to push in Health app
        let object = HKCategorySample(type:sleepType, value: HKCategoryValueSleepAnalysis.inBed.rawValue, start: alarmTime, end: endTime)
        
        
        // at the end, we save it
        healthStore.save(object, withCompletion: { (success, error) -> Void in
            
            if error != nil {
                print("fail to save sleep data")
                return
            }
            if success {
                print("My new data was saved in HealthKit")
                
            } else {
                // something happened again
            }
        })
    }
}
