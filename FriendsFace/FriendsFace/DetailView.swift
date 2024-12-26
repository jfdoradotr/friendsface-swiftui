//	
// Copyright © Juan Francisco Dorado Torres. All rights reserved.
//

import SwiftUI

struct DetailView: View {
  let user: User

  var body: some View {
    Form {
      Section(header: Text("Basic Information")) {
        HStack {
          Text("Age")
            .font(.footnote)
            .foregroundStyle(.secondary)
          Spacer()
          Text("\(user.age)")
        }
        HStack {
          Text("Email")
            .font(.footnote)
            .foregroundStyle(.secondary)
          Spacer()
          Text("\(user.email)")
        }
        HStack {
          Text("Company")
            .font(.footnote)
            .foregroundStyle(.secondary)
          Spacer()
          Text("\(user.company)")
        }
      }

      Section(header: Text("Address")) {
        Text(user.address)
      }

      Section(header: Text("About")) {
        Text(user.about)
      }

      Section(header: Text("Friends")) {
        Text(user.friends.map { $0.name }.joined(separator: ", "))
      }

      Section(header: Text("Tags")) {
        Text(user.tags.joined(separator: ", "))
      }
    }
    .navigationBarTitleDisplayMode(.inline)
    .toolbar {
      ToolbarItem(placement: .principal) {
        HStack {
          Text(user.name)
            .font(.subheadline)
          Image(systemName: user.statusSystemImageName)
            .foregroundStyle(user.statusColor)
            .font(.footnote)
        }
      }
    }
  }
}

// MARK: - Preview

#Preview {
  NavigationStack {
    DetailView(user: .preview)
  }
}
