import SwiftUI

struct ContentView<VM: ViewModel>: View {
  @StateObject var model: VM

  init(model: VM = DefaultViewModel()) {
    _model = StateObject(wrappedValue: model)
  }

  var body: some View {
    VStack {
      Button(action: model.load) {
        Text("Load")
      }
      Text(model.message)
    }
    .padding()
  }
}

#Preview("UUID") {
  class PreviewViewModel: ViewModel {
    var message = "{\n  \"uuid\": \"5fdead26-07b7-4441-8e46-e0bed1fd7429\"\n}"
    func load() {}
  }
  return ContentView(model: PreviewViewModel())
}

#Preview("Unknown") {
  class PreviewViewModel: ViewModel {
    var message = "Unknown message"
    func load() {}
  }
  return ContentView(model: PreviewViewModel())
}
