//
//  DashboardViewController.swift
//  Quantrics
//
//  Created by Excell Nicolas on 1/10/22.
//

import UIKit

class DashboardViewController: UIViewController {
    
    var cars: [Car] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        cars = loadCars(filename: "car_list") ?? []
    }
}

// MARK: - Data
extension DashboardViewController {
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
