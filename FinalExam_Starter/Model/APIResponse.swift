//
//  APIResponse.swift
//  FinalExam
//
//  Created by Anmol Parande on 3/15/20.
//  Copyright © 2020 Anmol Parande. All rights reserved.
//

import Foundation

/**
 A class which stores data retreived from the Corona API
 */
class APIResponse: Decodable {
    // Part 1B
    let provinces:[ProvinceData]?
    
    enum CodingKeys: String, CodingKey {
        case provinces = "covid19Stats"
    }
    
    
    required init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        
        self.provinces = try valueContainer.decode([ProvinceData].self, forKey: .provinces)
    }
}
