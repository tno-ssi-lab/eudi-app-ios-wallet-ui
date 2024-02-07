# EUDI iOS Wallet reference application

## Table of contents

* [Overview](#overview)
* [Disclaimer](#disclaimer)
* [How to contribute](#how-to-contribute)
* [Demo videos](#demo-videos)
* [How to use the application](#how-to-use-the-application)
* [Application configuration](#application-configuration)
* [License](#license)

## Overview

The EUDI Wallet Reference Implementation is the application that allows users to:

1. To obtain, store and present documents (mDL, PID).
2. Verify presentations.
3. Share data on proximity scenarios.

## Disclaimer

The released software is a initial development release version: 
-  The initial development release is an early endeavor reflecting the efforts of a short timeboxed period, and by no means can be considered as the final product.  
-  The initial development release may be changed substantially over time, might introduce new features but also may change or remove existing ones, potentially breaking compatibility with your existing code.
-  The initial development release is limited in functional scope.
-  The initial development release may contain errors or design flaws and other problems that could cause system or other failures and data loss.
-  The initial development release has reduced security, privacy, availability, and reliability standards relative to future releases. This could make the software slower, less reliable, or more vulnerable to attacks than mature software.
-  The initial development release is not yet comprehensively documented. 
-  Users of the software must perform sufficient engineering and additional testing in order to properly evaluate their application and determine whether any of the open-sourced components is suitable for use in that application.
-  We strongly recommend to not put this version of the software into production use.
-  Only the latest version of the software will be supported

## How to contribute

We welcome contributions to this project. To ensure that the process is smooth for everyone
involved, follow the guidelines found in [CONTRIBUTING.md](CONTRIBUTING.md).

## Demo videos

Issuance

[Issuance](https://github.com/niscy-eudiw/eudi-app-ios-wallet-ui/assets/129499163/1c0eb50c-1caf-4b66-a326-5f9f408656b8)

Presentation

[Presentation](https://github.com/niscy-eudiw/eudi-app-ios-wallet-ui/assets/129499163/636a4556-4136-49c3-8533-c4f792389b79)

Proximity

[Proximity](https://github.com/niscy-eudiw/eudi-app-ios-wallet-ui/assets/129499163/c1a80121-0e5b-4408-a505-7b1fdaa4b015)

## How to use the application

Prerequisites

In order to complete the flows described below you will to build and run the application with xcode. Clone this repo and make sure you have access to the dependencies below:

_(NOTE: As of 7/2/2024 the iOS app is not available to download. However, in addition to building the app from source, you can also use the Android app which you can download *[here](https://install.appcenter.ms/orgs/eu-digital-identity-wallet/apps/eudi-reference-android/distribution_groups/eudi%20wallet%20(demo)%20public)*)_

[iso18013-data-model](https://github.com/eu-digital-identity-wallet/eudi-lib-ios-iso18013-data-model.git)

[iso18013-data-transfer](https://github.com/eu-digital-identity-wallet/eudi-lib-ios-iso18013-data-transfer.git)

[iso18013-security](https://github.com/eu-digital-identity-wallet/eudi-lib-ios-iso18013-security.git)

[wallet-storage.](https://github.com/eu-digital-identity-wallet/eudi-lib-ios-wallet-storage.git)

[wallet-kit](https://github.com/eu-digital-identity-wallet/eudi-lib-ios-wallet-kit)

[openid4vp-swift](https://github.com/eu-digital-identity-wallet/eudi-lib-ios-siop-openid4vp-swift.git)

[presentation-exchange-swift](https://github.com/eu-digital-identity-wallet/eudi-lib-ios-presentation-exchange-swift.git)

[openid4vci-swift](https://github.com/eu-digital-identity-wallet/eudi-lib-ios-openid4vci-swift)

You will also need to download the Android Verifier app [here](https://install.appcenter.ms/orgs/eu-digital-identity-wallet/apps/mdoc-verifier-testing/distribution_groups/eudi%20verifier%20(testing)%20public)

App launch

1. Launch the application
2. You will be presented with a welcome screen were you will be asked to create a PIN for future logins.

Issuance flow

1. Then you will be shown the "Add document" screen.
2. Pick "National ID".
3. From the web view that appears select the "FormEU" option and tap submit.
4. Fill in the form. Any data will do.
5. You will be shown a success screen. Tap next.
6. Your "National ID" is displayed. Tap "Continue".
7. You are now in the "Dashboard" screen.

Here you can tap "Add doc" and issue a new document, e.g. "Driving License".

If you want to re-issue a document you must delete it first by tapping on the document in the "Dashboard" screen and tapping the delete icon in the "Document details" view.

Presentation (Online authentication/Same device) flow.

1. Go to the browser application on your device and enter "https://dev.verifier.eudiw.dev/"
2. Tap the first option (selectable) and pick the fields you want to share (e.g. "Family Name" and "Given Name")
3. Tap "Next" and then "Authorize".
4. When asked to open the wallet app tap "Open".
5. You will be taken back to the app to the "Request" screen. Tap "Share".
6. Enter the PIN you added in the initail steps.
7. On success tap "Continue".
8. A browser will open showing that the Verifier has accepted your request.
9. Return to the app. You are back to the "Dashboard" screen and the flow is complete.

Proximity flow

1. User logs in successfully to EUDI Wallet app and views the dashboard.
2. User clicks the 'SHOW QR' button in order to display the QR code.
3. Relying Party scans the presented QR code.
4. EUDI Wallet User can view the set of requested data from the relying party.

    1. The distinction between mandatory and optional data elements is depicted.
    2. The requestor (i.e. relying party) of the data is depicted.
    3. EUDI Wallet User may select additional optional attributes to be shared.
5. EUDI Wallet User selects the option to share the attributes.
6. EUDI Wallet authenticates to share data (quick PIN).
7. User authorization is accepted - a corresponding message is displayed to the  EUDI Wallet User.

## Application configuration

You can find instructions on how to configure the application [here](wiki/configuration.md)

## License

### License details

Copyright (c) 2023 European Commission

Licensed under the EUPL, Version 1.2 or - as soon they will be approved by the European
Commission - subsequent versions of the EUPL (the "Licence"); You may not use this work
except in compliance with the Licence.

You may obtain a copy of the Licence at:
https://joinup.ec.europa.eu/software/page/eupl

Unless required by applicable law or agreed to in writing, software distributed under 
the Licence is distributed on an "AS IS" basis, WITHOUT WARRANTIES OR CONDITIONS OF 
ANY KIND, either express or implied. See the Licence for the specific language 
governing permissions and limitations under the Licence.
