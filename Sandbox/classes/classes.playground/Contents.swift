import UIKit
import Foundation

//일단 멤버변수는 다 var로 만들어 놓고 나중에 let으로 바꿀건 바꾸기

class SleepTime{
    let fallAsleepTime: Date?
    let wakeTime: Date
    
    init(fallAsleepTime: Date, wakeTime: Date) {
        self.fallAsleepTime = fallAsleepTime
        self.wakeTime = wakeTime
    }
}

//음량 범위를 0~100으로 한정하는 것 추가하기
//여러 알람 중 한가지 알람만 isMain 값으로 True를 가질 수 있게 하기
class Alarm{
    var _alarmTime: Date
    var _soundTrack: String
    var _volume: Int
    var _vibration: Bool
    var _repeatTime: Int
    var _repeatInterval: Int //min
    var _isMain: Bool
    var _maxDuration: Int
    
    init(alarmTime: Date, soundTrack: String, volume: Int, vibration: Bool, repeatTime: Int, repeatInterval: Int, isMain: Bool, maxDuration: Int ) {
        self._alarmTime = alarmTime
        self._soundTrack = soundTrack
        self._volume = volume
        self._vibration = vibration
        self._repeatTime = repeatTime
        self._repeatInterval = repeatInterval
        self._isMain = isMain
        self._maxDuration = maxDuration
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
    
    var isMain: Bool{
        get{
            return _isMain
        }set{
            _isMain = newValue
        }
    }
    
    var maxDuration: Int{
        get{
            return _maxDuration
        }set{
            _maxDuration = newValue
        }
    }
}


//10:02:02 형식을 초로 변환하는 알고리즘 추가하기
class Contents{
    var _title: String
    var _URL: String
    var _length: Int
    var _img: UIImage?
    
    init(title: String, URL: String, length: Int, img: UIImage) {
        self._title = title
        self._URL = URL
        self._length = length
        self._img = img
    }
    
    var title: String{
        get{
            return _title
        }set{
            _title = newValue
        }
    }
    
    var URL: String{
        get{
            return _URL
        }set{
            _URL = newValue
        }
    }
    
    var length: Int{
        get{
            return _length
        }set{
            _length = newValue
        }
    }
    
