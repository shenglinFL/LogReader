//
//  LoggerWindow.swift
//  Pods-LogReaderExample
//
//  Created by Lin Sheng on 2018/6/21.
//

import UIKit
 class LoggerWindow: UIWindow {

    init() {
        super.init(frame: UIScreen.main.bounds)
        
        self.backgroundColor = UIColor.clear
        self.windowLevel = UIWindowLevelStatusBar - 1
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        if let vc = self.rootViewController {
            for view in vc.view.subviews {
                if view.frame.contains(point) {
                    return true
                }
            }
        }
        return false
    }
    
}
