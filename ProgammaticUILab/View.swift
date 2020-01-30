//
//  View.swift
//  ProgammaticUILab
//
//  Created by Brendon Cecilio on 1/29/20.
//  Copyright © 2020 Brendon Cecilio. All rights reserved.
//

import UIKit

class View: UIView {
    
    public lazy var colorView: UIView = {
        let colorView = UIView()
        return colorView
    }()
    
    public lazy var stackView: UIStackView = {
        let SV = UIStackView(arrangedSubviews: [redButton, greenButton, blueButton])
        SV.backgroundColor = .lightGray
        return SV
    }()
    
    public lazy var redButton: UIButton = {
        let red = UIButton()
        
        red.backgroundColor = .red
        red.layer.cornerRadius = 0.5 * red.bounds.size.width
        red.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        return red
    }()
    
    public lazy var greenButton: UIButton = {
        let green = UIButton()
        green.backgroundColor = .green
        green.layer.cornerRadius = 0.5 * green.bounds.size.width
        green.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        return green
    }()
    
    public lazy var blueButton: UIButton = {
        let blue = UIButton()
        blue.backgroundColor = .blue
        blue.layer.cornerRadius = 0.5 * blue.bounds.size.width
        blue.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        return blue
    }()
    
    public lazy var resetButton: UIButton = {
        let reset = UIButton()
        reset.backgroundColor = .lightGray
        reset.layer.cornerRadius = 0.5 * reset.bounds.size.width
        return reset
    }()
    
    var currentScore = 0
    var finalScore = 0
    var randomRed: CGFloat = 0.0
    var randomGreen: CGFloat = 0.0
    var randomBlue: CGFloat = 0.0
    var emptyColorArr = [CGFloat]()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
        
    }
    
    private func commonInit() {
        setUpView()
        generateRandomColor()
        setUpStackView()
    }
    
    private func setUpView() {
        addSubview(colorView)
        colorView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            colorView.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            colorView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            colorView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            colorView.heightAnchor.constraint(equalToConstant: 400),
            colorView.widthAnchor.constraint(equalToConstant: 350)
        ])
    }
    
    private func setUpStackView() {
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 100
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.topAnchor.constraint(equalTo: colorView.bottomAnchor, constant: 20)
        ])
    }
    
    private func setUpResetButton() {
        addSubview(resetButton)
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            resetButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            resetButton.topAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 50)
        ])
    }
    
    @objc private func buttonPressed(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            if emptyColorArr[0] == emptyColorArr.max() ?? 0.1 {
                currentScore += 1
                emptyColorArr = []
                generateRandomColor()
            } else {
                currentScore = finalScore
                setUpResetButton()
                redButton.isEnabled = false
                greenButton.isEnabled = false
                blueButton.isEnabled = false
            }
        case 2:
            if emptyColorArr[1] == emptyColorArr.max() ?? 0.1 {
                currentScore += 1
                emptyColorArr = []
                generateRandomColor()
            } else {
                currentScore = finalScore
                setUpResetButton()
                redButton.isEnabled = false
                greenButton.isEnabled = false
                blueButton.isEnabled = false
            }
        case 3:
            if emptyColorArr[2] == emptyColorArr.max() ?? 0.1 {
                currentScore += 1
                emptyColorArr = []
                generateRandomColor()
            } else {
                currentScore = finalScore
                setUpResetButton()
                redButton.isEnabled = false
                greenButton.isEnabled = false
                blueButton.isEnabled = false
            }
        default:
            print("wrong")
        }
    }
    
    private func generateRandomColor() {
        randomRed = CGFloat.random(in: 0...1)
        randomGreen = CGFloat.random(in: 0...1)
        randomBlue = CGFloat.random(in: 0...1)
        
        let randomColor = UIColor(displayP3Red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1)
        
        colorView.backgroundColor = randomColor
        
        emptyColorArr.append(randomRed)
        emptyColorArr.append(randomGreen)
        emptyColorArr.append(randomBlue)
    }
}
