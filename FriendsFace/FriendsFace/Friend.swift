//	
// Copyright © Juan Francisco Dorado Torres. All rights reserved.
//

import Foundation
import SwiftData

@Model
class Friend: Hashable, Decodable {
  var id: UUID
  var name: String

  init(id: UUID, name: String) {
    self.id = id
    self.name = name
  }

  enum CodingKeys: CodingKey {
    case id, name
  }

  required init(from decoder: any Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.id = try container.decode(UUID.self, forKey: .id)
    self.name = try container.decode(String.self, forKey: .name)
  }
}
