//
// Copyright © Juan Francisco Dorado Torres. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    VStack {
      Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
      Text("Hello, world!")
    }
    .task {
      await fetchUsers()
    }
  }
}

// MARK: - Private

private extension ContentView {
  func fetchUsers() async {

  }
}

// MARK: - Previews

#Preview {
  ContentView()
}
