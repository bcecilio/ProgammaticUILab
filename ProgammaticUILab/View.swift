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
        colorView.layer.cornerRadius = 10
        return colorView
    }()
    
    public lazy var stackView: UIStackView = {
        let SV = UIStackView(arrangedSubviews: [redButton, greenButton, blueButton])
        SV.backgroundColor = .lightGray
        return SV
    }()
    
    public lazy var redButton: UIButton = {
        let red = UIButton()
        red.tag = 0
        red.backgroundColor = .red
        red.frame = CGRect(x: 160, y: 100, width: 20, height: 20)
        red.layer.cornerRadius = 0.5 * red.bounds.size.width
        red.clipsToBounds = true
        red.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        return red
    }()
    
    public lazy var greenButton: UIButton = {
        let green = UIButton()
        green.tag = 1
        green.backgroundColor = .green
        green.frame = CGRect(x: 160, y: 100, width: 20, height: 20)
        green.layer.cornerRadius = 0.5 * green.bounds.size.width
        green.clipsToBounds = true
        green.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        return green
    }()
    
    public lazy var blueButton: UIButton = {
        let blue = UIButton()
        blue.tag = 2
        blue.backgroundColor = .blue
        blue.frame = CGRect(x: 160, y: 100, width: 20, height: 20)
        blue.layer.cornerRadius = 0.5 * blue.bounds.size.width
        blue.clipsToBounds = true
        blue.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        return blue
    }()
    
    public lazy var resetButton: UIButton = {
        let reset = UIButton()
        reset.layer.borderWidth = 0.5
        reset.frame = CGRect(x: 160, y: 100, width: 20, height: 20)
        reset.layer.cornerRadius = 0.5 * reset.bounds.size.width
        reset.clipsToBounds = true
        reset.setTitle("Reset", for: .normal)
        reset.setTitleColor(.black, for: .normal)
        reset.addTarget(self, action: #selector(resetButtonPressed(_:)), for: .touchUpInside)
        return reset
    }()
    
    public lazy var scoreLabel: UILabel = {
        let score = UILabel()
        return score
    }()
    
    public lazy var messageLabel: UILabel = {
        let gameOver = UILabel()
        return gameOver
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
        setUpScoreLabel()
    }
    
    private func setUpView() {
        addSubview(colorView)
        colorView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            colorView.topAnchor.constraint(equalTo: topAnchor, constant: 130),
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
            resetButton.topAnchor.constraint(equalToSystemSpacingBelow: scoreLabel.bottomAnchor, multiplier: 5)
        ])
    }
    
    private func setUpScoreLabel() {
        addSubview(scoreLabel)
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scoreLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            scoreLabel.topAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 5)
        ])
    }
    
    private func setUpMessageLabel() {
        addSubview(messageLabel)
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            messageLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            messageLabel.topAnchor.constraint(equalToSystemSpacingBelow: scoreLabel.bottomAnchor, multiplier: 20)
        ])
    }
    
    @objc private func resetButtonPressed(_ sender: UIButton) {
        emptyColorArr = []
        generateRandomColor()
        currentScore = 0
        finalScore = currentScore
        messageLabel.text = nil
        redButton.isEnabled = true
        greenButton.isEnabled = true
        blueButton.isEnabled = true
    }
    
    @objc private func buttonPressed(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            if emptyColorArr[0] == emptyColorArr.max() ?? 0.1 {
                currentScore += 1
                scoreLabel.text = "Score: \(currentScore)"
                emptyColorArr = []
                generateRandomColor()
            } else {
                currentScore = finalScore
                scoreLabel.text = "Score: \(currentScore)"
                setUpResetButton()
                redButton.isEnabled = false
                greenButton.isEnabled = false
                blueButton.isEnabled = false
                setUpMessageLabel()
                messageLabel.text = "You Lost DUDE! Reset the game to continue!"
                setUpResetButton()
            }
        case 1:
            if emptyColorArr[1] == emptyColorArr.max() ?? 0.1 {
                currentScore += 1
                scoreLabel.text = "Score: \(currentScore)"
                emptyColorArr = []
                generateRandomColor()
            } else {
                currentScore = finalScore
                scoreLabel.text = "Score: \(currentScore)"
                setUpResetButton()
                redButton.isEnabled = false
                greenButton.isEnabled = false
                blueButton.isEnabled = false
                setUpMessageLabel()
                messageLabel.text = "You Lost DUDE! Reset the game to continue!"
                setUpResetButton()
            }
        case 2:
            if emptyColorArr[2] == emptyColorArr.max() ?? 0.1 {
                currentScore += 1
                scoreLabel.text = "Score: \(currentScore)"
                emptyColorArr = []
                generateRandomColor()
            } else {
                currentScore = finalScore
                scoreLabel.text = "Score: \(currentScore)"
                setUpResetButton()
                redButton.isEnabled = false
                greenButton.isEnabled = false
                blueButton.isEnabled = false
                setUpMessageLabel()
                messageLabel.text = "You Lost DUDE! Reset the game to continue!"
                setUpResetButton()
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
