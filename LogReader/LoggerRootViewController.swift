//
//  LoggerRootViewController.swift
//  LogReader
//
//  Created by Lin Sheng on 2018/6/22.
//

import UIKit

class LoggerRootViewController: UIViewController {
    
    private let button = LoggerSuspendedButton()
    
//    private let button: UIButton = {
//        let btn = UIButton(type: UIButtonType.system)
//        btn.setTitle("LOG", for: .normal)
//        btn.setTitleColor(UIColor.red, for: .normal)
//        btn.frame = CGRect(x: 20, y: 300, width: 100, height: 50)
//        return btn
//    }()
    
    private let textView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 13)
        textView.backgroundColor = UIColor.clear
        textView.scrollsToTop = false
        textView.textColor = UIColor.gray
        textView.text = "Log......"
        textView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 200)
        textView.layoutManager.allowsNonContiguousLayout = false // 关闭非连续布局
        return textView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "LOG"
        self.view.backgroundColor = .clear
        
//        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateText), userInfo: nil, repeats: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.view.addSubview(self.textView)
        self.view.addSubview(self.button)
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panDidFire(panner:)))
        self.button.addGestureRecognizer(panGesture)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tap))
        self.button.addGestureRecognizer(tapGesture)
    }
    
    @objc private func updateText() {
        do {
            if let filePath = LogReader.share.filePath {
                let text = try String.init(contentsOfFile: filePath, encoding: .utf8)
                self.textView.text = text
                self.textView.setContentOffset(CGPoint(x: 0, y: self.textView.contentSize.height - self.textView.bounds.size.height), animated: true)
            }
        } catch  {
            
        }
    }
    
    @objc func tap() {
        if let pvc = self.presentedViewController {
            pvc.dismiss(animated: true, completion: nil)
        }else {
            let nav = UINavigationController(rootViewController: LogReaderViewController())
            self.present(nav, animated: true, completion: nil)
        }
    }
    
    @objc func panDidFire(panner: UIPanGestureRecognizer) {
        
        if panner.state == .began {
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear, animations: {
                self.button.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            }, completion: nil)
        }
        
        let offset = panner.translation(in: view)
        panner.setTranslation(CGPoint.zero, in: view)
        var center = button.center
        center.x += offset.x
        center.y += offset.y
        button.center = center
        
        if panner.state == .ended || panner.state == .cancelled {
            
            let location = panner.location(in: view)
            let velocity = panner.velocity(in: view)
            
            var finalX: Double = 30
            var finalY: Double = Double(location.y)
            
            if location.x > UIScreen.main.bounds.size.width / 2 {
                finalX = Double(UIScreen.main.bounds.size.width) - 30.0
//                self.button.changeSideDisplay(left: false)
            } else {
//                self.button.changeSideDisplay(left: true)
            }
            
            let horizentalVelocity = abs(velocity.x)
            let positionX = abs(finalX - Double(location.x))
            
            let velocityForce = sqrt(pow(velocity.x, 2) * pow(velocity.y, 2))
            
            let durationAnimation = (velocityForce > 1000.0) ? min(0.3, positionX / Double(horizentalVelocity)) : 0.3
            
            if velocityForce > 1000.0 {
                finalY += Double(velocity.y) * durationAnimation
            }
            
            if finalY > Double(UIScreen.main.bounds.size.height) - 50 {
                finalY = Double(UIScreen.main.bounds.size.height) - 50
            } else if finalY < 50 {
                finalY = 50
            }
            
            UIView.animate(withDuration: durationAnimation * 5,
                           delay: 0,
                           usingSpringWithDamping: 0.8,
                           initialSpringVelocity: 6,
                           options: UIViewAnimationOptions.allowUserInteraction,
                           animations: {
                            self.button.center = CGPoint(x: finalX, y: finalY)
                            self.button.transform = CGAffineTransform.identity
            }, completion: nil)
        }
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
