//
//  ActivityCell.swift
//  FinalProject
//
//  Created by Williams-Waldemar, Spencer A on 11/29/20.
//  Copyright © 2020 Williams-Waldemar, Spencer A. All rights reserved.
//

import UIKit
// CONFIGURES CELLS FOR TABLEVIEW
class ActivityCell: UITableViewCell {
    
    var ActivityTitleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(ActivityTitleLabel)
        
        configureTitleLabel()
        setTitleLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureTitleLabel() {
        ActivityTitleLabel.numberOfLines = 0
        ActivityTitleLabel.adjustsFontSizeToFitWidth = true
        ActivityTitleLabel.font = UIFont(name: "HelveticaNeue", size: ActivityTitleLabel.font.pointSize)
        
        
    }
    
    func setTitleLabelConstraints(){
        ActivityTitleLabel.translatesAutoresizingMaskIntoConstraints   = false
        ActivityTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        ActivityTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive  = true
        ActivityTitleLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        ActivityTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    
    
    
    
    
}
