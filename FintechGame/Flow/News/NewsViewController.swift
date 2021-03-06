//
//  NewsViewController.swift
//  FintechGame
//
//  Created by v.zhokhov on 08.10.2021.
//

import UIKit
import Charts

class NewsViewController: UIViewController, ChartViewDelegate {
    
    @IBOutlet weak var chartView: LineChartView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var upAndDown: UILabel!
    
    var stockData = [13, 23, 15, 17, 19, 31, 23, 15, 16, 14, 17, 23]
    
    var shouldHideData: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        chartView.delegate = self
        
        chartView.chartDescription?.enabled = false
        chartView.dragEnabled = true
        chartView.setScaleEnabled(true)
        chartView.pinchZoomEnabled = true
        
        
        chartView.leftAxis.enabled = true
        chartView.rightAxis.enabled = false
        
        chartView.xAxis.gridLineDashLengths = [10, 10]
        chartView.xAxis.gridLineDashPhase = 0
        
        let marker = BalloonMarker(color: UIColor(white: 180/255, alpha: 1),
                                   font: .systemFont(ofSize: 12),
                                   textColor: .white,
                                   insets: UIEdgeInsets(top: 8, left: 8, bottom: 20, right: 8))
        marker.chartView = chartView
        marker.minimumSize = CGSize(width: 80, height: 40)
        chartView.marker = marker
        
        chartView.legend.form = .line
        
        chartView.animate(xAxisDuration: 1)
        hoursInDay()
    }
    
    @IBAction func btnOne(_ sender: UIButton) {
        decreaseData()
        chartView.animate(xAxisDuration: 1)
    }
    
    @IBAction func btnTwo(_ sender: UIButton) {
        increaseData()
        chartView.animate(xAxisDuration: 1)
    }
    
    @IBAction func btnThree(_ sender: UIButton) {
        increaseData()
        chartView.animate(xAxisDuration: 1)
        
    }
    @IBAction func btnFour(_ sender: UIButton) {
        decreaseData()
        chartView.animate(xAxisDuration: 1)
    }
    
    @IBAction func btnFive(_ sender: UIButton) {
        increaseData()
        chartView.animate(xAxisDuration: 1)
    }
    
    func hoursInDay() {
        let hour = 24;
        var dataCount = 0;
        var dailyLineChartEntry = [ChartDataEntry]()
        for i in 1...24 {
            if(i%2 == 0){
                if(dataCount<12){
                    //                    print(dataCount)
                    let value = ChartDataEntry(x: Double(i), y: Double(stockData[dataCount]))
                    dailyLineChartEntry.append(value)
                    dataCount += 1
                    
                }
            }
        }
        leftAxisLimit(max: 35, min: 10)
        
        let line1 = LineChartDataSet(entries: dailyLineChartEntry, label: "24 Hours")
        line1.lineWidth = 3
        line1.circleRadius = 3
        line1.drawCircleHoleEnabled = false
        let data = LineChartData()
        data.addDataSet(line1)
        chartView.xAxis.labelPosition = .bottom
        chartView.data = data
        chartView.chartDescription?.text = "Daily"
        
        chartView.xAxis.gridLineDashLengths = [10, 10]
        chartView.xAxis.gridLineDashPhase = 0
        
        
        priceLabel.text = "$23.00"
        self.updateChartData()
    }
    
    func increaseData() {
        _ = 24;
        var dataCount = 0;
        var dailyLineChartEntry = [ChartDataEntry]()
        for i in 1...24 {
            if(i%2 == 0){
                if(dataCount<12){
                    let value = ChartDataEntry(x: Double(i), y: Double(stockData[dataCount]))
                    dailyLineChartEntry.append(value)
                    dataCount += 1
                    
                }
            }
        }
        
        let value = ChartDataEntry(x: Double(25), y: Double(30))
        dailyLineChartEntry.append(value)
        leftAxisLimit(max: 35, min: 10)
        
        let line1 = LineChartDataSet(entries: dailyLineChartEntry, label: "24 Hours")
        //        line1.setColor(UIColorFromRGB(rgbValue: 82ca9d))
        line1.lineWidth = 3
        line1.circleRadius = 3
        line1.drawCircleHoleEnabled = false
        let data = LineChartData()
        data.addDataSet(line1)
        chartView.xAxis.labelPosition = .bottom
        chartView.data = data
        chartView.chartDescription?.text = "Daily"
        
        chartView.xAxis.gridLineDashLengths = [10, 10]
        chartView.xAxis.gridLineDashPhase = 0
        
        priceLabel.text = "$30.00"
        upAndDown.text = "+$7 (+30%)"
        upAndDown.textColor = .green
        self.updateChartData()
        
    }
    
    func decreaseData() {
        _ = 24;
        var dataCount = 0;
        var dailyLineChartEntry = [ChartDataEntry]()
        for i in 1...24 {
            if(i%2 == 0){
                if(dataCount<12){
                    let value = ChartDataEntry(x: Double(i), y: Double(stockData[dataCount]))
                    dailyLineChartEntry.append(value)
                    dataCount += 1
                    
                }
            }
        }
        
        let value = ChartDataEntry(x: Double(25), y: Double(10))
        dailyLineChartEntry.append(value)
        
        leftAxisLimit(max: 35, min: 10)
        
        let line1 = LineChartDataSet(entries: dailyLineChartEntry, label: "24 Hours")
        line1.lineWidth = 3
        line1.circleRadius = 3
        line1.drawCircleHoleEnabled = false
        //        line1.setColor( hexStringToUIColor(hex: "#82ca9d") )
        //        line1.setCircleColor(hexStringToUIColor(hex: "#82ca9d") )
        let data = LineChartData()
        data.addDataSet(line1)
        chartView.xAxis.labelPosition = .bottom
        chartView.data = data
        chartView.chartDescription?.text = "Daily"
        
        chartView.xAxis.gridLineDashLengths = [10, 10]
        chartView.xAxis.gridLineDashPhase = 0
        
        priceLabel.text = "$10.00"
        upAndDown.text = "-$13 (-43%)"
        upAndDown.textColor = .red
        self.updateChartData()
        
    }
    
    func getNumber() -> Int {
        let number = Int.random(in: 3 ..< 10)
        return number
    }
    
    func updateChartData() {
        if self.shouldHideData {
            chartView.data = nil
            return
        }
        
        //        self.setDataCount(Int(x), range: UInt32(y))
    }
    
    func leftAxisLimit(max: Int, min: Int){
        let leftAxis = chartView.leftAxis
        leftAxis.removeAllLimitLines()
        //        leftAxis.addLimitLine(max)
        //        leftAxis.addLimitLine(ll2)
        leftAxis.axisMaximum = Double(max)
        leftAxis.axisMinimum = Double(min)
        leftAxis.gridLineDashLengths = [5, 5]
        leftAxis.drawLimitLinesBehindDataEnabled = true
        
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

