//
//  CarProsConsView.swift
//  Quantrics
//
//  Created by Excell Nicolas on 1/11/22.
//

import UIKit

class CarProsConsView: UIView {

    @IBOutlet weak var prosStackView: UIStackView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        let view = viewFromNibForClass(view: self)
        view.frame = bounds
      
        view.autoresizingMask = [
            UIView.AutoresizingMask.flexibleWidth,
            UIView.AutoresizingMask.flexibleHeight
        ]
      
        addSubview(view)
    }
    
    func viewFromNibForClass(view: UIView) -> UIView {
        let bundle = Bundle(for: type(of: view))
        let nib = UINib(nibName: String(describing: type(of: view)), bundle: bundle)
        let view = nib.instantiate(withOwner: view, options: nil).first as! UIView
          
        return view
    }
}
