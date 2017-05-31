//
//  OperatorsButton.swift
//  Caculator 2 Version 1.0
//
//  Created by Viet Anh Doan on 5/31/17.
//  Copyright © 2017 Viet. All rights reserved.
//

import UIKit

class OperatorsButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureButton()
    }
    func configureButton() -> Void {
        if tag >= 100 && tag <= 110 {
            backgroundColor = .white
            setTitleColor(.black, for: .normal)
        }
        else if tag >= 200 && tag <= 202 {
            backgroundColor = .lightGray
            setTitleColor(.black, for: .normal)
        }
        else {
            backgroundColor = .orange
            setTitleColor(.white, for: .normal)
        }
        layer.cornerRadius = 8
        titleLabel?.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.title1)
    }
}
