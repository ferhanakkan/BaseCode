//
//  UITableView.swift
//  DortMevsimSwift
//
//  Created by Ferhan Akkan on 23.09.2020.
//

import UIKit

extension UITableView {
    func scrollToBottom(){

        DispatchQueue.main.async {
            if (self.numberOfRows(inSection:  self.numberOfSections-1) - 1) > 0 {
                let indexPath = IndexPath(
                    row: self.numberOfRows(inSection:  self.numberOfSections-1) - 1,
                    section: self.numberOfSections-1)
                self.scrollToRow(at: indexPath, at: .bottom, animated: true)
            }

        }
    }
}
