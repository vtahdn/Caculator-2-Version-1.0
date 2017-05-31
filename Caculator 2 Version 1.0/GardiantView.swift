//
//  GardiantView.swift
//  Caculator 2 Version 1.0
//
//  Created by Viet Anh Doan on 5/31/17.
//  Copyright © 2017 Viet. All rights reserved.
//

import UIKit

class GardiantView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if tag == 302 {
            backgroundColor = .black
        }
        if tag == 301 {
            createGradient()
        }
    }
    
    func createGradient() -> Void {
        let bgGragdient = CAGradientLayer()
        bgGragdient.frame = self.frame
        bgGragdient.colors = [UIColor.init(red: 255/255, green: 128/255, blue: 64/255, alpha: 1.0).cgColor,UIColor.init(red: 255/255, green: 90/255, blue: 13/255, alpha: 1.0).cgColor]
        let startPoint = CGPoint.init(x: 0,y: 0)
        let endPoint = CGPoint.init(x: 0.5,y: 0.8)
        bgGragdient.startPoint = startPoint
        bgGragdient.endPoint = endPoint
        self.layer.insertSublayer(bgGragdient, at: 0)
    }

}
