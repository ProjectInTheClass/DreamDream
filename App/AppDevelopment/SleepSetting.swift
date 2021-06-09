//
//  SleepSetting.swift
//  DreamDream
//
//  Created by 이원석 on 2021/06/04.
//

import Foundation
import HealthKit


var startTime = TimeInterval()
//var timer:Timer = Timer()
var endTime = Date()

var alarmTime = Date()
let healthStore = HKHealthStore()

//희망하는 잠자리에 드는 시각
var timeToSleep: Double = 22 // 디폴트는 밤 10시

//희망하는 수면시각
var myEnoughSleepTime: Double = 7

//희망하는 기상시각
var hopeWakeUpTime : String = "아직 입력하지 않았습니다."

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

// 새벽 1시를 25시, 26시로 변환해주는 함수
func timeChanger(arr : [Double]) -> [Double]{
    var newArr : [Double] = []
    for i in arr{
        if i < 06{
            newArr.append(i + 24)
        }else{
            newArr.append(i)
        }
    }
    return newArr
}

enum sleepFeedback {
    case irregularSleepTime
    case lackOfSleepingHour
    case lateSleeptime
    case good
    
}
// 수면습관을 분석해주는 함수
func sleepAnalizer(sleepStartTime : [Double],timeArr : [Double]) -> sleepFeedback
{
    let length = Double(sleepStartTime.count)
    
    let newSleepStartTime = timeChanger(arr: sleepStartTime)
    
    let avgSleepStartTime = newSleepStartTime.reduce(0, {$0 + $1}) / length
    
    let deviation = (newSleepStartTime.map { pow($0 - avgSleepStartTime, 2.0)}.reduce(0, {$0 + $1})) / length
    
    let stdevp = sqrt(deviation)
    
    if stdevp > 2.5{
        return .irregularSleepTime
    }
    
    let avgSleephour = timeArr.reduce(0, {$0 + $1}) / length
    
    if avgSleephour < 7{
        return .lackOfSleepingHour
    }
    
    if avgSleepStartTime >= 25{
        return .lateSleeptime
    }
    
    return .good
}



func getFeedback(info : sleepFeedback) -> String{
    switch info {
    case .irregularSleepTime:
        return "잠자리에 드는 시각이 너무 불규칙합니다. 불규칙한 수면패턴은 생활리듬을 깨는 가장 큰 요인이에요!!\n 규칙적으로 잠자리에 드는건 어떠신가요? 😅"
    case .lackOfSleepingHour:
        return "너무 잠을 적게 주무시네요😭 하루 권장 수면시간은 7~8시간이에요!! 건강을 위해서 조금 더 주무시는건 어떠신가요? 🥺"
    case .lateSleeptime:
        return "너무 늦게 잠을 자고 있어요!! 너무 늦게 자면 잠을 오래 자더라도 피로가 잘 풀리지 않는답니다. 오늘부터라도 좀 더 일찍 잠자리에 드는 습관을 길러보세요! 😉"
    case .good:
        return "좋은 수면습관을 가지고 있습니다!! 이대로 쭉 좋은 습관을 유지하신다면 분명 삶에 큰 도움이 될거에요!!🤗"
    }
}
