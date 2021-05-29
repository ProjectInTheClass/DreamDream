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
    
    var resultToSleepAmount : [TimeInterval] = []
    
    var startTime = TimeInterval()
    var timer:Timer = Timer()
    var endTime: NSDate!
    var alarmTime: NSDate!
    let healthStore = HKHealthStore()
    let testDays = ["05.01", "05.02", "05.03", "05.04", "05.05", "05.06", "05.07", "05.08", "05.09", "05.10", "05.10", "05.11"]
 

    override func viewDidLoad() {
        super.viewDidLoad()

        retrieveSleepAnalysis()
        //setChart(days: self.testDays, sleepTimes: self.resultToSleepAmount)
        
        
        barChartView.noDataText = "데이터가 없습니다."
        barChartView.noDataFont = .systemFont(ofSize: 20)
        barChartView.noDataTextColor = .lightGray
        
        
    
        
        let typestoRead = Set([
            HKObjectType.categoryType(forIdentifier: HKCategoryTypeIdentifier.sleepAnalysis)!
                ])
        
            let typestoShare = Set([
                HKObjectType.categoryType(forIdentifier: HKCategoryTypeIdentifier.sleepAnalysis)!
                ])
        
        
            
        self.healthStore.requestAuthorization(toShare: typestoShare, read: typestoRead) { (success, error) -> Void in
                if success == false {
                    NSLog(" Display not allowed")
                }
        }
     //   print("시발 크기는 이거다 \(self.resultToSleepAmount.count)")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setChart(days: self.testDays, sleepTimes: self.resultToSleepAmount)
    }
   
    
    
    // 아래 함수는 화면을 다시 켰을때, 즉 잠금모드 이후에 어플을 다시 활성화 시에 등록
    func stop(sender: AnyObject) {
        endTime = NSDate()
        saveSleepAnalysis()
        retrieveSleepAnalysis()
        timer.invalidate()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func retrieveSleepAnalysis() {
      
        // first, we define the object type we want
        if let sleepType = HKObjectType.categoryType(forIdentifier: HKCategoryTypeIdentifier.sleepAnalysis) {
            print(sleepType)
            // Use a sortDescriptor to get the recent data first
            let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: false)
            
            // we create our query with a block completion to execute
            
            let query = HKSampleQuery(sampleType: sleepType, predicate: nil, limit: 7, sortDescriptors: [sortDescriptor]) { (query, tmpResult, error) -> Void in
                
                if error != nil {
                    // something happened
                    return
                }
                if let result = tmpResult {
                                       // do something with my data
                    for item in result {
                        if let sample = item as? HKCategorySample {
                            let value = (sample.value == HKCategoryValueSleepAnalysis.inBed.rawValue) ? "InBed" : "Asleep"
                            print("Healthkit sleep: \(sample.startDate) \(sample.endDate) - value: \(value)")
                            
                            DispatchQueue.main.async {
                                self.resultToSleepAmount.append(CFDateGetTimeIntervalSinceDate(sample.endDate as CFDate, sample.startDate as CFDate)/60)
                            }
                            
                            
                            
                          }
                        print("total amount of sleep time : \(self.resultToSleepAmount), 현재 크기는 : \(self.resultToSleepAmount.count)")
                    }
                }
            }
            // finally, we execute our query
            healthStore.execute(query)
            
        }
    }
    
    func saveSleepAnalysis() {
        // alarmTime and endTime are NSDate objects
        if let sleepType = HKObjectType.categoryType(forIdentifier: HKCategoryTypeIdentifier.sleepAnalysis) {
            
            // we create our new object we want to push in Health app
            let object = HKCategorySample(type:sleepType, value: HKCategoryValueSleepAnalysis.inBed.rawValue, start: self.alarmTime as Date, end: self.endTime as Date)
            
            // at the end, we save it
            healthStore.save(object, withCompletion: { (success, error) -> Void in
                
                if error != nil {
                    // something happened
                    return
                }
                if success {
                    print("My new data was saved in HealthKit")
                    
                } else {
                    // something happened again
                }
            })
            let object2 = HKCategorySample(type:sleepType, value: HKCategoryValueSleepAnalysis.asleep.rawValue, start: self.alarmTime as Date, end: self.endTime as Date)
            
            healthStore.save(object2, withCompletion: { (success, error) -> Void in
                if error != nil {
                    // something happened
                    return
                }
                if success {
                    print("My new data (2) was saved in HealthKit")
                } else {
                    // something happened again
                    }
                }
            )
        }
    }
    func setChart(days: [String], sleepTimes: [Double]) {
        // 데이터 생성
        var dataEntries: [BarChartDataEntry] = []
        //days.count 로 바꾸자~ 아마 7일로만 하게
        for i in 0...2 {
            let dataEntry = BarChartDataEntry(x: Double(i), y: sleepTimes[i])
            dataEntries.append(dataEntry)
        }

        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "수면시간")

        // 차트 컬러
        chartDataSet.colors = [.systemGray]

        // 데이터 삽입
        let chartData = BarChartData(dataSet: chartDataSet)
        barChartView.data = chartData
        // X축 레이블 위치 조정
        barChartView.xAxis.labelPosition = .bottom
        // X축 레이블 포맷 지정
        barChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: days)
        barChartView.xAxis.labelTextColor = .white
        
    }
}
    

