//
//  CoinModel.swift
//  ByteCoin
//
//  Created by Emanuele Carpigna on 07/10/2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct CoinModel {
    let excange: Double
    
    var excangeString: String{
        return String(format: "%.3f", excange)
    }
}
