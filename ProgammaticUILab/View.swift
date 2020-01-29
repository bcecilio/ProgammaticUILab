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
        let SV = UIStackView()
        SV.backgroundColor = .lightGray
        return SV
    }()
    
    public lazy var redButton: UIButton = {
        let red = UIButton()
        red.backgroundColor = .red
        red.layer.cornerRadius = 0.5 * red.bounds.size.width
        return red
    }()
    
    public lazy var greenButton: UIButton = {
        let green = UIButton()
        green.backgroundColor = .red
        green.layer.cornerRadius = 0.5 * green.bounds.size.width
        return green
    }()
    
    public lazy var blueButton: UIButton = {
        let blue = UIButton()
        blue.backgroundColor = .blue
        blue.layer.cornerRadius = 0.5 * blue.bounds.size.width
        return blue
    }()
    
    var randomRed: CGFloat = 0.0
    var randomGreen: CGFloat = 0.0
    var randomBlue: CGFloat = 0.0
    var emptyColorArr = [CGFloat]()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
        generateRandomColor()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
        generateRandomColor()
    }
    
    private func commonInit() {
        setUpView()
        setUpStackView()
        setUpButtons()
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
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.topAnchor.constraint(equalTo: colorView.bottomAnchor, constant: 20)
        ])
    }
    
    private func setUpButtons() {
        addSubview(redButton)
        addSubview(greenButton)
        addSubview(blueButton)
        redButton.translatesAutoresizingMaskIntoConstraints = false
        greenButton.translatesAutoresizingMaskIntoConstraints = false
        blueButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
        ])
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
