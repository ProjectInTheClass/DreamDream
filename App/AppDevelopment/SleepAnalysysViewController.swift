//
//  SleepAnalysysViewController.swift
//  DreamDream
//
//  Created by 원석 on 2021/05/04.
//

import UIKit
import HealthKit
import Charts
   


class SleepAnalysysViewController: UIViewController{
    
    @IBOutlet weak var homeButton: UIButton!
    
    @IBOutlet weak var backGroundImage: UIImageView!
    
    @IBOutlet var displayTimeLabel: UILabel!
    
    @IBOutlet weak var barChartView: BarChartView!
    
    @IBOutlet weak var lineChartView: LineChartView!
    
    @IBOutlet weak var sleepAnalyzeLabel: UILabel!
    
    var recentSleepDate : [String] = [] // sleep start date  MM / dd
    var recentSleepStartHour : [String] = [] // sleep start hour for line chart
    var recentSleepStartHourDouble : [Double] = []
    var recentSleepEndHour: [String] = []
    
    var resultToSleepAmount : [TimeInterval] = []
    var wakeUp : [Double] = []

  
 
    override func viewDidLoad() {
        super.viewDidLoad()
        lineChartView.noDataText = "데이터를 불러오는데 실패했습니다."
        lineChartView.noDataFont = .systemFont(ofSize: 20)
        lineChartView.noDataTextColor = .lightGray
        

        self.retrieveSleepAnalysis{ payload, error in
            DispatchQueue.main.async {
                print("payload : \(payload)")
                if let payload = payload{
                    
                    self.recentSleepStartHourDouble = self.stringTimeToDouble(stringTime: payload)!
                    self.wakeUp = self.wakeupTimeCalculation(start: timeChanger(arr: self.recentSleepStartHourDouble) , end: self.resultToSleepAmount)
                    print("line 52 .. wakeup :  \(self.wakeUp)")
                    self.setChart(days: self.recentSleepDate.reversed(), sleepTimes:timeChanger(arr: self.recentSleepStartHourDouble.reversed()) , wakeupTimes: self.wakeUp.reversed() )
        

                    let myProblem = sleepAnalizer(sleepStartTime: self.recentSleepStartHourDouble, timeArr: self.resultToSleepAmount)
                    self.sleepAnalyzeLabel.text = getFeedback(info: myProblem)
                }
            }
        }
        




        let typestoRead = Set([
            HKObjectType.categoryType(forIdentifier: HKCategoryTypeIdentifier.sleepAnalysis)!
                ])
        
            let typestoShare = Set([
                HKObjectType.categoryType(forIdentifier: HKCategoryTypeIdentifier.sleepAnalysis)!
                ])
        
        
            
        healthStore.requestAuthorization(toShare: typestoShare, read: typestoRead) { (success, error) -> Void in
                if success == false {
                    NSLog(" Display not allowed")
                }
        }
    }


