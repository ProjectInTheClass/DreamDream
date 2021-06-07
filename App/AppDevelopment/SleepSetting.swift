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

// 새벽 1시를 25시, 26시로 변환해주는 함수
func timeChanger(arr : [Double]) -> [Double]{
    var newArr : [Double] = []
    for i in arr{
        if i < 0600{
            newArr.append(i + 2400)
        }else{
            newArr.append(i)
        }
    }
    return newArr
}

// 표준편차를 계산해주는 함수
 func standardDeviation(timeArr : [Double]) -> Double
{
    let newTime = timeChanger(arr: timeArr)
    let length = Double(newTime.count)

    let avg = newTime.reduce(0, {$0 + $1}) / length
    print(avg)
    let sumOfSquaredAvgDiff = (newTime.map { pow($0 - avg, 2.0)}.reduce(0, {$0 + $1})) / length
    return sqrt(sumOfSquaredAvgDiff)
}

//수면 분석
// 평균 수면시간이 너무 길거나 짧은 경우
// 잠 자는 시각이 너무 불규칙 한 경우 ( 편차 알아보기 ) ** 새벽에 담드는 경우 시간이 01시, 02시로 되는거를 25시 26시로 계산해야함
// 잠 자는 시각이 너무 늦은 새벽인 경우
// 일어나는 시각이 불규칙한 경우??
// enum 공부해와서 밑에거 완성하기
/*let jansori : String: enum{
    switch  {
    case tooLateSleep:
        return "씨발놈아 일찍 좀 자"
    default:
        <#code#>
    }
}*/
