//
//  SidebarSubCell.swift
//  BaseCode
//
//  Created by Ferhan Akkan on 12.08.2020.
//

import UIKit

class SidebarSubCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
}

//MARK: - Set Cell UI

extension SidebarSubCell {
    
    private func setUI() {
        self.contentView.backgroundColor = .clear
        self.backgroundColor = .clear
        setImageView()
        setTitle()
    }
    
    private func setImageView() {
        imageView!.translatesAutoresizingMaskIntoConstraints = false
        imageView?.heightAnchor.constraint(equalToConstant: 40).isActive = true
        imageView?.widthAnchor.constraint(equalToConstant: 40).isActive = true
        imageView?.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        imageView?.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 30).isActive = true
    }
    
    private func setTitle() {
        textLabel!.translatesAutoresizingMaskIntoConstraints = false
        textLabel?.font = UIFont.worksansSemiBold(fontSize: 15)
        textLabel?.textAlignment = .left
        textLabel?.leadingAnchor.constraint(equalTo: imageView!.trailingAnchor, constant: 20).isActive = true
        textLabel?.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        textLabel?.topAnchor.constraint(greaterThanOrEqualTo: self.contentView.topAnchor, constant: 10).isActive = true
        textLabel?.bottomAnchor.constraint(lessThanOrEqualTo: self.contentView.bottomAnchor, constant: 10).isActive = true
        textLabel?.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10).isActive = true
        textLabel?.textColor = .white
    }
}
