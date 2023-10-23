/*
 * Copyright (c) 2023 European Commission
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import SwiftUI
import logic_resources

public struct BearerUIModel: Identifiable {
  public let id: String
  public let value: Value

  public init(id: String, value: Value) {
    self.id = id
    self.value = value
  }
}

public extension BearerUIModel {
  struct Value {
    public let id: String
    public let name: String
    public let image: Image
  }

  static func mock() -> BearerUIModel {
    .init(id: UUID().uuidString, value: .init(id: UUID().uuidString, name: "Elena P.", image: Theme.shared.image.user))
  }
}