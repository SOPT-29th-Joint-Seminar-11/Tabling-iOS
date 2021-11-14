//
//  BaseTableViewCell.swift
//  Tabling-iOS
//
//  Created by Thisisme Hi on 2021/11/14.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    
    // MARK: Initializing
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configUI()
        setupAutoLayout()
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init(style: .default, reuseIdentifier: nil)
    }
    
    // MARK: - Override Method
    
    func configUI() {
        // Override ConfigUI
    }
    
    func setupAutoLayout() {
        // Override Layout
    }
    
}
