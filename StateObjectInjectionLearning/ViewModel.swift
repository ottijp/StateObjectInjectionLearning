import Foundation

class ViewModel: ObservableObject {
  @Published var message = ""

  func load() {
    Task {
      let client = ApiClient()
      let message = try await client.getMessage()
      await MainActor.run {
        self.message = message
      }
    }
  }
}
