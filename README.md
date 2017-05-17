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
