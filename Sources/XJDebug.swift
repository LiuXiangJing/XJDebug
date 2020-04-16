//
//  XJDebug.swift
//  XJDebug
//
//  Created by liu on 2020/4/10.
//  Copyright © 2020 liuxiangjing. All rights reserved.
//
//


public struct XJDebug {
    public init() {}
    public var text = "Hello, World!"
    public func printText() {
        print(self.text)
    }

}
//#if os(iOS)
//import UIKit
//fileprivate let debugViewTag = 816
//
//open class XJDebug {
//
//    public static func showDebugView() {
//        let debugView = XJDebugView(frame: CGRect(x: 0, y: 200, width: 100, height: 105))
//        debugView.tag = debugViewTag
//
//        if let keyWindow = UIApplication.shared.windows.first {
//            debugView.backgroundColor = UIColor.lightGray
//            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//                keyWindow.addSubview(debugView)
//                debugView.run()
//            }
//        }
//    }
//    public static func closeDebugView() {
//        if let keyWindow = UIApplication.shared.windows.first {
//            keyWindow.viewWithTag(debugViewTag)?.removeFromSuperview()
//        }
//    }
//}
//
//#endif
