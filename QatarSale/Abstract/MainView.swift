//
//  MainView.swift
//  QatarSale
//
//  Created by Jalal on 12/18/21.
//

import Foundation
import UIKit

class MainView: UIView {
    
    var view:UIView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        nibSetup()
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        nibSetup()
    }
    
    private func nibSetup() {
        backgroundColor = .clear
        
        //
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.translatesAutoresizingMaskIntoConstraints = true
        view.backgroundColor = UIColor.clear
        addSubview(view)
        
    }
    
    private func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let nibView = nib.instantiate(withOwner: self, options: nil).first as! UIView
        
        return nibView
    }
}

