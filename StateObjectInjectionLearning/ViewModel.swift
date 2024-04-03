import Foundation
import Dependencies

protocol ViewModel: ObservableObject {
  var message: String { get }
  func load()
}

class DefaultViewModel: ViewModel {
  @Published var message = ""

  func load() {
    Task {
      @Dependency(\.apiClient) var client
      let message = try await client.getMessage()
      await MainActor.run {
        self.message = message
      }
    }
  }
}
