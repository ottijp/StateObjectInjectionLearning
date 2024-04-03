import Dependencies

fileprivate enum ApiClientKey: DependencyKey {
  static let liveValue: any ApiClient = DefaultApiClient()
}

extension DependencyValues {
  var apiClient: any ApiClient {
    get { self[ApiClientKey.self] }
    set { self[ApiClientKey.self] = newValue }
  }
}
