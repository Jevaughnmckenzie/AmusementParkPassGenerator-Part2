//
//  TableViewWrapper.swift
//  AmusementParkPassGenerator
//
//  Created by Jevaughn McKenzie on 4/3/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import UIKit

class FormSection: UIView {
    
    let stackView1 = UIStackView()
    let stackView2 = UIStackView()
    let stackView3 = UIStackView()
    let stackView4 = UIStackView()
    let stackView5 = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(stackView1)
        self.addSubview(stackView2)
        self.addSubview(stackView3)
        self.addSubview(stackView4)
        self.addSubview(stackView5)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}







































