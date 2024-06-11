import Testing
@testable import SwiftTestingApp

struct SwiftTestingAppTests {

    @Test func testExample() async throws {
        let a = 2
        let result = a + a
        #expect(result == 4)
    }
}
