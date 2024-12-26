//	
// Copyright © Juan Francisco Dorado Torres. All rights reserved.
//

import SwiftUI

struct DetailView: View {
  let user: User

  var body: some View {
    Form {

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
