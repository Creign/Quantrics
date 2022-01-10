//
//  DashboardViewController.swift
//  Quantrics
//
//  Created by Excell Nicolas on 1/10/22.
//

import UIKit

class DashboardViewController: UIViewController {
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var cars: [Car] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        setTableView()
        cars = loadCars(filename: "car_list") ?? []
    }
}

// MARK: - Private Functions
private extension DashboardViewController {
    func setTableView() {
        tableView.register(UINib(nibName: CarsTableViewCell.identifier,
                                 bundle: nil), forCellReuseIdentifier: CarsTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
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

// MARK: - UITableView
extension DashboardViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.count
    }
    
}
