//
//  LoggerSuspendedButton.swift
//  LogReader
//
//  Created by Lin Sheng on 2018/6/22.
//

import UIKit

class LoggerSuspendedButton: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "LOG"
        label.textColor = UIColor.brown
        label.textAlignment = .center
        return label
    }()
    
    static var originalPosition: CGPoint {
        return CGPoint(x: -10, y: UIScreen.main.bounds.size.height / 2)
    }
    static var size: CGSize {return CGSize(width: 80, height: 80)}

    init() {
        super.init(frame: CGRect(origin: LoggerSuspendedButton.originalPosition, size: LoggerSuspendedButton.size))
        
        backgroundColor = UIColor.red
        self.alpha = 0.5
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.8
        layer.cornerRadius = LoggerSuspendedButton.size.width/2
        layer.shadowOffset = CGSize.zero
        sizeToFit()
        layer.masksToBounds = true
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel.frame = self.bounds
//        titleLabel.center = self.center
        
        self.addSubview(titleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
