//
//  BuySellViewController.swift
//  FintechGame
//
//  Created by v.zhokhov on 08.10.2021.
//

import UIKit
import Charts

/// Экран для обучения покупке продаже акций по цене
final class BuySellViewController: UIViewController, ChartViewDelegate {
   
    private var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.textColor = .black
        label.text = "0.00"
        label.sizeToFit()
        return label
    }()
    
    private var upAndDownLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.textColor = .black
        label.text = "+/-"
        label.sizeToFit()
        return label
    }()
    
    private lazy var chartView: LineChartView = {
        let chartView = LineChartView()
        chartView.translatesAutoresizingMaskIntoConstraints = false
        chartView.backgroundColor = .systemTeal
        chartView.delegate = self
        chartView.dragEnabled = true
        
        chartView.leftAxis.enabled = true
        chartView.rightAxis.enabled = false
        chartView.xAxis.gridLineDashPhase = 0
        chartView.legend.form = .line
        return chartView
    }()
 
    private lazy var multipleView: MultipleView = {
        let view = MultipleView()
        view.leftButtonLabel.text = "Купить"
        view.rightButtonLabel.text = "Продать"
        view.delegate = self
        return view
    }()

    var shouldHideData: Bool = false
    
    // пока мок файл
    var stockData = [13, 23, 15, 17, 19, 31, 23, 15, 16, 14, 17, 23]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Цена"
        view.backgroundColor = .white
        setupView()
        setupMarker()
        chartView.animate(xAxisDuration: 1)
        hoursInDay()
    }
    
    private func setupMarker() {
        let marker = BalloonMarker(color: UIColor(white: 180/255, alpha: 1),
                                   font: .systemFont(ofSize: 12),
                                   textColor: .white,
                                   insets: UIEdgeInsets(top: 8, left: 8, bottom: 20, right: 8))
        marker.color = .green
        marker.textColor = .black
        
        marker.chartView = chartView
        marker.minimumSize = CGSize(width: 80, height: 40)
        chartView.marker = marker
    }
    
    private func setupView() {
        
        view.addSubview(priceLabel)
        view.addSubview(upAndDownLabel)
        view.addSubview(chartView)
        view.addSubview(multipleView)
        
        NSLayoutConstraint.activate([
        
            priceLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            priceLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            
            upAndDownLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            upAndDownLabel.leftAnchor.constraint(equalTo: priceLabel.rightAnchor, constant: 20),
            
            chartView.heightAnchor.constraint(equalToConstant: 329),
            chartView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            chartView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            chartView.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 20),
            
            multipleView.heightAnchor.constraint(equalToConstant: 60),
            multipleView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            multipleView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            multipleView.topAnchor.constraint(equalTo: chartView.bottomAnchor, constant: 20)
        ])
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

    @objc private func buyButtonHandler(sender: UIButton) {
        increaseData()
        chartView.animate(xAxisDuration: 1)
    }
    
    @objc private func sellButtonHandler(sender: UIButton) {
        decreaseData()
        chartView.animate(xAxisDuration: 1)
    }

    
    func hoursInDay() {
        _ = 24;
        var dataCount = 0;
        var dailyLineChartEntry = [ChartDataEntry]()
        for i in 1...24 {
            if (i % 2 == 0) {
                if(dataCount < 12){
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
        
        
        priceLabel.text = "23.00 $"
        self.updateChartData()
    }
    
    private func increaseData() {
        _ = 24;
        var dataCount = 0;
        var dailyLineChartEntry = [ChartDataEntry]()
        for i in 1...24 {
            if(i % 2 == 0){
                if(dataCount<12){
//                    print(dataCount)
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
        //
        upAndDownLabel.text = "+$7 (+30%)"
        upAndDownLabel.textColor = .green
        self.updateChartData()

    }
    
    private func decreaseData() {
        _ = 24;
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
        
        // цена упала
        upAndDownLabel.text = "-$13 (-43%)"
        upAndDownLabel.textColor = .red
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
}

// MARK: - MultipleViewDelegate

extension BuySellViewController: MultipleViewDelegate {
    
    func leftButtonHandler() {
        increaseData()
        chartView.animate(xAxisDuration: 1)
    }
    
    func rightButtonHandler() {
        decreaseData()
        chartView.animate(xAxisDuration: 1)
    }
}
