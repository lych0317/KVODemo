# KVODemo
KVO学习

基本上中级别以上的面试都会问到KVO的实现原理。
稍微做准备就知道利用运行时，自动生成子类，重写setter方法……

这是原理可以通过一篇[博客](http://www.jianshu.com/p/e59bb8f59302)来轻松搞定，那么应用呢？下面这四个问题，能准确回答嘛？

1. 对成员变量直接赋值会响应监听嘛？
2. 如果不实现`-observeValueForKeyPath:ofObject:change:context:`方法会怎么样？
3. 不移除监听会怎么样？
4. 分类的属性能否实现KVO？

思考……

1. 对成员变量直接赋值会响应监听嘛？
如果理解原理，这应该能准确回答，不会响应监听。

2. 如果不实现`-observeValueForKeyPath:ofObject:change:context:`方法会怎么样？
答案是：crash
日志是：
```
*** Terminating app due to uncaught exception 'NSInternalInconsistencyException', reason: '<ViewController: 0x7fd1ffc05180>: An -observeValueForKeyPath:ofObject:change:context: message was received but not handled.
```
方法未实现嘛！也很好理解。
但是仔细想想，一定嘛？如果未检测到值的改变自然不会crash，因为没有去调用方法。

3. 不移除监听会怎么样？
答案是：crash
日志是：
```
2017-03-16 16:07:30.528 KVODemo[9836:512230] *** Terminating app due to uncaught exception 'NSInternalInconsistencyException', reason: 'An instance 0x60000001b330 of class Person was deallocated while key value observers were still registered with it. Current observation info: <NSKeyValueObservationInfo 0x600000036e80> (
<NSKeyValueObservance 0x60000004e250: Observer: 0x7fd1cc0011f0, Key path: name, Options: <New: YES, Old: NO, Prior: NO> Context: 0x0, Property: 0x60000004f660>
<NSKeyValueObservance 0x60000004f9f0: Observer: 0x7fd1cc0011f0, Key path: age, Options: <New: YES, Old: NO, Prior: NO> Context: 0x0, Property: 0x60000004fab0>
)'
```

4. 分类的属性能否实现KVO？
答案是：可以
理解原理自然就知道了


