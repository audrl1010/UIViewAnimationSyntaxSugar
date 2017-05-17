//
//  UIView+Animation.swift
//  UIViewAnimationSyntaxSugar
//
//  Created by myung gi son on 2017. 5. 17..
//  Copyright © 2017년 grutech. All rights reserved.
//

import UIKit

// MARK: - Animatoir (Basic)
extension UIView {
  
  class Animator {
    typealias AnimationsBlock = () -> Void
    typealias CompletionBlock = (Bool) -> Void
    
    fileprivate var _animations: AnimationsBlock
    fileprivate var _completion: CompletionBlock?
    fileprivate var _duration: TimeInterval
    fileprivate var _delay: TimeInterval
    fileprivate var _options: UIViewAnimationOptions
    
    init(
      duration: TimeInterval,
      delay: TimeInterval = 0.0,
      options: UIViewAnimationOptions = []) {
      
      _duration = duration
      _delay = delay
      _options = options
      _animations = {}
      _completion = nil
    }
    
    func delay(_ delay: TimeInterval) -> Self {
      _delay = delay
      return self
    }
    
    func options(_ options: UIViewAnimationOptions) -> Self {
      _options = options
      return self
    }
    
    func animations(_ animations: @escaping AnimationsBlock) -> Self {
      _animations = animations
      return self
    }
    
    func completion(_ completion: @escaping CompletionBlock) -> Self {
      _completion = completion
      return self
    }

    func animate() {
      UIView.animate(
        withDuration: _duration,
        delay: _delay,
        options: _options,
        animations: _animations,
        completion: _completion)
    }
  }
}


// MARK: - SpringAnimator

extension UIView {
  
  class SpringAnimator: Animator {
    fileprivate var _damping: CGFloat
    fileprivate var _velocity: CGFloat
    
    init(
      duration: TimeInterval,
      delay: TimeInterval = 0.0,
      damping: CGFloat = 0.1,
      velocity: CGFloat = 0.1,
      options: UIViewAnimationOptions = []) {
      
      _damping = damping
      _velocity = velocity
      
      super.init(duration: duration, delay: delay, options: options)
    }
    
    func damping(_ damping: CGFloat) -> Self {
      _damping = damping
      return self
    }
    
    func velocity(_ velocity: CGFloat) -> Self {
      _velocity = velocity
      return self
    }
    
    override func animate() {
      UIView.animate(
        withDuration: _duration,
        delay: _delay,
        usingSpringWithDamping: _damping,
        initialSpringVelocity: _velocity,
        options: _options,
        animations: _animations,
        completion: _completion)
    }
  }
}



