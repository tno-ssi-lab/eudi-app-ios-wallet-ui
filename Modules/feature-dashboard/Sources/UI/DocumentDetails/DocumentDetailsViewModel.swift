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
import Foundation
import logic_ui
import logic_resources

public struct DocumentDetailsViewState: ViewState {
  var holdersName: String
  var holdersImage: Image
}

public final class DocumentDetailsViewModel<Router: RouterHostType, Interactor: DocumentDetailsInteractorType>: BaseViewModel<Router, DocumentDetailsViewState> {

  private let interactor: Interactor

  init(router: Router, interactor: Interactor) {
    self.interactor = interactor

    super.init(
      router: router,
      initialState: .init(
        holdersName: "",
        holdersImage: Theme.shared.image.user
      )
    )
  }

  func fetchDocumentDetails() {
  }

  private func setNewState(
    holdersName: String?,
    holdersImage: Image?
  ) {
    setState { previous in
        .init(
          holdersName: holdersName ?? previous.holdersName,
          holdersImage: holdersImage ?? previous.holdersImage
        )
    }
  }
}
