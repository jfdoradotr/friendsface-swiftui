//
// Copyright © Juan Francisco Dorado Torres. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  @State private var users = [User]()

  var body: some View {
    List {
      ForEach(users, id: \.id) { user in
        HStack {
          Image(systemName: user.isActive ? "circle.fill" : "circle.slash")
            .foregroundStyle(user.isActive ? .green : .black)
            .font(.footnote)
          Text(user.name)
            .font(.headline)
        }
      }
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
      users = result
    } catch {
      return print(error)
    }
  }
}

// MARK: - Previews

#Preview {
  ContentView()
}
