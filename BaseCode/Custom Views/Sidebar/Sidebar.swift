//
//  Sidebar.swift
//  BaseCode
//
//  Created by Ferhan Akkan on 12.08.2020.
//

import UIKit

class Sidebar: UIView {
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.backgroundColor = .clear
        tableView.register(SidebarTitleCell.self, forCellReuseIdentifier: Constants.TableViewCellNames.Sidebar.sidebarTitleCell)
        tableView.register(SidebarSubCell.self, forCellReuseIdentifier: Constants.TableViewCellNames.Sidebar.sidebarSubCell)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let menuList: [String] = ["Profile","Settings","Sign Out"]
    
    let menuLocalizedList: [String] = ["Sidebar.profile".localized(),
                              "Sidebar.settings".localized(),
                              "Sidebar.signOut".localized()]

    
    var darkBackgroundView: UIView?
    let stack = UIStackView()
    
    var mainView = UIApplication.getPresentedViewController()
    lazy var sidebarHidenConstraint: NSLayoutConstraint = self.trailingAnchor.constraint(equalTo: mainView!.view.leadingAnchor)
    lazy var sidebarShowConstraint: NSLayoutConstraint = self.leadingAnchor.constraint(equalTo: mainView!.view.leadingAnchor)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .gray
        setView()
    }


    required init?(coder: NSCoder) {
        print("ferhan sidebar deinit")
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Setup Sidebar

extension Sidebar {
    
    private func setView() {
        setTableView()
        setSocialMediaIcons()
        setTableViewUI()
    }
    private func setTableViewUI() {
        self.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: stack.topAnchor).isActive = true
    }
    
    private func setSocialMediaIcons() {
        let linkedin = UIButton(type: .system)
        linkedin.setBackgroundImage(#imageLiteral(resourceName: "linkedin"), for: .normal)
        linkedin.addTarget(self, action: #selector(openLinkedin), for: .touchUpInside)
        linkedin.translatesAutoresizingMaskIntoConstraints = false
        linkedin.widthAnchor.constraint(equalToConstant: 40).isActive = true
        linkedin.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        let instagram = UIButton(type: .system)
        instagram.setBackgroundImage(#imageLiteral(resourceName: "instagram"), for: .normal)
        instagram.addTarget(self, action: #selector(openInstagram), for: .touchUpInside)
        instagram.translatesAutoresizingMaskIntoConstraints = false
        instagram.widthAnchor.constraint(equalToConstant: 40).isActive = true
        instagram.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        let twitter = UIButton(type: .system)
        twitter.setBackgroundImage(#imageLiteral(resourceName: "twitter"), for: .normal)
        twitter.addTarget(self, action: #selector(openTwitter), for: .touchUpInside)
        twitter.translatesAutoresizingMaskIntoConstraints = false
        twitter.widthAnchor.constraint(equalToConstant: 40).isActive = true
        twitter.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        stack.addArrangedSubview(linkedin)
        stack.addArrangedSubview(instagram)
        stack.addArrangedSubview(twitter)
        stack.distribution = .equalSpacing
        stack.spacing = 10
        stack.alignment = .center
        stack.axis = .horizontal
        
        self.addSubview(stack)
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        stack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        stack.heightAnchor.constraint(equalToConstant: 50).isActive = true
        stack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30).isActive = true
    }
}

//MARK: - TableView Delegate & DataSource

extension Sidebar: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 100
        } else {
            return 60
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let selectedTitleImage = menuList[indexPath.row]
        let selectedTitle = menuLocalizedList[indexPath.row]
        
        switch indexPath.row {
        case 0:
            let cell =  tableView.dequeueReusableCell(withIdentifier: Constants.TableViewCellNames.Sidebar.sidebarTitleCell, for: indexPath) as! SidebarTitleCell
            cell.imageView?.image = UIImage(named: selectedTitleImage)
            cell.textLabel?.text = selectedTitle
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableViewCellNames.Sidebar.sidebarSubCell, for: indexPath)
            cell.imageView?.image = UIImage(named: selectedTitleImage)
            cell.textLabel?.text = selectedTitle
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    private func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

//MARK: - Actions

extension Sidebar {
    
    @objc func openLinkedin() {
        UIApplication.tryURL(urls: [
            "linkedin://user?username=akkanferhan",
            "https://www.linkedin.com/in/ferhanakkan/"
        ])
    }
    
    @objc func openInstagram() {
               UIApplication.tryURL(urls: [
             "instagram://user?username=akkanferhan",
             "https://www.instagram.com/akkanferhan/"
         ])
    }
    
    @objc func openTwitter() {
                UIApplication.tryURL(urls: [
            "twitter://user?screen_name=akkanferhan",
            "https://twitter.com/akkanferhan"
        ])
    }
    
    @objc func darkBackgroundTapped() {
        UIView.animate(withDuration: 0.5) {
            self.sidebarShowConstraint.isActive = false
            self.sidebarHidenConstraint.isActive = true
            self.darkBackgroundView?.backgroundColor=UIColor(white: 0, alpha: 0.0)
            self.mainView!.view.layoutIfNeeded()
        } completion: { (_) in
            self.darkBackgroundView?.removeFromSuperview()
            self.darkBackgroundView = nil
        }
    }
}

//MARK: - Show & Hide Actions

extension Sidebar {
    
    func showAnimation() {

        darkBackgroundView = UIView(frame: CGRect(x: 0, y: 0, width: mainView!.view.frame.width, height: mainView!.view.frame.height))
        darkBackgroundView?.backgroundColor=UIColor(white: 0, alpha: 0.0)
        mainView!.view.addSubview(darkBackgroundView!)
        darkBackgroundView?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(darkBackgroundTapped)))
        
        mainView!.view.addSubview(self)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalTo: mainView!.view.heightAnchor).isActive = true
        self.widthAnchor.constraint(equalToConstant: mainView!.view.frame.width*0.6).isActive = true
        self.topAnchor.constraint(equalTo: mainView!.view.topAnchor).isActive = true
        sidebarHidenConstraint.isActive = true
        self.mainView?.view.layoutIfNeeded()
        
        UIView.animate(withDuration: 0.5) {
            self.sidebarHidenConstraint.isActive = false
            self.sidebarShowConstraint.isActive = true
            self.darkBackgroundView?.backgroundColor=UIColor(white: 0, alpha: 0.5)
            self.mainView!.view.layoutIfNeeded()
        } 

    }
}
