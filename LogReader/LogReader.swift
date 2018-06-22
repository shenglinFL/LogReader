//
//  LogReader.swift
//  LogReader
//
//  Created by Lin Sheng on 2018/6/22.
//

import UIKit
import CocoaLumberjack


struct LogReaderOption : OptionSet {
    
    let rawValue: Int
    
    static let none = LogReaderOption(rawValue: 0)
    
    static let viewControllerTransition = LogReaderOption(rawValue: 1)
    
}

public class LogReader: NSObject {
    
    private let window = LoggerWindow()
    
    private let controller = LoggerRootViewController()
    
    public static let share = LogReader()
    
    var isShowAllWindow: Bool = false
    
    var filePath: String?
    
    public func enable() {
        self.window.rootViewController = self.controller
        self.window.makeKeyAndVisible()
        
        UIViewController.viewDidAppearHackSwizzle()
    }
    
    public func disable() {
        self.window.rootViewController = nil
        self.window.resignKey()
        self.window.removeFromSuperview()
    }
    
    public func set(filePath: String) {
        self.filePath = filePath

    }
    
    
}

extension UIViewController {
    
    @objc class func viewDidAppearHackSwizzle() {
        if let viewDidAppearHandle = class_getInstanceMethod(self, #selector(UIViewController.viewDidAppear(_:))),
            let hackHandle = class_getInstanceMethod(self, #selector(self.viewDidAppearHackHandle)) {
            
            method_exchangeImplementations(viewDidAppearHandle, hackHandle)
        }
        
    }
    
    @objc func viewDidAppearHackHandle() {
        defer {
            viewDidAppearHackHandle()
        }
        if let nav = self.navigationController {
            var path = ""
            for vc in nav.viewControllers {
                let title: String = vc.title != nil ? vc.title! : "UNKNOWN"
                path = path + "/" + title
            }
            DDLogInfo(path)
        }
        
    }
}
