//
//  Car.swift
//  Quantrics
//
//  Created by Excell Nicolas on 1/11/22.
//

import Foundation

struct Car: Decodable {
    let make: String
    let model: String
    let customerPrice: Double
    let marketPrice: Double
    let prosList: [String]
    let consList: [String]
    let rating: Int
    
    enum CodingKeys: String, CodingKey {
        case make
        case model
        case customerPrice
        case marketPrice
        case prosList
        case consList
        case rating
    }
}
