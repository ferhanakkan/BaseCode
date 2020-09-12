//
//  EditLanguageViewController.swift
//  BaseCode
//
//  Created by Ferhan Akkan on 17.08.2020.
//

import UIKit

class EditLanguageViewController: UIViewController {
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.backgroundColor = .white
        tableView.register(EditLanguageTableViewCell.self, forCellReuseIdentifier: Constants.SettingViewController.EditLanguageViewController.editlanguageTableViewCell)
        return tableView
    }()
    
    let editLanguageViewModel = EditLanguageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setTableView()
    }
    
}

//MARK: - Set UI

extension EditLanguageViewController {
    
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

extension EditLanguageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return editLanguageViewModel.languageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.SettingViewController.EditLanguageViewController.editlanguageTableViewCell, for: indexPath) as! EditLanguageTableViewCell
        let cellTitle: String = editLanguageViewModel.languageArray[indexPath.row]
        cell.label.text = cellTitle
        if !editLanguageViewModel.checkCurrentLanguage(index: indexPath.row) {
            cell.myImageView.image = nil
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return " "
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedCell: String = editLanguageViewModel.languageArray[indexPath.row]
        
        switch selectedCell {
        case "EditLanguageViewController.EditLanguageViewModel.english".localized():
            AppManager.shared.setLanguage(language: .english)
        case "EditLanguageViewController.EditLanguageViewModel.turkish".localized():
            AppManager.shared.setLanguage(language: .turkish)
        default:
            print("default")
        }
    }
}

