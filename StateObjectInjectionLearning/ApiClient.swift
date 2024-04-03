import Foundation

protocol ApiClient {
  func getMessage() async throws -> String
}

class DefaultApiClient: ApiClient {
  func getMessage() async throws -> String {
    let url = URL(string: "https://httpbin.org/uuid")!
    let data = try! await URLSession.shared.data(from: url).0
    return String(data: data, encoding: .utf8)!
  }
}
