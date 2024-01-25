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
import logic_business
import Combine
import Foundation

public enum QuickPinPartialState {
  case success
  case failure(Error)
}

public protocol QuickPinInteractorType {
  func setPin(newPin: String)
  func isPinValid(pin: String) -> QuickPinPartialState
  func changePin(currentPin: String, newPin: String) -> QuickPinPartialState
  func hasPin() -> Bool
}

public final class QuickPinInteractor: QuickPinInteractorType {

  private lazy var keyChainController: KeyChainControllerType = KeyChainController()

  public init() {}

  convenience init(keyChainController: KeyChainControllerType) {
    self.init()
    self.keyChainController = keyChainController
  }

  public func setPin(newPin: String) {
    keyChainController.storeValue(key: .devicePin, value: newPin)
  }

  public func isPinValid(pin: String) -> QuickPinPartialState {
    if self.isCurrentPinValid(pin: pin) {
      return .success
    } else {
      return .failure(RuntimeError.quickPinInvalid)
    }
  }

  public func changePin(currentPin: String, newPin: String) -> QuickPinPartialState {
    if self.isCurrentPinValid(pin: currentPin) {
      self.setPin(newPin: newPin)
      return .success
    } else {
      return .failure(RuntimeError.quickPinInvalid)
    }
  }

  public func hasPin() -> Bool {
    return keyChainController.getValue(key: .devicePin)?.isEmpty == false
  }

  private func isCurrentPinValid(pin: String) -> Bool {
    return keyChainController.getValue(key: .devicePin) == pin
  }
}
