import XCTest
import Dependencies

fileprivate class ApiClientMock: ApiClient {
  var response = ""

  func getMessage() async throws -> String {
    response
  }
}

final class StateObjectInjectionLearningTests: XCTestCase {
  private let apiClientMock = ApiClientMock()

  func testViewModel() async throws {
    // setup
    apiClientMock.response = "test response"
    let viewModel = DefaultViewModel()

    // execute
    withDependencies {
      $0.apiClient = apiClientMock
    } operation: {
      viewModel.load()
    }
    try await Task.sleep(nanoseconds: 10_000_000)

    // test
    XCTAssertEqual("test response", viewModel.message)
  }
}
