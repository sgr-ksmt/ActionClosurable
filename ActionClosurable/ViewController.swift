//
//  ViewController.swift
//  ActionClosurable
//
//  Created by Yoshitaka Seki on 2016/04/11.
//  Copyright © 2016年 Yoshitaka Seki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var button: UIButton? = UIButton(frame: CGRect(x: 0,y: 0,width: 100,height: 100))
    var gr: UITapGestureRecognizer? = UITapGestureRecognizer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        button?.setTitle("button", forState: .Normal)
        button?.backgroundColor = UIColor.redColor()
        self.view.addSubview(button!)

        button?.onTap { [weak self] in
            print($0)
            self?.button?.removeFromSuperview()
            self!.button = nil
        }

        button?.on(.TouchDown) {
            print($0)
        }

        self.view.addGestureRecognizer(gr!)
        gr?.onGesture { [weak self] in
            print("gesture!")
            $0.removeTarget(nil, action: nil)
            self!.gr = nil
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
