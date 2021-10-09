//
//  TraidCard.swift
//  FintechGame
//
//  Created by v.zhokhov on 09.10.2021.
//

import UIKit
import Charts

class TraidCard: UIView {
    
    /// Данные котировок акций
    var stockData = [13, 23, 15, 17, 19, 31, 23, 15, 16, 14, 17, 23]
    
    var shouldHideData: Bool = false
    
    var referense: String?
    
    lazy var characterView: UIImageView = {
        let imageView = UIImageView()
//        imageView.image = UIImage(named: "oleg")
        imageView.backgroundColor = .clear
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let backgroundView: UIView = {
        let background = UIView()
        background.translatesAutoresizingMaskIntoConstraints = false
        background.clipsToBounds = true
        background.layer.cornerRadius = 10
        background.backgroundColor = .white
        return background
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
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var sharingButton: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "sharing")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped))
        imageView.addGestureRecognizer(tapGR)
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
//    lazy var sharingButton: UIButton = {
//        let button = UIButton()
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.imageView?.image = UIImage(named: "lightning")
//        button.setImage(UIImage(named: "sharing"), for: .normal)
//        button.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
//        button.addTarget(self, action: #selector(tapOnButton(sender:)), for: .touchUpInside)
//        button.tag = 1
//        button.layer.shadowColor = UIColor.black.cgColor
//        button.layer.shadowOpacity = 0.2
//        button.layer.shadowOffset = .zero
//        button.layer.shadowRadius = 1
//        button.backgroundColor = .orange
//        return button
//    }()
        
    private let descriptionTextFiled: UITextView = {
        let sampleTextField =  UITextView()
//        sampleTextField.text = """
//            Акция — это доля в компании. Инвестор, купивший акции, становится совладельцем бизнеса, он может претендовать на часть его прибыли и имущества. Чем большую прибыль получит эмитент, тем больше заработает акционер. С другой стороны, если компания обанкротится, то и стоимость акций упадёт до нуля — тогда инвестор потеряет деньги.
//"""
        sampleTextField.translatesAutoresizingMaskIntoConstraints = false
        sampleTextField.font = UIFont.systemFont(ofSize: 17)
        sampleTextField.showsVerticalScrollIndicator = false
        sampleTextField.isScrollEnabled = true
        sampleTextField.sizeToFit()
        return sampleTextField
    }()
    
    init(withImage image: UIImage?, title: String, stockArray: [Int], referense: String?) {
        super.init(frame: .zero)
        imageView.image = image
        descriptionTextFiled.text = title
        stockData = stockArray
        self.referense = referense
        initialize()
        setupOleg()
        setupMarker()
        chartView.animate(xAxisDuration: 1)
        hoursInDay()
        addSharingButton()
    }
    
    required init?(coder aDecoder: NSCoder) { return nil }
    
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
    
    private func initialize() {
        addSubview(backgroundView)
        backgroundView.anchorToSuperview()
        backgroundView.addSubview(chartView)
        backgroundView.addSubview(descriptionTextFiled)
        NSLayoutConstraint.activate([
            chartView.topAnchor.constraint(equalTo: backgroundView.topAnchor),
            chartView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor),
            chartView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor),
            chartView.heightAnchor.constraint(equalToConstant: 400),
            
            descriptionTextFiled.topAnchor.constraint(equalTo: chartView.bottomAnchor, constant: 20),
            descriptionTextFiled.leadingAnchor.constraint(equalTo: chartView.leadingAnchor, constant: 15),
            descriptionTextFiled.trailingAnchor.constraint(equalTo: chartView.trailingAnchor, constant: -15),
            descriptionTextFiled.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -20)
        ])
        applyShadow(radius: 8, opacity: 0.2, offset: CGSize(width: 0, height: 2))
    }
    
    private func setupOleg() {
        chartView.addSubview(characterView)
        NSLayoutConstraint.activate([
            characterView.leadingAnchor.constraint(equalTo: chartView.leadingAnchor, constant: 20),
            characterView.topAnchor.constraint(equalTo: chartView.topAnchor, constant: 20),
            
        ])
    }
    
    private func addSharingButton() {
        backgroundView.addSubview(sharingButton)
        NSLayoutConstraint.activate([
            sharingButton.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -20),
            sharingButton.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -20),
            sharingButton.heightAnchor.constraint(equalToConstant: 50),
            sharingButton.widthAnchor.constraint(equalToConstant: 50)
        ])
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
        
        
//        priceLabel.text = "\(Router.userBalance) $"
        self.updateChartData()
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
    
    func updateChartData() {
        if self.shouldHideData {
            chartView.data = nil
            return
        }
        // self.setDataCount(Int(x), range: UInt32(y))
    }
    
//    @objc private func tapOnButton(sender: UIButton) {
//        if let url = URL(string: self.referense ?? "") {
//            UIApplication.shared.open(url)
//        }
//    }
//
    @objc func imageTapped(sender: UITapGestureRecognizer) {
        if let url = URL(string: self.referense ?? "") {
            UIApplication.shared.open(url)
        }
    }
}

extension TraidCard: ChartViewDelegate {
    
}

extension TraidCard {
}
