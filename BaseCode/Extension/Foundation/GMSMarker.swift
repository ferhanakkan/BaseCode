//
//  GMSMarker.swift
//  Cargram
//
//  Created by Ferhan Akkan on 4.06.2020.
//  Copyright © 2020 Ferhan Akkan. All rights reserved.
//

import GoogleMaps

extension GMSMarker {
    var id: Int {
        set(id) {
            self.userData = id
        }

        get {
           return self.userData as! Int
       }
   }
}
