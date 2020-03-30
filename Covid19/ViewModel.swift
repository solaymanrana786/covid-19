//
//  ViewModel.swift
//  Covid19
//
//  Created by Solayman Rana on 30/3/20.
//  Copyright © 2020 Solayman Rana. All rights reserved.
//

import Foundation


struct ViewModel {
    
    let  latest : Latest?
    let locations : [Locations]?
    
    init(rpdata: RPdata1) {
        self.latest = rpdata.latest
        self.locations = rpdata.locations
    }
    
}
