//
//  DashboardViewController.swift
//  Quantrics
//
//  Created by Excell Nicolas on 1/10/22.
//

import UIKit

class DashboardViewController: UIViewController {
    
    @IBOutlet weak var filterView: UIView!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var makeFilterTextField: UITextField!
    @IBOutlet weak var modelFilterTextField: UITextField!
    
    var cars: [Car] = []
    var filteredCars: [Car] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setFilterTable()
        setTableView()
        cars = loadCars(filename: "car_list") ?? []
        filteredCars = cars
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
    
    func setFilterTable() {
        filterView.layer.cornerRadius = 5
        
        makeFilterTextField.delegate = self
        modelFilterTextField.delegate = self
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CarsTableViewCell.identifier, for: indexPath) as? CarsTableViewCell
        
        cell?.configure(with: filteredCars[indexPath.row])

        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredCars.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.3) {
            self.tableView.performBatchUpdates(nil)
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = self.tableView.cellForRow(at: indexPath) as? CarsTableViewCell {
            cell.hideDetailView()
        }
    }
}

// MARK: - UITextField
extension DashboardViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let makeStr = makeFilterTextField.text ?? "".lowercased()
        let modelStr = modelFilterTextField.text ?? "".lowercased()
        
        if makeStr.isEmpty && modelStr.isEmpty {
            filteredCars = cars
            tableView.reloadData()
        } else {
            let temp = cars.filter({$0.make.lowercased().hasPrefix(makeStr)}).filter({$0.model.lowercased().hasPrefix(modelStr)})
            filteredCars = temp
            tableView.reloadData()
        }
        
        view.endEditing(true)
        return true
    }
    
//    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
//
//        let makeStr = makeFilterTextField.text ?? "".lowercased()
//        let modelStr = modelFilterTextField.text ?? "".lowercased()
//
//        if makeStr.isEmpty && modelStr.isEmpty {
//            filteredCars = cars
//            tableView.reloadData()
//        } else {
//            let temp = cars.filter({$0.make.lowercased().hasPrefix(makeStr)}).filter({$0.model.lowercased().hasPrefix(modelStr)})
//            filteredCars = temp
//            tableView.reloadData()
//        }
//
//        return true
//    }
    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//
//        let makeStr = "\(makeFilterTextField.text ?? "")\(string)".capitalized
////        let modelStr = modelFilterTextField.text?.lowercased() ?? ""
//        print(makeStr)
//
//        print((makeFilterTextField.text ?? "").count == 0)
//        if (makeFilterTextField.text ?? "").count == 0 {
//            cars = loadCars(filename: "car_list") ?? []
//            tableView.reloadData()
//        }
//
//        let temp = cars.filter({$0.make.hasPrefix(makeStr)})
//        //.filter({$0.model.hasPrefix(modelStr)})
//
//        cars = temp
//        tableView.reloadData()
//
//
//        return true
//    }
}
