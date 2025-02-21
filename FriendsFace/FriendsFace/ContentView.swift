//
// Copyright © Juan Francisco Dorado Torres. All rights reserved.
//

import SwiftData
import SwiftUI

struct ContentView: View {
  @Environment(\.modelContext) private var modelContext
  @Query(sort: \User.name) private var users: [User]

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
        DetailView(user: user)
      }
    }
  }
}

// MARK: - Row

private extension ContentView {
  struct Row: View {
    let name: String
    let isActive: Bool

    private let statusIconName: String
    private let statusColor: Color

    var body: some View {
      HStack {
        Image(systemName: statusIconName)
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
    self.statusIconName = user.statusSystemImageName
    self.statusColor = user.statusColor
  }
}

// MARK: - Private

private extension ContentView {
  func fetchUsers() async {
    guard users.isEmpty else {
      return print("No data has been fetched, using SwiftData cache")
    }

    guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
      return
    }

    do {
      let (data, _) = try await URLSession.shared.data(from: url)
      let decoder = JSONDecoder()
      decoder.dateDecodingStrategy = .iso8601
      let result = try decoder.decode([User].self, from: data)
      for item in result {
        modelContext.insert(item)
      }
    } catch {
      return print(error)
    }
  }
}

// MARK: - Previews

#Preview {
  ContentView()
}
