# UIViewAnimationSyntaxSugar
UIView animation 코드의 가독성을 높여줍니다.


기존 UIView Animation 소스

```
UIView.animate(withDuration: 3.0, delay: 1.0, options: [], animations: { 
      self.box.backgroundColor = .black
    }) { finished in
      self.box.backgroundColor = .white
    }
    // or
UIView.animate(withDuration: 3.0, delay: 1.0, options: [], animations: { 
      self.box.backgroundColor = .black
    }, completion: { finished in
      self.box.backgroundColor = .white
    })
```

다음과 같이 확장
```
UIView.Animator(duration: 3.0)
      .delay(1.0)
      .animations { self.box.backgroundColor = .black }
      .completion { finished in self.box.backgroundColor = .white }
      .animate()
```

Spring  사용시
```
UIView.SpringAnimator(duration: 3.0)
    .damping(1.0)
    .velocity(1.0)
    .delay(4.0)
    .options([])
    .animations { self.box.frame.size = CGSize(width: 100, height: 100) }
    .animate()
```
