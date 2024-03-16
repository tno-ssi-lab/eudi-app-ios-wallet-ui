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
import logic_ui
import feature_common

public struct ProximityLoadingView<Router: RouterHost, Interactor: ProximityInteractor>: View {

  @ObservedObject private var viewModel: ProximityLoadingViewModel<Router, Interactor>

  public init(with router: Router, and interactor: Interactor, relyingParty: String) {
    self.viewModel = .init(router: router, interactor: interactor, relyingParty: relyingParty)
  }

  public var body: some View {
    BaseLoadingView(with: viewModel.router, viewModel: viewModel)
  }
}
