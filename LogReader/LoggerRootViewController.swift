//
//  LoggerRootViewController.swift
//  LogReader
//
//  Created by Lin Sheng on 2018/6/22.
//

import UIKit

class LoggerRootViewController: UIViewController {
    
    private let button: UIButton = {
        let btn = UIButton(type: UIButtonType.system)
        btn.setTitle("LOG", for: .normal)
        btn.setTitleColor(UIColor.red, for: .normal)
        btn.frame = CGRect(x: 20, y: 300, width: 100, height: 50)
        return btn
    }()
    
    private let textView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 13)
        textView.backgroundColor = UIColor.clear
        textView.scrollsToTop = false
        textView.textColor = UIColor.gray
        textView.text = "Log......"
        textView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 200)
        return textView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .clear
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.view.addSubview(self.button)
        self.view.addSubview(self.textView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
