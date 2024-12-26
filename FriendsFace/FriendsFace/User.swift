//	
// Copyright © Juan Francisco Dorado Torres. All rights reserved.
//

import Foundation

struct User: Hashable, Decodable {
  let id: UUID
  let isActive: Bool
  let name: String
  let age: Int
  let company: String
  let email: String
  let address: String
  let about: String
  let registered: Date
  let tags: [String]
  let friends: [Friend]
}
