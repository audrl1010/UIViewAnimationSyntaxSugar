//
//  ViewController.swift
//  UIViewAnimationSyntaxSugar
//
//  Created by myung gi son on 2017. 5. 17..
//  Copyright © 2017년 grutech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var box: UIView = {
    let v = UIView(
      frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    v.backgroundColor = .white
    v.translatesAutoresizingMaskIntoConstraints = false
    return v
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()

    view.addSubview(box)
    
    box.center = CGPoint(x: view.frame.midX, y: view.frame.midY)

    // Animator
    UIView.Animator(duration: 3.0)
      .delay(1.0)
      .options([])
      .animations { self.box.backgroundColor = .black }
      .completion { finished in
        self.box.backgroundColor = .blue
      }
      .animate()
    
    // SpringAnimator
    UIView.SpringAnimator(duration: 3.0)
      .damping(1.0)
      .velocity(1.0)
      .delay(4.0)
      .options([])
      .animations {
        self.box.frame.size = CGSize(width: 100, height: 100)
      }
      .animate()
  }
}














































