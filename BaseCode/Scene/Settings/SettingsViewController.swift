//
//  SettingsViewController.swift
//  BaseCode
//
//  Created by Ferhan Akkan on 17.08.2020.
//

import UIKit

class SettingsViewController: UIViewController {
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.backgroundColor = .white
        tableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: Constants.SettingViewController.settingsTableViewCell)
        return tableView
    }()
    
    let settingsViewModel = SettingsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
    }
    
}

//MARK: - Set UI

extension SettingsViewController {
    
    private func setTableView() {
        self.view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

//MARK: - TableView Delegate & Datasource

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsViewModel.settingsTitles[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.SettingViewController.settingsTableViewCell, for: indexPath) as! SettingsTableViewCell
        let cellTitle: String = settingsViewModel.settingsTitles[indexPath.section][indexPath.row]
        cell.label.text = cellTitle
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return " "
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return settingsViewModel.settingsTitles.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedCell: String = settingsViewModel.settingsTitles[indexPath.section][indexPath.row]
        
        switch selectedCell {
        case "AuthViewController.SettingsViewModel.editLanguage".localized():
            let vc = EditLanguageViewController()
            navigationController?.show(vc, sender: nil)
        default:
            print("default")
        }
    }
}
