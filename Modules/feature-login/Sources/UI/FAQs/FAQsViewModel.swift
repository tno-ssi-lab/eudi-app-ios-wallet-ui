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
import Combine

import logic_ui

@MainActor
final class FAQsViewModel<Router: RouterHostType, Interactor: FAQsInteractorType>: BaseViewModel<Router>, Displayable {

  public typealias State = FAQDisplayable

  private let interactor: Interactor

  @Published var displayable: State = .init()
  @Published var searchText = ""

  public lazy var cancellables = Set<AnyCancellable>()

  init(router: Router, interactor: Interactor) {
    self.interactor = interactor
    super.init(router: router)

    displayable.models = FAQUIModel.mocks()
    displayable.filteredModels = displayable.models

    subscribeToSearchedText()
  }

  private func subscribeToSearchedText() {
    $searchText
      .dropFirst()
      .map { [weak self] text -> [FAQUIModel] in
        guard let self = self else { return [] }
        return displayable.models.filter { model in
          return text.isEmpty || model.value.title.localizedCaseInsensitiveContains(text)
        }
      }
      .assign(to: \.displayable.filteredModels, on: self)
      .store(in: &cancellables)
  }

  func fetchFAQs() async {
    do {
      displayable.isLoading = true
      displayable.models = try await interactor.fetchFAQs()
    } catch {
      displayable.models = []
    }
    displayable.filteredModels = displayable.models
    displayable.isLoading = false
  }

  func goBack() {
    router.pop(animated: true)
  }
}