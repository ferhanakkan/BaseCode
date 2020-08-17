//
//  SettingsTableViewCell.swift
//  BaseCode
//
//  Created by Ferhan Akkan on 17.08.2020.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {
    
    let label: UILabel = {
        let label = UILabel()
        label.font = UIFont.worksansSemiBold(fontSize: 15)
        label.textColor = .gray
        label.numberOfLines = 0
        return label
    }()
    
    let myImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.setImage(#imageLiteral(resourceName: "success"))
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setCellUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
}

//MARK: - Set UI

extension SettingsTableViewCell {
    private func setCellUI() {
        setLabel()
        setImageView()
    }
    
    private func setLabel() {
        self.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            label.topAnchor.constraint(greaterThanOrEqualTo: self.topAnchor, constant: 15),
            label.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: -15),
            label.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    private func setImageView() {
        self.addSubview(myImageView)
        myImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myImageView.heightAnchor.constraint(equalToConstant: 20),
            myImageView.widthAnchor.constraint(equalToConstant: 20),
            myImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            myImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
    }
}
