//
//  CoinData.swift
//  ByteCoin
//
//  Created by Emanuele Carpigna on 07/10/2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct CoinData: Codable {
    let asset_id_base: String
    let asset_id_quote: String
    let rate: Double
}
