//
//  ViewController.swift
//  SpeedTestProject
//
//  Created by Gamid Gapizov on 18.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    var gauge = GaugeView()
    var timer = Timer()
    let gradient = CAGradientLayer()
    
    let starsIV: UIImageView = {
        let IV = UIImageView()
        IV.image = UIImage(named: "stars")
        return IV
    }()
    let startStopButton: UIButton = {
        let button = UIButton()
        button.setTitle("START", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.systemGray5, for: .highlighted)
        button.titleLabel?.font = UIFont(name: "PathwayGothicOne-Regular", size: 40)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let speedTestLabel: UILabel = {
        let label = UILabel()
        label.text = "Speed Test"
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "PathwayGothicOne-Regular", size: 30)
        return label
    }()
    
    let pingNum: UILabel = {
        let label = UILabel()
        label.text = "--"
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "PathwayGothicOne-Regular", size: 45)
        return label
    }()
    let uploadNum: UILabel = {
        let label = UILabel()
        label.text = "--"
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "PathwayGothicOne-Regular", size: 45)
        return label
    }()
    let downloadNum: UILabel = {
        let label = UILabel()
        label.text = "--"
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "PathwayGothicOne-Regular", size: 45)
        return label
    }()
    let pingLabel: UILabel = {
        let label = UILabel()
        label.text = "Ping"
        label.textColor = .systemGray3
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Petrona-Light", size: 15)
        return label
    }()
    let uploadLabel: UILabel = {
        let label = UILabel()
        label.text = "Upload"
        label.textColor = .systemGray3
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Petrona-Light", size: 15)
        return label
    }()
    let downloadLabel: UILabel = {
        let label = UILabel()
        label.text = "Download"
        label.textColor = .systemGray3
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Petrona-Light", size: 15)
        return label
    }()
    
    let zeroLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Petrona-Light", size: 17)
        return label
    }()
    let twentyLabel: UILabel = {
        let label = UILabel()
        label.text = "20"
        label.textColor = .systemGray3
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Petrona-Light", size: 17)
        return label
    }()
    let fortyLabel: UILabel = {
        let label = UILabel()
        label.text = "40"
        label.textColor = .systemGray3
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Petrona-Light", size: 17)
        return label
    }()
    let sixstyLabel: UILabel = {
        let label = UILabel()
        label.text = "60"
        label.textColor = .systemGray3
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Petrona-Light", size: 17)
        return label
    }()
    let eightyLabel: UILabel = {
        let label = UILabel()
        label.text = "80"
        label.textColor = .systemGray3
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Petrona-Light", size: 17)
        return label
    }()
    let hundredLabel: UILabel = {
        let label = UILabel()
        label.text = "100"
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Petrona-Light", size: 17)
        return label
    }()
    let hundred20Label: UILabel = {
        let label = UILabel()
        label.text = "120"
        label.textColor = .systemGray3
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Petrona-Light", size: 15)
        return label
    }()
    let hundred40Label: UILabel = {
        let label = UILabel()
        label.text = "140"
        label.textColor = .systemGray3
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Petrona-Light", size: 15)
        return label
    }()
    let hundred60Label: UILabel = {
        let label = UILabel()
        label.text = "160"
        label.textColor = .systemGray3
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Petrona-Light", size: 15)
        return label
    }()
    let hundred80Label: UILabel = {
        let label = UILabel()
        label.text = "180"
        label.textColor = .systemGray3
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Petrona-Light", size: 15)
        return label
    }()
    let twoHundredLabel: UILabel = {
        let label = UILabel()
        label.text = "200"
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Petrona-Light", size: 15)
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .init(red: 32/255, green: 2/255, blue: 56/255, alpha: 1)
        
        starsIV.frame = self.view.bounds
        view.addSubview(starsIV)
        
        setUpSpeedTestLabel()
        setUpGauge()
        setUpGaugeNums()
        setUpNumStacks()
        setUpStartButton()
        
        addGradientToView(gauge.needle, gradientLayer: gradient, gradientWidth: gauge.needle.bounds.width, gradientHeight: gauge.needle.bounds.height, colorOne: .white, colorTwo: .systemYellow)
    }
    
    
    func setUpSpeedTestLabel() {
        view.addSubview(speedTestLabel)
        let speedTestLabelConstraints = [
            speedTestLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            speedTestLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            speedTestLabel.heightAnchor.constraint(equalToConstant: 55),
            speedTestLabel.widthAnchor.constraint(equalToConstant: 200)
        ]
        
        NSLayoutConstraint.activate(speedTestLabelConstraints)
    }
    func setUpStartButton() {
        view.addSubview(startStopButton)
        let startButtonConstraints = [
            startStopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startStopButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            startStopButton.heightAnchor.constraint(equalToConstant: 55),
            startStopButton.widthAnchor.constraint(equalToConstant: 180)
        ]
        
        NSLayoutConstraint.activate(startButtonConstraints)
        startStopButton.addTarget(self, action: #selector(startTapped), for: .touchUpInside)
    }
    func setUpGauge() {
        gauge = GaugeView(frame: .init(origin: .init(x: 0, y: 0), size: .init(width: 300, height: 280)))
        gauge.translatesAutoresizingMaskIntoConstraints = false
        gauge.backgroundColor = .clear
        
        gauge.outerBezelColor = .clear
        gauge.insideColor = .clear
        gauge.innerBezelColor = .clear
        
        gauge.minorTickCount = 0
        gauge.majorTickColor = .clear
        
        gauge.segmentWidth = 50
        gauge.segmentColors = [UIColor(red: 42/255, green: 34/255, blue: 98/255, alpha: 1)]
        gauge.valueLabel.alpha = 0
        
        gauge.needleColor = .systemYellow
        gauge.needleWidth = 10
        
        view.addSubview(gauge)
        let gaugeConstraints = [
            gauge.heightAnchor.constraint(equalToConstant: 280),
            gauge.widthAnchor.constraint(equalToConstant: 300),
            gauge.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gauge.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200)
        ]
        
        NSLayoutConstraint.activate(gaugeConstraints)
    }
    func setUpGaugeNums() {
        view.addSubview(zeroLabel)
        view.addSubview(twentyLabel)
        view.addSubview(fortyLabel)
        view.addSubview(sixstyLabel)
        view.addSubview(eightyLabel)
        view.addSubview(hundredLabel)
        view.addSubview(hundred20Label)
        view.addSubview(hundred40Label)
        view.addSubview(hundred60Label)
        view.addSubview(hundred80Label)
        view.addSubview(twoHundredLabel)
        
        let gaugeNumsConstraint = [
            zeroLabel.centerYAnchor.constraint(equalTo: gauge.bottomAnchor, constant: -140),
            zeroLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            
            twentyLabel.bottomAnchor.constraint(equalTo: zeroLabel.topAnchor, constant: -25),
            twentyLabel.leadingAnchor.constraint(equalTo: zeroLabel.trailingAnchor, constant: -5),
            
            fortyLabel.bottomAnchor.constraint(equalTo: twentyLabel.topAnchor, constant: -25),
            fortyLabel.leadingAnchor.constraint(equalTo: twentyLabel.trailingAnchor),
            
            
            
            hundredLabel.centerYAnchor.constraint(equalTo: gauge.topAnchor, constant: -15),
            hundredLabel.centerXAnchor.constraint(equalTo: gauge.centerXAnchor),
            
            eightyLabel.topAnchor.constraint(equalTo: hundredLabel.bottomAnchor, constant: -10),
            eightyLabel.trailingAnchor.constraint(equalTo: hundredLabel.leadingAnchor, constant: -25),
            
            sixstyLabel.topAnchor.constraint(equalTo: eightyLabel.bottomAnchor),
            sixstyLabel.trailingAnchor.constraint(equalTo: eightyLabel.leadingAnchor, constant: -20),
            
            hundred20Label.topAnchor.constraint(equalTo: hundredLabel.bottomAnchor, constant: -10),
            hundred20Label.leadingAnchor.constraint(equalTo: hundredLabel.trailingAnchor, constant: 25),
            
            hundred40Label.topAnchor.constraint(equalTo: hundred20Label.bottomAnchor, constant: 5),
            hundred40Label.leadingAnchor.constraint(equalTo: hundred20Label.trailingAnchor, constant: 20),
            
            
            
            twoHundredLabel.centerYAnchor.constraint(equalTo: gauge.bottomAnchor, constant: -140),
            twoHundredLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            hundred80Label.bottomAnchor.constraint(equalTo: twoHundredLabel.topAnchor, constant: -25),
            hundred80Label.trailingAnchor.constraint(equalTo: twoHundredLabel.leadingAnchor, constant: 15),
            
            hundred60Label.bottomAnchor.constraint(equalTo: hundred80Label.topAnchor, constant: -25),
            hundred60Label.trailingAnchor.constraint(equalTo: hundred80Label.leadingAnchor, constant: 5)
        ]
        
        NSLayoutConstraint.activate(gaugeNumsConstraint)
    }
    func setUpNumStacks() {
        view.addSubview(pingNum)
        view.addSubview(uploadNum)
        view.addSubview(downloadNum)
        
        view.addSubview(pingLabel)
        view.addSubview(uploadLabel)
        view.addSubview(downloadLabel)
        
        let speedLabelStackConstraint = [
            uploadLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            uploadLabel.topAnchor.constraint(equalTo: gauge.bottomAnchor, constant: -110),
            
            pingLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            pingLabel.topAnchor.constraint(equalTo: uploadLabel.topAnchor),
            
            downloadLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            downloadLabel.topAnchor.constraint(equalTo: uploadLabel.topAnchor),
        ]
        
        let speedNumStackConstraint = [
            uploadNum.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            uploadNum.topAnchor.constraint(equalTo: uploadLabel.bottomAnchor),
            
            pingNum.centerXAnchor.constraint(equalTo: pingLabel.centerXAnchor),
            pingNum.topAnchor.constraint(equalTo: uploadNum.topAnchor),
            
            downloadNum.centerXAnchor.constraint(equalTo: downloadLabel.centerXAnchor),
            downloadNum.topAnchor.constraint(equalTo: uploadNum.topAnchor),
        ]
        NSLayoutConstraint.activate(speedLabelStackConstraint)
        NSLayoutConstraint.activate(speedNumStackConstraint)
    }
    
    
    func addGradientToView(_ view: UIView, gradientLayer: CAGradientLayer, gradientWidth: CGFloat, gradientHeight: CGFloat, colorOne: UIColor, colorTwo: UIColor) {
        gradientLayer.frame = .init(x: 0, y: 0, width: gradientWidth, height: gradientHeight)
        gradientLayer.cornerRadius = view.layer.cornerRadius
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    
    @objc func startTapped(sender: UIButton) {
        if sender.titleLabel?.text == "START" {
            UIView.animate(withDuration: 1) {
                self.gauge.value = 0
                self.uploadNum.text = "0"
                self.pingNum.text = "0"
                self.downloadNum.text = "0"
            }
            
            sender.setTitle("STOP", for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(measureTest), userInfo: nil, repeats: true)
            timer.fire()
        } else if sender.titleLabel?.text == "STOP" {
            sender.setTitle("START", for: .normal)
            timer.invalidate()
        }
    }
    @objc func measureTest() {
        UIView.animate(withDuration: 1) {
            self.gauge.value = Int.random(in: 0...100)
            self.uploadNum.text = "\(self.gauge.value * 2)"
            self.pingNum.text = "\(Int.random(in: 0...100))"
            self.downloadNum.text = "\(Int.random(in: 0...200))"
        }
    }
}

