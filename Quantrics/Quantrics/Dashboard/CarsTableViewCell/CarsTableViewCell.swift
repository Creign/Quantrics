//
//  CarsTableViewCell.swift
//  Quantrics
//
//  Created by Excell Nicolas on 1/11/22.
//

import UIKit

class CarsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var carImageView: UIImageView!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var prosConsStackView: UIStackView!
    @IBOutlet weak var prosStackView: UIStackView!
    @IBOutlet weak var consStackView: UIStackView!
    
    private let detailView = CarProsConsView()
    
    static var identifier: String {
        return String(describing: self)
    }
    
    func configure(with car: Car) {
        carImageView.image = setImage(model: car.model)
        modelLabel.text = car.model
        priceLabel.text = String(format: "Price: %.2f", car.customerPrice)
        
        // TODO: make this as custom view with stars
        ratingLabel.text = "Ratings: \(car.rating)"
        
        // need some optimization, some crash might happen
        fillPros(with: car.prosList)
        fillCons(with: car.consList)
    }
    
    func fillPros(with list: [String]) {
        
//        for v in 1 ..< prosStackView.subviews.count {
//            prosStackView.subviews[v].removeFromSuperview()
//        }
        
        for v in 0 ..< prosStackView.subviews.count-1 {
            if v != 0 {
                prosStackView.subviews[v].removeFromSuperview()
            }
        }
        
        let pros = list.filter { $0 != "" }
        prosStackView.isHidden = pros.count == 0
        
        for p in pros {
            let view = ProsConsListView()
            view.descLabel.text = p
            
            prosStackView.insertArrangedSubview(view, at: prosStackView.subviews.count)
        }
    }
    
    func fillCons(with list: [String]) {
        
//        for v in 1 ..< consStackView.subviews.count {
//            consStackView.subviews[v].removeFromSuperview()
//        }
        
        let cons = list.filter { $0 != "" }
        consStackView.isHidden = cons.count == 0
        
        if cons.count != 0 {
            for v in 0 ..< consStackView.subviews.count-1 {
                if v != 0 {
                    consStackView.subviews[v].removeFromSuperview()
                }
            }
        }
        
        for c in cons {
            let view = ProsConsListView()
            view.descLabel.text = c
            
            consStackView.insertArrangedSubview(view, at: consStackView.subviews.count)
        }
    }
    
    // Note: this is a bandaid solution
    // Data model should have an attribute for image
    func setImage(model car: String) -> UIImage {
        switch car {
        case "Range Rover":
            return #imageLiteral(resourceName: "RangeRover")
        case "Roadster":
            return #imageLiteral(resourceName: "Alpine")
        case "3300i":
            return #imageLiteral(resourceName: "3300i")
        case "GLE coupe":
            return #imageLiteral(resourceName: "GLC")
            
        default:
            return UIImage()
        }
    }
}

extension CarsTableViewCell {
    var isDetailViewHidden: Bool {
        return prosConsStackView.isHidden
    }

    func showDetailView() {
        prosConsStackView.isHidden = false
    }

    func hideDetailView() {
        prosConsStackView.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if isDetailViewHidden, selected {
            showDetailView()
        } else {
            hideDetailView()
        }
    }
}
