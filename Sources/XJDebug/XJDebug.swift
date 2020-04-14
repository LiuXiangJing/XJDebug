
#if !os(macOS)
fileprivate let debugViewTag = 816
import UIKit
open class XJDebug {
    open static func showDebugView() {
        let debugView = XJDebugView(frame: CGRect(x: 0, y: 200, width: 100, height: 105))
        debugView.tag = debugViewTag
        
        if let keyWindow = UIApplication.shared.windows.first {
            debugView.backgroundColor = UIColor.lightGray
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                keyWindow.addSubview(debugView)
                debugView.run()
            }
        }
    }
    open static func closeDebugView() {
        if let keyWindow = UIApplication.shared.windows.first {
                   keyWindow.viewWithTag(debugViewTag)?.removeFromSuperview()
               }
    }
}
#endif
