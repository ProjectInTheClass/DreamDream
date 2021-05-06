import UIKit
import Foundation

class SleepTime{
    let date: Date
    let fallAsleepTime: Date
    let timeSlept: Double
    
    init(date: Date, fallAsleepTime: Date, timeSlept: Double) {
        self.date = date
        self.fallAsleepTime = fallAsleepTime
        self.timeSlept = timeSlept
    }
}

//Number는 필요 없는 것 같아서 구현 안함 일단
class Alarm{
    let alarmTime: Date
    let soundTrack: String
    let volume: Int
    let vibration: Bool
    let repeatTime: Int
    let repeatInterval: Int //min
    
    init(alarmTime: Date, soundTrack: String, volume: Int, vibration: Bool, repeatTime: Int, repeatInterval: Int ) {
        self.alarmTime = alarmTime
        self.soundTrack = soundTrack
        self.volume = volume
        self.vibration = vibration
        self.repeatTime = repeatTime
        self.repeatInterval = repeatInterval
    }
}

class Contents{
    let title: String
    let URL: String
    let length: Int
    
    init(title: String, URL: String, length: Int) {
        self.title = title
        self.URL = URL
        self.length = length
    }
}

//추가할 부분: 멤버변수 없이도 초기화가 되어야함
//추가할 부분: 알람 수정, 콘텐츠 라이브러리 수정 메소드(?) 추가해야함
class UserConfiguration{
    var alarms: [Alarm]
    var sleepPreference: <Date, Date>
    var contentsLibrary: [Contents]
    
    init(alarms: [Alarm], sleepPreference: <Date, Date>, contentsLibrary: [Contents]) {
        self.alarms = alarms
        self.sleepPreference = sleepPreference
        self.contentsLibrary = contentsLibrary
    }
}


