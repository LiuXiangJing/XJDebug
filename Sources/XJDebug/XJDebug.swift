public struct XJDebug {
    public var text = "Hello, World!"
    public mutating func testLog() {
        text = "Hello J!"
        print(text)
    }
}
