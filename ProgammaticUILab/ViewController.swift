//
//  ViewController.swift
//  ProgammaticUILab
//
//  Created by Brendon Cecilio on 1/29/20.
//  Copyright © 2020 Brendon Cecilio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let colorView = View()
    
    override func loadView() {
        view = colorView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        navigationItem.title = "Color Guessing Game"
    }


}

