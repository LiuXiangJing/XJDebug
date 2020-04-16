import XCTest
@testable import XJDebug

final class XJDebugTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(XJDebug().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
