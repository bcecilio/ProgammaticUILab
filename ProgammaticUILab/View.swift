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
//        generateRandomColor()
        return colorView
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
