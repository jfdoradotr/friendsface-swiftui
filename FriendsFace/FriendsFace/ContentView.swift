//
// Copyright © Juan Francisco Dorado Torres. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  @State private var users = [User]()

  var body: some View {
    NavigationStack {
      List {
        ForEach(users, id: \.id) { user in
          NavigationLink(value: user) {
            Row(for: user)
          }
        }
      }
      .task {
        await fetchUsers()
      }
      .navigationTitle("Users")
      .navigationDestination(for: User.self) { user in
        Text(user.name)
      }
    }
  }
}

// MARK: - Row

private extension ContentView {
  struct Row: View {
    let name: String
    let isActive: Bool

    private var statusColor: Color {
      isActive ? .green : .black
    }

    private var statusSystemImageName: String {
      isActive ? "circle.fill" : "circle.slash"
    }

    var body: some View {
      HStack {
        Image(systemName: statusSystemImageName)
          .foregroundStyle(statusColor)
          .font(.footnote)
        Text(name)
          .font(.headline)
      }
    }
  }
}

private extension ContentView.Row {
  init(for user: User) {
    self.name = user.name
    self.isActive = user.isActive
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
