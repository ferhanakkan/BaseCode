//
//  SidebarTitleCell.swift
//  BaseCode
//
//  Created by Ferhan Akkan on 12.08.2020.
//

import UIKit

class SidebarTitleCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
}

//MARK: - Set Cell UI

extension SidebarTitleCell {
    
    private func setUI() {
        self.contentView.backgroundColor = .clear
        self.backgroundColor = .clear
        setImageView()
        setTitle()
    }
    
    private func setImageView() {
        imageView!.translatesAutoresizingMaskIntoConstraints = false
        imageView?.heightAnchor.constraint(equalToConstant: 70).isActive = true
        imageView?.widthAnchor.constraint(equalToConstant: 70).isActive = true
        imageView?.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        imageView?.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30).isActive = true
        imageView?.makeRoundWithBorder(borderColor: .orange, borderWidth: 5, cornerRadius: 35)
    }
    
    private func setTitle() {
        textLabel!.translatesAutoresizingMaskIntoConstraints = false
        textLabel?.font = UIFont.worksansSemiBold(fontSize: 20)
        textLabel?.textAlignment = .left
        textLabel?.leadingAnchor.constraint(equalTo: imageView!.trailingAnchor, constant: 20).isActive = true
        textLabel?.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        textLabel?.topAnchor.constraint(greaterThanOrEqualTo: self.contentView.topAnchor, constant: 10).isActive = true
        textLabel?.bottomAnchor.constraint(lessThanOrEqualTo: self.contentView.bottomAnchor, constant: 10).isActive = true
        textLabel?.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10).isActive = true
        textLabel?.textColor = .white
    }
}
