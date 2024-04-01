import SwiftUI

struct ContentView: View {
  @StateObject var model = ViewModel()

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

#Preview {
  ContentView()
}
