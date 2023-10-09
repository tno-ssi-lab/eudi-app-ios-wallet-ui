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

public struct MaterialColor {
  enum MaterialColors: String {
    case primary
    case onPrimary
    case primaryContainer
    case onPrimaryContainer
    case secondary
    case onSecondary
    case secondaryContainer
    case onSecondaryContainer
    case tertiary
    case onTertiary
    case tertiaryContainer
    case onTertiaryContainer
    case error
    case errorContainer
    case onError
    case onErrorContainer
    case background
    case onBackground
    case surface
    case onSurface
    case surfaceVariant
    case onSurfaceVariant
    case surfaceTint
    case outline
    case outlineVariant
    case inverseOnSurface
    case inverseSurface
    case inversePrimary
    case scrim
  }

  var bundle: Bundle

  // MARK: - Primary

  public var primary: Color {
    Color(MaterialColors.primary.rawValue, bundle: bundle)
  }
  public var onPrimary: Color {
    Color(MaterialColors.onPrimary.rawValue, bundle: bundle)
  }
  public var primaryContainer: Color {
    Color(MaterialColors.primaryContainer.rawValue, bundle: bundle)
  }
  public var onPrimaryContainer: Color {
    Color(MaterialColors.onPrimaryContainer.rawValue, bundle: bundle)
  }

  // MARK: - Secondary

  public var secondary: Color {
    Color(MaterialColors.secondary.rawValue, bundle: bundle)
  }

  public var onSecondary: Color {
    Color(MaterialColors.onSecondary.rawValue, bundle: bundle)
  }
  public var secondaryContainer: Color {
    Color(MaterialColors.secondaryContainer.rawValue, bundle: bundle)
  }
  public var onSecondaryContainer: Color {
    Color(MaterialColors.onSecondaryContainer.rawValue, bundle: bundle)
  }

  // MARK: - Tertiary

  public var tertiary: Color {
    Color(MaterialColors.tertiary.rawValue, bundle: bundle)
  }
  public var onTertiary: Color {
    Color(MaterialColors.onTertiary.rawValue, bundle: bundle)
  }
  public var tertiaryContainer: Color {
    Color(MaterialColors.tertiaryContainer.rawValue, bundle: bundle)
  }
  public var onTertiaryContainer: Color {
    Color(MaterialColors.onTertiaryContainer.rawValue, bundle: bundle)
  }

  // MARK: - Error

  public var error: Color {
    Color(MaterialColors.error.rawValue, bundle: bundle)
  }
  public var errorContainer: Color {
    Color(MaterialColors.errorContainer.rawValue, bundle: bundle)
  }
  public var onError: Color {
    Color(MaterialColors.onError.rawValue, bundle: bundle)
  }
  public var onErrorContainer: Color {
    Color(MaterialColors.onErrorContainer.rawValue, bundle: bundle)
  }

  // MARK: - Background

  public var background: Color {
    Color(MaterialColors.background.rawValue, bundle: bundle)
  }
  public var onBackground: Color {
    Color(MaterialColors.onBackground.rawValue, bundle: bundle)
  }

  // MARK: - Surface

  public var surface: Color {
    Color(MaterialColors.surface.rawValue, bundle: bundle)
  }
  public var onSurface: Color {
    Color(MaterialColors.onSurface.rawValue, bundle: bundle)
  }
  public var surfaceVariant: Color {
    Color(MaterialColors.surfaceVariant.rawValue, bundle: bundle)
  }
  public var onSurfaceVariant: Color {
    Color(MaterialColors.onSurfaceVariant.rawValue, bundle: bundle)
  }
  public var surfaceTint: Color {
    Color(MaterialColors.surfaceTint.rawValue, bundle: bundle)
  }

  // MARK: - Outline

  public var outline: Color {
    Color(MaterialColors.outline.rawValue, bundle: bundle)
  }

  public var outlineVariant: Color {
    Color(MaterialColors.outlineVariant.rawValue, bundle: bundle)
  }
  // MARK: - Inverse

  public var inverseOnSurface: Color {
    Color(MaterialColors.inverseOnSurface.rawValue, bundle: bundle)
  }
  public var inverseSurface: Color {
    Color(MaterialColors.inverseSurface.rawValue, bundle: bundle)
  }
  public var inversePrimary: Color {
    Color(MaterialColors.inversePrimary.rawValue, bundle: bundle)
  }

  // MARK: - Scrim

  public var scrim: Color {
    Color(MaterialColors.scrim.rawValue, bundle: bundle)
  }
}
