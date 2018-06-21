//
//  LoggerWindow.swift
//  Pods-LogReaderExample
//
//  Created by Lin Sheng on 2018/6/21.
//

import UIKit

public class LoggerWindow: UIWindow {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    private let logTextView : UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 13)
        textView.backgroundColor = UIColor.clear
        textView.scrollsToTop = false
        textView.textColor = UIColor.blue
        return textView
    }()
    
    public static let share = LoggerWindow()
    
    public init() {
        super.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 300))
        
        self.enable()
        self.windowLevel = UIWindowLevelStatusBar - 1
        self.backgroundColor = UIColor(white: 0, alpha: 0.1)
//        self.isUserInteractionEnabled = false
        
        self.logTextView.frame = self.bounds
        self.addSubview(self.logTextView)
        
        self.logTextView.text = "123123123123213213123123213213121231231231231232132131231232132131212312321321312312321321312123123213213123123213213121231232132131231232132131212312321321312312321321312123123213213123123213213121231232132131231232132131212312321321312312321321312123123213213123123213213121231232132131231232132131212312321321312312321321312123123213213123123213213121231232132131231232132131212312321321312312321321312123123213213123123213213121231232132131231232132131212312321321312312321321312213213123123213213121231231231232132131231232132131212312321321312312321321312123123213213123123213213121231232132131231232132131212312321321312312321321312123123213213123123213213121231232132131231232132131212312321321312312321321312123123213213123123213213121231232132131231232132131212312321321312312321321312123123213213123123213213121231232132131231232132131212312321321312312321321312123123213213123123213213121231232132131231232132131212312321321312312321321312213213123123213213121231231231232132131231232132131212312321321312312321321312123123213213123123213213121231232132131231232132131212312321321312312321321312123123213213123123213213121231232132131231232132131212312321321312312321321312123123213213123123213213121231232132131231232132131212312321321312312321321312123123213213123123213213121231232132131231232132131212312321321312312321321312123123213213123123213213121231232132131231232132131212312321321312312321321312213213123123213213121231231231232132131231232132131212312321321312312321321312123123213213123123213213121231232132131231232132131212312321321312312321321312123123213213123123213213121231232132131231232132131212312321321312312321321312123123213213123123213213121231232132131231232132131212312321321312312321321312123123213213123123213213121231232132131231232132131212312321321312312321321312123123213213123123213213121231232132131231232132131212312321321312312321321312213213123123213213121231231231232132131231232132131212312321321312312321321312123123213213123123213213121231232132131231232132131212312321321312312321321312123123213213123123213213121231232132131231232132131212312321321312312321321312123123213213123123213213121231232132131231232132131212312321321312312321321312123123213213123123213213121231232132131231232132131212312321321312312321321312123123213213123123213213121231232132131231232132131212312321321312312321321312213213123123213213121232132131231232132131212312321321312312321321312123123213213123123213213121231232132131231232132131212312321321312312321321312123123213213123123213213121231232132131231232132131212312321321312312321321312123123213213123123213213121231232132131231232132131212312321321312312321321312123123213213123123213213121231232132131231232132131212312321321312312321321312123123213213123123213213121231232132131231232132131221321312312321321312"
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func enable() {
        self.rootViewController = UIViewController()
        self.makeKeyAndVisible()
    }
    
    public func disable() {
        self.rootViewController = nil
        self.resignKey()
        self.removeFromSuperview()
    }
    
    public func set(filePath: String) {
        if let logs = NSArray(contentsOfFile: filePath) {
            self.logTextView.text = logs.componentsJoined(by: "\n")
        }
    }
    
}