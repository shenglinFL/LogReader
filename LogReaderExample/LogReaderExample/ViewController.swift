//
//  ViewController.swift
//  LogReaderExample
//
//  Created by Lin Sheng on 2018/6/20.
//  Copyright © 2018年 linsheng. All rights reserved.
//

import UIKit
import LogReader
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let btn = UIButton(type: .system)
        btn.frame = CGRect(x: 100, y: 400, width: 100, height: 50)
        btn.setTitle("click", for: .normal)
        btn.addTarget(self, action: #selector(click), for: .touchUpInside)
        self.view.addSubview(btn)
    }
    
    @objc private func click() {
        LoggerWindow.share.disable()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

