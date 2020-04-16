//
//  File.swift
//  
//
//  Created by liu on 2020/4/14.
//

#if !os(macOS)
import UIKit
open class XJDebugView: UIView {
    /// 实时显示帧率
       fileprivate var fpsLabel:CATextLayer?
       /// 实时显示cpu使用率
       fileprivate var cpuLabel:CATextLayer?
       /// 实时显示内存占用
       fileprivate var memoryLabel:CATextLayer?
       
       fileprivate var timer : CADisplayLink!
       fileprivate var lastTimestamp:TimeInterval = -1
       fileprivate var fpsCount:Double = 0
       override init(frame: CGRect) {
           super.init(frame: frame)
           loadSubLayers()
           loadTimer()
           loadPanGesture()
       }
      public func run()  {
           timer.isPaused = false
       }
       public func stop() {
           timer.isPaused = true
       }
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       private func loadSubLayers()  {
           let height :CGFloat = 25;
           var currentHeight :CGFloat = 15 + 25
           fpsLabel = CATextLayer()
           fpsLabel?.frame = CGRect(x: 8, y: 15, width: frame.width, height: height)
           layer.addSublayer(fpsLabel!)
           configTextLayer(layer: fpsLabel!, text: "fps:")
           cpuLabel = CATextLayer()
           cpuLabel?.frame = CGRect(x: 8, y: currentHeight, width: frame.width, height: height)
           layer.addSublayer(cpuLabel!)
           configTextLayer(layer: cpuLabel!, text: "cup:")
           currentHeight += height
           memoryLabel = CATextLayer()
           memoryLabel?.frame = CGRect(x: 8, y:currentHeight, width: frame.width, height: height)
           layer.addSublayer(memoryLabel!)
           configTextLayer(layer: memoryLabel!, text: "memory:")
       }
       private func configTextLayer(layer:CATextLayer,text:String) {
           layer.fontSize = 14
           layer.string = text
           layer.contentsScale = UIScreen.main.scale
       }
       
       private func loadTimer(){
           timer = CADisplayLink(target: self, selector: #selector(updateData(link:)))
           timer.isPaused = true
           timer.add(to: RunLoop.current, forMode: .common)
       }
       @objc func updateData(link:CADisplayLink) {
           if lastTimestamp < 0 {
               lastTimestamp = link.timestamp
               return
           }
           fpsCount += 1
           
           let delta = link.timestamp - lastTimestamp
           if delta < 1.0 {
               return
           }
           lastTimestamp = link.timestamp
           let fps = fpsCount / delta
           fpsCount = 0
           fpsLabel?.string = "fps: " + String(format: "%.2f", fps)
       }
       deinit {
           timer.isPaused = true
           timer.remove(from: RunLoop.current, forMode: .common)
           print("释放了")
       }
    

}
// MARK: - 拖动，边缘吸附效果
extension XJDebugView {
    private func loadPanGesture() {
        let pan = UIPanGestureRecognizer(target: self, action: #selector(moveView(pan:)))
        addGestureRecognizer(pan)
    }
    @objc func moveView(pan:UIPanGestureRecognizer)  {
        let point = pan.translation(in: self)
        self.center = CGPoint(x: center.x + point.x , y: center.y + point.y)
        pan.setTranslation(.zero, in: self)
        if pan.state == .ended {
            var x:CGFloat = 0
            let screenHeight = UIScreen.main.bounds.height
            let screenWidth = UIScreen.main.bounds.width
            let maxY = screenHeight - frame.height
            if self.center.x > screenWidth/2 {
                x = screenWidth - frame.width
            }
            var y = self.frame.minY
            y = y < 0 ? 0 : y
            y = y > maxY ? maxY:y
            UIView.animate(withDuration: 0.4) {
                self.frame = CGRect(x: x, y: y, width: self.frame.width, height: self.frame.height)
            }
        }
        
    }
}

// MARK: - 定时器刷新
extension XJDebugView {
   
}
// MARK: - CPU刷新
extension XJDebugView {

}
// MARK: - Memory刷新
extension XJDebugView {
  
}

open struct XJStudent {
    open var score = 10
    public var name = "123"
}
open class XJTeacher {
    open var height = 20
    public var name = "zh12ang"
}

#endif
public class XJMemory {
    public var name:String = "123"
}
open class XJPerson {
    open var height = 20
    public var name = "zhang"
}


