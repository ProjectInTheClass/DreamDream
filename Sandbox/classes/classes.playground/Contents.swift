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
    var _alarmTime: Date
    var _soundTrack: String
    var _volume: Int
    var _vibration: Bool
    var _repeatTime: Int
    var _repeatInterval: Int //min
    
    init(alarmTime: Date, soundTrack: String, volume: Int, vibration: Bool, repeatTime: Int, repeatInterval: Int ) {
        self._alarmTime = alarmTime
        self._soundTrack = soundTrack
        self._volume = volume
        self._vibration = vibration
        self._repeatTime = repeatTime
        self._repeatInterval = repeatInterval
    }
    
    //getter and setter
    var alarmTime: Date{
        get{
            return _alarmTime
        }set{
            _alarmTime = newValue
        }
    }
    
    var soundTrack: String{
        get{
            return _soundTrack
        }set{
            _soundTrack = newValue
        }
    }
    
    var volume: Int{
        get{
            return _volume
        }set{
            _volume = newValue
        }
    }
    
    var vibration: Bool{
        get{
            return _vibration
        }set{
            _vibration = newValue
        }
    }
    
    var repeatTime: Int{
        get{
            return _repeatTime
        }set{
            _repeatTime = newValue
        }
    }
    
    var repeatInterval: Int{
        get{
            return _repeatInterval
        }set{
            _repeatInterval = newValue
        }
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
    var _alarms: [Alarm]
    var _sleepPreference: Dictionary<Date, Date>
    var _contentsLibrary: [Contents]
    
    init(alarms: [Alarm], sleepPreference: Dictionary<Date, Date>, contentsLibrary: [Contents]) {
        self._alarms = alarms
        self._sleepPreference = sleepPreference
        self._contentsLibrary = contentsLibrary
    }
    
    var getAlarms: [Alarm] {
        get{
            return _alarms
        }
    }
    
    var addAlarm: Alarm{
        get{
            return _alarms[0]
        }set{
            _alarms.append(newValue)
        }
    }
    
    var removeAlarm: Int{
        get{
            return 0
        }set{
            _alarms.remove(at: newValue)
        }
    }
    
    var sleepPreference: Dictionary<Date, Date> {
        get{
            return _sleepPreference
        }set{
            _sleepPreference = newValue
        }
    }
}