    // 아래 함수는 화면을 다시 켰을때, 즉 잠금모드 이후에 어플을 다시 활성화 시에 등록
   /* func stop(sender: AnyObject) {
        endTime = NSDate()
        saveSleepAnalysis()
        timer.invalidate()
    }*/
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func retrieveSleepAnalysis( completionHandler:@escaping ( [String]?, Error?) -> Void) {
        print("retrieve 함수 진입")
        // first, we define the object type we want
        if let sleepType = HKObjectType.categoryType(forIdentifier: HKCategoryTypeIdentifier.sleepAnalysis) {
           // print(sleepType)
            // Use a sortDescriptor to get the recent data first
            let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: false)
            
            // we create our query with a block completion to execute
            
            let query = HKSampleQuery(sampleType: sleepType, predicate: nil, limit: 10, sortDescriptors: [sortDescriptor]) { (query, Result, error) -> Void in
                
                if error != nil {
                    print("107번째 라인 오류뜸 nil을 줄건데")
                    completionHandler(nil, error)
                    return
                }
                if let result = Result {
                    print("line 117   Result : \(result)")

                    
                    
                                  // process each samples
                    for item in result {
                        if let sample = item as? HKCategorySample {
                            
                            
                            let value = (sample.value == HKCategoryValueSleepAnalysis.inBed.rawValue) ? "InBed" : "Asleep"
                      
                            print("Healthkit sleep: \(sample.startDate) \(sample.endDate) - value: \(value)")
                            let sleepHour = Calendar.current.component(.hour, from: sample.startDate)
                            print("현지시각으로 잠든시간 \(sleepHour)")
                            
                            if sleepHour < 19 && sleepHour > 12{
                                print("낮잠")
                            }
                            
                            else{
                                self.resultToSleepAmount.append(CFDateGetTimeIntervalSinceDate(sample.endDate as CFDate, sample.startDate as CFDate)/3600)
                                let myDateFormatter = DateFormatter()
                                myDateFormatter.dateFormat = "MM / dd"
                                myDateFormatter.locale = Locale(identifier: "ko_KR")
                                let sleepDate = myDateFormatter.string(from: sample.startDate)
                                self.recentSleepDate.append(sleepDate)
                                
                                let myHourFormatter = DateFormatter()
                                myHourFormatter.dateFormat = "HHmm"
                                myHourFormatter.locale = Locale(identifier: "ko_KR")
                                let sleepStartHour = myHourFormatter.string(from: sample.startDate)
                                self.recentSleepStartHour.append(sleepStartHour)
                                print("잠든 시간은 몇시몇분? \(sleepStartHour)")
                                let sleepEndHour = myHourFormatter.string(from: sample.endDate)
                                self.recentSleepEndHour.append(sleepEndHour)
                                print("일어난 시간은?? \(sleepEndHour)")
                                
                                
                            }
                        }
                        print("total amount of sleep time : \(self.resultToSleepAmount), 현재 크기는 : \(self.resultToSleepAmount.count)")
                    }
                    
                    completionHandler(self.recentSleepStartHour, nil)
                }
            }
            // finally, we execute our query
            healthStore.execute(query)
            

            
        }
        
    }
    

    
    
    
    func setChart(days: [String], sleepTimes: [Double], wakeupTimes: [Double]) {
        // 데이터 생성
        print("********************\nset Chart 함수 진입\n********************")
        var dataEntries1: [ChartDataEntry] = []
        var dataEntries2: [ChartDataEntry] = []
        let data = LineChartData()
        //days.count 로 바꾸자~ 아마 7일로만 하게
        if days.count == sleepTimes.count && days.count == wakeupTimes.count && days.count > 0{
            
            for i in 0 ... days.count - 1 {
                let dataEntry1 = ChartDataEntry(x: Double(i), y: Double(sleepTimes[i]))
                dataEntries1.append(dataEntry1)
            }

            let sleepStartLine = LineChartDataSet(entries: dataEntries1, label: "잠든시각")
            data.addDataSet(sleepStartLine)
            
            
            for i in 0 ... days.count - 1 {
                let dataEntry2 = ChartDataEntry(x: Double(i), y: Double(wakeupTimes[i]))
                dataEntries2.append(dataEntry2)
            }

            let sleepEndLine = LineChartDataSet(entries: dataEntries2, label: "기상시각")
            data.addDataSet(sleepEndLine)
            
            
            // 차트 컬러
            sleepStartLine.colors = [.systemGray]
            sleepStartLine.circleHoleColor = .systemGray
            sleepStartLine.drawFilledEnabled = true
            sleepEndLine.colors = [.systemBlue]
            sleepEndLine.circleHoleColor = .systemBlue
            sleepEndLine.drawFilledEnabled = true
            
            

            // 데이터 삽입
         //   let chartData = LineChartData(dataSet: [sleepStartLine,sleepEndLine])
            
            lineChartView.data = data
            // X축 레이블 위치 조정
            lineChartView.xAxis.labelPosition = .bottom
            // X축 레이블 포맷 지정
            lineChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: days)
            lineChartView.xAxis.labelTextColor = .white
        }
        print(data)
    }
    
    //this function converts times saved in string type to Int type For chart value
    func stringTimeToDouble(stringTime:[String]?)->[Double]?{
        print("********************\nstring Time to double 함수 진입\n********************")
        if stringTime == nil{
            print("224 line nil 반환")
            return nil
        }
        var returnArray : [Double] = []
        for i in stringTime!{
            let intTime = Int(i)!
            let convertedTime =  (intTime / 100) * 60 + intTime % 100
            let result : Double! = Double(convertedTime) / 60
            returnArray.append(result)
        }
        return returnArray
    }
    
    //this function returns time sleeping time per day
    func wakeupTimeCalculation(start:[Double],end:[Double])->[Double]{
        print("********************\nwakeupTimeCalculation 함수 진입\n********************")

        if  start.count != end.count || start.count == 0{
            print("Error Start Count ")
            return []
        }
        else{
            print("Start count : \(start.count)")
            var calculatedWakeUpTime : [Double] = []
            for i in 0...(start.count - 1){
                let value = start[i] + end[i]
                
                calculatedWakeUpTime.append(value)
            }
            return calculatedWakeUpTime
        }
    }
    
}


