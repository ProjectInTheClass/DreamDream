import UIKit
import Foundation

//1. 현재 시간 포맷에 맞게 출력
let date = Date()
var formatter = DateFormatter()
formatter.dateFormat = "YYYY-MM"
print(formatter.string(from: date))

//2. 원하는 날짜 포맷 만들기
let date1 = DateFormatter()
date1.timeZone = TimeZone.init(identifier: "UTC")
date1.dateFormat = "YYYY-MM-dd HH-mm"
print(date1.date(from: "2021-03-02 20-49"))

//3. 각각의 시/분/초 구하기
let date2 = Date()
let calendar = Calendar.current
let components = calendar.dateComponents([.hour, .minute, .second], from: date2)

print(components)

//4. 두 날짜와 현재의 시간 차이 구하기

let targetDate1: Date? = {
    var comps = DateComponents(calendar: calendar, year: 2021, month: 5, day: 6, hour: 20, minute: 30)
    comps.timeZone = TimeZone.init(identifier: "UTC")
    return comps.date
}()

let targetDate2: Date? = {
    var comps = DateComponents(calendar: calendar, year: 2021, month: 5, day: 7, hour: 08, minute: 25)
    comps.timeZone = TimeZone.init(identifier: "UTC")
    return comps.date
}()

let interval = targetDate2!.timeIntervalSince(targetDate1!)
let day = Int(interval / 86400)
let hour = Int(interval / 3600) % 24
let minuit = Int(interval / 60) % 60

print("\(day)일 \(hour)시간 \(minuit)분")


// 1) 알람 시작 시간과 끝 시간 구하기
// 2) 알람 시작 시간과 현재 시간 차이구하기, 알람 끝 시작과 현재 시간 차이 구하기
// 3) 알람의 시작 시간과 끝 시간을 각각 Date 인스턴스로 만들기
