//
//  DashboardViewController.swift
//  Quantrics
//
//  Created by Excell Nicolas on 1/10/22.
//

import UIKit

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

class DashboardViewController: UIViewController {
    
    var cars: [Car] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        cars = loadCars(filename: "car_list") ?? []
    }
    
    func loadCars(filename fileName: String) -> [Car]? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([Car].self, from: data)
                return jsonData
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
}
