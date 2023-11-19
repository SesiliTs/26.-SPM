//
//  CatFactsModel.swift
//  26. SPM
//
//  Created by Sesili Tsikaridze on 19.11.23.
//

import Foundation

struct Response: Decodable {
    
    let data: [CatFact]

    enum CodingKeys: String, CodingKey {
        case data
    }
}

struct CatFact: Decodable {
    let fact: String
}
