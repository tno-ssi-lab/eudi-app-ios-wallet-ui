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

public protocol ShapeManagerProtocol {
  var none: CGFloat { get }
  var extraSmall: CGFloat { get }
  var small: CGFloat { get }
  var medium: CGFloat { get }
  var large: CGFloat { get }
  var extraLarge: CGFloat { get }
  var full: CGFloat { get }

  var capsuleShape: AnyShape { get }
  var lowCornerRadius: AnyShape { get }
  var highCornerRadiusShape: AnyShape { get }
}

public class ShapeManager: ShapeManagerProtocol {

  public var none: CGFloat = 0
  public var extraSmall: CGFloat = 8
  public var small: CGFloat = 16
  public var medium: CGFloat = 18
  public var large: CGFloat = 20
  public var extraLarge: CGFloat = 24
  public var full: CGFloat = .infinity

  public var lowCornerRadius: AnyShape {
    .init(
      RoundedRectangle(cornerSize: .init(width: small, height: small))
        .inset(by: -4)
    )
  }

  public var highCornerRadiusShape: AnyShape {
    .init(
      RoundedRectangle(cornerSize: .init(width: large, height: large))
        .inset(by: -4)
    )
  }

  public var capsuleShape: AnyShape {
    .init(
      Capsule()
        .inset(by: -4)
    )
  }

}

public struct AnyShape: Shape, InsettableShape {

  var insetAmount = 0.0

  private let builder: @MainActor @Sendable (CGRect) -> Path

  init<S: Shape>(_ shape: S) {
    builder = { rect in
      let path = shape.path(in: rect)
      return path
    }
  }

  @MainActor
  public func path(in rect: CGRect) -> Path {
    return builder(rect)
  }

  public func inset(by amount: CGFloat) -> some InsettableShape {
    var arc = self
    arc.insetAmount += amount
    return arc
  }
}
