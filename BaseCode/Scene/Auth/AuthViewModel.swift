//
//  AuthViewModel.swift
//  Cargram
//
//  Created by Ferhan Akkan on 11.05.2020.
//  Copyright © 2020 Ferhan Akkan. All rights reserved.
//

import UIKit

struct AuthViewModel {
    
    func collectionViewCell(indexPath: IndexPath, owner: AuthViewController) -> UICollectionViewCell{
        switch indexPath.row {
        case 0:
            let cell = owner.collectionView.dequeueReusableCell(withReuseIdentifier: "RegisterColletionViewCell", for: indexPath) as! RegisterColletionViewCell
            cell.delegate = owner
            return cell
        case 1:
            let cell = owner.collectionView.dequeueReusableCell(withReuseIdentifier: "LogInColletionViewCell", for: indexPath) as! LogInColletionViewCell
            cell.delegate = owner
            return cell
        case 2:
            let cell = owner.collectionView.dequeueReusableCell(withReuseIdentifier: "ForgotColletionViewCell", for: indexPath) as! ForgotColletionViewCell
            cell.delegate = owner
            return cell
        default:
            let cell = UICollectionViewCell()
            return cell
        }
    }
}
