/*
 * Copyright (c) 2023 European Commission
 *
 * Licensed under the EUPL, Version 1.2 or - as soon they will be approved by the European
 * Commission - subsequent versions of the EUPL (the "Licence"); You may not use this work
 * except in compliance with the Licence.
 *
 * You may obtain a copy of the Licence at:
 * https://joinup.ec.europa.eu/software/page/eupl
 *
 * Unless required by applicable law or agreed to in writing, software distributed under
 * the Licence is distributed on an "AS IS" basis, WITHOUT WARRANTIES OR CONDITIONS OF
 * ANY KIND, either express or implied. See the Licence for the specific language
 * governing permissions and limitations under the Licence.
 */
import SwiftUI
import logic_resources
import logic_business
import MdocDataModel18013

public struct DocumentDetailsUIModel {

  public let documentName: String
  public let holdersName: String
  public let holdersImage: Image
  public let documentFields: [DocumentField]
}

public extension DocumentDetailsUIModel {

  struct DocumentField: Identifiable {
    public indirect enum Value {
      case string(String)
      case image(Data)
    }

    public let id: String
    public let title: String
    public let value: Value
  }

  static func mock() -> DocumentDetailsUIModel {
    DocumentDetailsUIModel(
      documentName: "Digital ID",
      holdersName: "Jane Doe",
      holdersImage: Theme.shared.image.user,
      documentFields:
        [
          .init(
            id: UUID().uuidString,
            title: "ID no",
            value: .string("AB12356")),
          .init(
            id: UUID().uuidString,
            title: "Nationality",
            value: .string("Hellenic")),
          .init(
            id: UUID().uuidString,
            title: "Place of birth",
            value: .string("21 Oct 1994")),
          .init(
            id: UUID().uuidString,
            title: "Height",
            value: .string("1,82"))
        ]
      +
      Array(
        count: 6,
        createElement: DocumentField(
          id: UUID().uuidString,
          title: "Placeholder Field Title".padded(padLength: 5),
          value: .string("Placeholder Field Value".padded(padLength: 10))
        )
      )
    )
  }
}

extension MdocDecodable {
  func transformToDocumentDetailsUi() -> DocumentDetailsUIModel {

    // TODO: Remove [getDrivingPrivileges()] and compactMap when core returns correct format of driving privileges.

    let values = displayStrings + [getDrivingPrivileges()]

    let documentFields: [DocumentDetailsUIModel.DocumentField] =
    flattenValues(
      input: values
        .compactMap({$0})
        .sorted(by: {$0.order < $1.order})
        .decodeGender()
        .mapTrueFalseToLocalizable()
        .parseDates(),
      images: displayImages
    )

    var bearerName: String {
      guard let fullName = getBearersName() else {
        return ""
      }
      return "\(fullName.first) \(fullName.last)"
    }

    return .init(
      documentName: LocalizableString.shared.get(with: .dynamic(key: title)),
      holdersName: bearerName,
      holdersImage: getPortrait() ?? Theme.shared.image.user,
      documentFields: documentFields
    )
  }

  private func flattenValues(input: [NameValue], images: [NameImage]) -> [DocumentDetailsUIModel.DocumentField] {
    input.reduce(into: []) { partialResult, nameValue in
      let uuid = UUID().uuidString
      let title: String = LocalizableString.shared.get(with: .dynamic(key: nameValue.name))
      if let image = images.first(where: {$0.name == nameValue.name})?.image {

        guard nameValue.name != IsoMdlModel.CodingKeys.portrait.rawValue else {
          partialResult.append(
            .init(
              id: uuid,
              title: title,
              value: .string(LocalizableString.shared.get(with: .shownAbove))
            )
          )
          return
        }

        partialResult.append(
          .init(
            id: uuid,
            title: title,
            value: .image(image)
          )
        )
      } else if let nested = nameValue.children {
        partialResult.append(
          .init(
            id: uuid,
            title: title,
            value: .string(flattenNested(parent: nameValue, nested: nested).value)
          )
        )
      } else {
        partialResult.append(
          .init(
            id: uuid,
            title: title,
            value: .string(nameValue.value)
          )
        )
      }
    }
  }

  private func flattenNested(parent: NameValue, nested: [NameValue]) -> NameValue {
    let flat =
    nested
      .decodeGender()
      .mapTrueFalseToLocalizable()
      .parseDates()
      .reduce(into: "") { partialResult, nameValue in
        partialResult += "\(nameValue.name): \(nameValue.value)"
      }

    return .init(
      name: parent.name,
      value: flat,
      ns: parent.ns,
      order: parent.order,
      children: nil
    )
  }
}
