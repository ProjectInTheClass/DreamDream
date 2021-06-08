import UIKit

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

 func standardDeviation(timeArr : [Double]) -> Double
{
    let newTime = timeChanger(arr: timeArr)
    let length = Double(newTime.count)

    let avg = newTime.reduce(0, {$0 + $1}) / length
    print(avg)
    let sumOfSquaredAvgDiff = (newTime.map { pow($0 - avg, 2.0)}.reduce(0, {$0 + $1})) / length
    return sqrt(sumOfSquaredAvgDiff)
}

standardDeviation(timeArr:  [20,26,27,24])
