//
//  ViewController.swift
//  BackgroundProj
//
//  Created by Baglan Daribayev on 2019-01-13.
//  Copyright © 2019 Daribayev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Button", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }


}

