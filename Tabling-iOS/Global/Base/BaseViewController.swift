//
//  BaseViewController.swift
//  Tabling-iOS
//
//  Created by Thisisme Hi on 2021/11/14.
//

import UIKit

class BaseViewController: UIViewController {
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        configUI()
        setupAutoLayout()
    }
    
    // MARK: - Override Method
    
    func configUI() {
        // Override UI
    }
    
    func setupAutoLayout() {
        // Override Layout
    }
    
}
