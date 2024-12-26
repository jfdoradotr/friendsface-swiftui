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
    guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
      return
    }

    do {
      let (data, _) = try await URLSession.shared.data(from: url)
      let decoder = JSONDecoder()
      decoder.dateDecodingStrategy = .iso8601
      let result = try decoder.decode([User].self, from: data)
      print(result)
    } catch {
      return print(error)
    }
  }
}

// MARK: - Previews

#Preview {
  ContentView()
}
