//  Created by Roman Cebula on 20/02/2020.
//  Copyright © 2020 Roman Cebula. All rights reserved.
//

import Foundation

enum Priority: Int {
  case high
  case medium
  case low
}

struct Task {
  let title: String
  let priority: Priority
}
