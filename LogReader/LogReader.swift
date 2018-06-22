//
//  LogReader.swift
//  LogReader
//
//  Created by Lin Sheng on 2018/6/22.
//

import UIKit

public class LogReader: NSObject {
    
    private let window = LoggerWindow()
    
    private let controller = LoggerRootViewController()
    
    public static let share = LogReader()
    
    public func enable() {
        self.window.rootViewController = self.controller
        self.window.makeKeyAndVisible()
    }
    
    public func disable() {
        self.window.rootViewController = nil
        self.window.resignKey()
        self.window.removeFromSuperview()
    }
}
