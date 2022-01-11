//
//  ProsConsListView.swift
//  Quantrics
//
//  Created by Excell Nicolas on 1/11/22.
//

import UIKit

class ProsConsListView: UIView {

    @IBOutlet weak var radioButton: UIButton!
    @IBOutlet weak var descLabel: UILabel!
    
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
      
        radioButton.layer.cornerRadius = radioButton.frame.width / 2
        
        addSubview(view)
    }
    
    func viewFromNibForClass(view: UIView) -> UIView {
        let bundle = Bundle(for: type(of: view))
        let nib = UINib(nibName: String(describing: type(of: view)), bundle: bundle)
        let view = nib.instantiate(withOwner: view, options: nil).first as! UIView
          
        return view
    }
}
