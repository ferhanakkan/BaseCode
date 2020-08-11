//
//  UserAgreementViewController.swift
//  Cargram
//
//  Created by Ferhan Akkan on 13.06.2020.
//  Copyright © 2020 Ferhan Akkan. All rights reserved.
//

import UIKit
import SnapKit

class UserAgreementViewController: UIViewController {
    
    lazy var contentViewSize = CGSize(width: self.view.frame.width, height: self.view.frame.height+40000)
    
    let scrollView: UIScrollView = {
        let scroll = UIScrollView(frame: .zero)
        return scroll
    }()
    
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "User Agreements"
        setUI()
    }
}

//MARK: - Setup UI

extension UserAgreementViewController: UIScrollViewDelegate {
    
    func setUI() {
        view.backgroundColor = .white
        scrollView.backgroundColor = .white
        scrollView.maximumZoomScale = 4
        scrollView.minimumZoomScale = 1
        scrollView.delegate = self
        scrollView.contentSize = contentViewSize
        label.numberOfLines = 0
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
        scrollView.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.width.equalTo(self.view.frame.width-10)
            make.centerX.equalToSuperview()
        }
        label.text = "End-User License Agreement \nLast updated: 13-06-2020\nPlease read this End-User License Agreement carefully before clicking the Check Box button, downloading or using Cargramic (Application).\n By clicking the Check Box button, downloading or using the Application, you are agreeing to be bound by the terms and conditions of this Agreement. \nIf you do not agree to the terms of this Agreement, do not click on the Check Box button and do not download or use the Application. \nLicense\nCargramic grants you a revocable, non-exclusive, non-transferable, limited license to download, install and use the Application solely for your personal, non-commercial purposes strictly in accordance with the terms of this Agreement. \nRestrictions\nYou agree not to, and you will not permit others to: \na) license, sell, rent, lease, assign, distribute, transmit, host, outsource, disclose or otherwise commercially exploit the Application or make the Application available to any third party. \nModifications to Application\nFerhan Akkan reserves the right to modify, suspend or discontinue, temporarily or permanently, the Application or any service to which it connects, with or without notice and without liability to you. \nTerm and Termination\nThis Agreement shall remain in effect until terminated by you or Ferhan Akkan. \nInappropriate content is controlled by the moderator. In case of any blasphemy and insult, the post will be deleted. This will be done automatically by the service and under the control of the person. The content of the complaints will be examined by the developer and their compliance with the rules will be checked within 24 hours. \nFerhan Akkan may, in its sole discretion, at any time and for any or no reason, suspend or terminate this Agreement with or without prior notice. \nThis Agreement will terminate immediately, without prior notice from Ferhan Akkan , in the event that you fail to comply with any provision of this Agreement. You may also terminate this Agreement by deleting the Application and all copies thereof from your mobile device or from your desktop. \nUpon termination of this Agreement, you shall cease all use of the Application and delete all copies of the Application from your mobile device or from your desktop. \nSeverability\nIf any provision of this Agreement is held to be unenforceable or invalid, such provision will be changed and interpreted to accomplish the objectives of such provision to the greatest extent possible under applicable law and the remaining provisions will continue in full force and effect. \nAmendments to this Agreement\n Ferhan Akkan reserves the right, at its sole discretion, to modify or replace this Agreement at any time.If a revision is material we will provide at least lifetime days notice prior to any new terms taking effect. What constitutes a material change will be determined at our sole discretion. \nContact Information\nIf you have any questions about this Agreement, please contact us. \n Contact : Ferhanakkan@gmail.com"
    }
}