    var img: UIImage{
        get{
            return _img!
        }set{
            _img = newValue
        }
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

// 인스턴스 실제로 만들어보기

// 1. 알람 인스턴스
let calendar = Calendar.current
var targetDate1: Date? = {
    var comps = DateComponents(calendar: calendar, year: 2021, month: 5, day: 6, hour: 20, minute: 30)
    comps.timeZone = TimeZone.init(identifier: "UTC")
    return comps.date
}()
var alarm1 = Alarm(alarmTime: targetDate1!, soundTrack: "song2", volume: 55, vibration: true, repeatTime: 5, repeatInterval: 5, isMain: true, maxDuration: 30)

//print(alarm1.alarmTime)
//print(alarm1.soundTrack)
//print(alarm1.volume)
//print(alarm1.vibration)
//print(alarm1.repeatTime)
//print(alarm1.repeatTime)
//print(alarm1.isMain)
//print(alarm1.maxDuration)

//targetDate1 = DateComponents(calendar: calendar, year: 2021, month: 5, day: 8, hour: 20, minute: 00).date //Date의 값을 바꾸는 법. (새로 초기화 하지 않고)
//alarm1.alarmTime = targetDate1!
//print(alarm1.alarmTime)

var targetDate2: Date? = {
    var comps = DateComponents(calendar: calendar, year: 2021, month: 6, day: 1, hour: 20, minute: 30)
    comps.timeZone = TimeZone.init(identifier: "UTC")
    return comps.date
}()
var targetDate3: Date? = {
    var comps = DateComponents(calendar: calendar, year: 2021, month: 6, day: 2, hour: 20, minute: 30)
    comps.timeZone = TimeZone.init(identifier: "UTC")
    return comps.date
}()
var targetDate4: Date? = {
    var comps = DateComponents(calendar: calendar, year: 2021, month: 6, day: 3, hour: 20, minute: 30)
    comps.timeZone = TimeZone.init(identifier: "UTC")
    return comps.date
}()

var alarm2 = Alarm(alarmTime: targetDate2!, soundTrack: "song3", volume: 65, vibration: true, repeatTime: 5, repeatInterval: 5, isMain: false, maxDuration: 30)
var alarm3 = Alarm(alarmTime: targetDate3!, soundTrack: "song4", volume: 75, vibration: true, repeatTime: 5, repeatInterval: 5, isMain: false, maxDuration: 30)
var alarm4 = Alarm(alarmTime: targetDate4!, soundTrack: "song5", volume: 85, vibration: true, repeatTime: 5, repeatInterval: 5, isMain: false, maxDuration: 30)

// 2. 컨텐츠 인스턴스

let contents1 = Contents(title: "10시간 잔잔한 수면음악 🎵 스트레스 해소음악, 잠잘때 듣는 음악, 불면증치료음악, 수면유도음악 (My Dream)", URL: "https://www.youtube.com/watch?v=p2fxv3PAtLU", length: (10*3600)+(2*60)+2, img: #imageLiteral(resourceName: "142CE865-8358-4F69-9684-40348C1E811A.jpeg"))

//print(contents1.title)
//print(contents1.URL)
//print(contents1.length)
//print(contents1.img)

let contents2 = Contents(title: "10시간 잔잔한 수면음악 🎵 스트레스 해소음악, 잠잘때 듣는 음악, 불면증치료음악, 수면유도음악 (My Dream)", URL: "https://www.youtube.com/watch?v=p2fxv3PAtLU", length: (10*3600)+(2*60)+2, img: #imageLiteral(resourceName: "142CE865-8358-4F69-9684-40348C1E811A.jpeg"))

let contents3 = Contents(title: "10시간 당신을 위로하는 수면음악 🎵 스트레스해소음악, 불면증치료음악, 잠잘오는음악, 수면유도음악 (Remember)", URL: "https://www.youtube.com/watch?v=lHn7xv4Zxjg", length: (10*3600)+(2*60)+2, img: #imageLiteral(resourceName: "512E9607-1A2E-4CF7-B8B2-86BFA18EC8D9.jpeg"))

let contents4 = Contents(title: """
♥6시간 델타파,미국 수면의학회 추천 수면음악,백색소음,asmr,빗소리,잠오는영상,잠오는 소리,잠오는 클래식,깊은 수면음악,불면증치료,잠오는 노래 ,잠잘오는음악,잠잘오는노래
""", URL: "https://www.youtube.com/watch?v=QWjVYAJ8bIQ", length: (10*3600)+(2*60)+2, img: #imageLiteral(resourceName: "6989E04D-1B1D-4CE4-A008-2AFFE9AE4EEE.jpeg"))

let contents5 = Contents(title: "10분안에 마취시켜주는 수면유도음악 | 잠잘때 듣는 음악", URL: "https://www.youtube.com/watch?v=WIqe9vM4U34", length: (10*3600)+(2*60)+2, img: #imageLiteral(resourceName: "C391073E-9AB5-4A79-ABBA-B060BDC4A653.jpeg"))

//3. 수면 시간 인스턴스

var sleepTime1 = SleepTime(fallAsleepTime: targetDate1!, wakeTime: targetDate2!)
var sleepTime2 = SleepTime(fallAsleepTime: targetDate3!, wakeTime: targetDate4!)

//4. 사용자 설정 인스턴스
let sleepPrefDict: Dictionary<Date,Date> = [targetDate1!:targetDate2!]
var userConfig = UserConfiguration(alarms: [alarm1,alarm2,alarm3,alarm4], sleepPreference: sleepPrefDict, contentsLibrary: [contents1,contents2,contents3,contents4,contents5])

//print(userConfig.getAlarms)
//print(userConfig.sleepPreference)


