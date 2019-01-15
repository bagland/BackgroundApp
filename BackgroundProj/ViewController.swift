//
//  ViewController.swift
//  BackgroundProj
//
//  Created by Baglan Daribayev on 2019-01-13.
//  Copyright © 2019 Daribayev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 40.0, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func setCount(_ count: Int) {
        label.text = String(count)
    }


}

