![enter image description here](https://firebasestorage.googleapis.com/v0/b/mikadosdk.appspot.com/o/pt_logo.jpg?alt=media&token=bfe45ff0-33be-4821-8be2-c5e37193026e)
# Mikado SDK
Mikado is a power component development kit made with love from the pretty technical team for future clients to use mikado API.

# Requirements

 -   iOS 10.0+ / macOS 10.12+ / tvOS 10.0+ / watchOS 3.0+
 -   Xcode 11+
 -   Swift 5.1+
-   [CocoaPods](https://cocoapods.org/)

# Config project

 1. First clone the project to your local folder.
 2. Open terminal and navigate to your local folder.
 3. Execute this command below
``` swift
Pod install
```
 4. Once you finish to execute pod install with success you can open the **.xcwokspace** file

# Git
To accomplish pretty technical standards we use git flow to manage the code, please see our guidelines from our [confluence](https://prettytechnical.atlassian.net/wiki/spaces/PT/pages/304054462/Development+Git+guidelines) page 

This is our git DOD rules to release and finish features.

![enter image description here](https://firebasestorage.googleapis.com/v0/b/mikadosdk.appspot.com/o/git_trunk.jpg?alt=media&token=cbb07e4e-1ae9-4bf8-ad7f-e753de0126fb)
# Architecture

To accomplish each feature as a DOD we have to deliver each block of code by using this architecture below. 

![Project SDK architecture overview](https://firebasestorage.googleapis.com/v0/b/mikadosdk.appspot.com/o/Architecture.jpg?alt=media&token=235cb8a2-a429-42ff-a308-b2a120e3cd62)

Right now this project doesn't have a Presentation logic. But it might exist in the future.

## Core

Core is the orquesta layer of our main architecture. Is responsible and it also provide base code for each layer.
**The core layer is usually static and we can't add or create new files without the confirmation of the tech manager**

## Managers
Managers are responsible of any helper class that can be provided by each layer. For example a logger or a framework that can improve the work.

Always think that this is a class that all the three layers need. 

## Data
Contains _Repository Implementations and one or many Providers Sources_. ​ **Repositories** are responsible for coordinating data from different API or database. **Providers** consume the repositories and map the data information to **Domain** layer. Data Layer depends only on the Domain Layer. 

## Domain
Is the innermost part of the onion (without dependencies to other layers, it is totally isolated). It contains **Entities**(Business Models) and **ProvidersContract** Interfaces. This layer could be potentially reused within different projects. Such separation allows for not using the host app within the test target because no dependencies (also 3rd party) are needed — this makes the Domain Use Cases tests take just a few seconds. Note: Domain Layer should not include anything from other layers(e.g Data, Presentation, UI, UX).

To connect the domain logic to the presentation layer we use **UseCases**.

## Presentation
contains _UI (UIViewControllers or SwiftUI Views). Views_ are coordinated by _ViewModels (Presenters) which execute one or many Use Cases._ Presentation Layer **depends only** on the **Domain Layer**.

We use KVO and we manage different stages with a view state **[observable](https://gitlab.com/prettytechnical/mikado-sdk/-/blob/master/MikadoSDK/Core/Observable.swift)**

The **View Controller** reference the **View Model Contract** to manage all the presentation logic inside the view model. The **View State** will notify the view controller when logic has change.

## Unit test
Each layer should have his own unit test class. For example: If we want to unit test a provider. We create a unit test class.

Is important to keep it simple and always create a **When**, **Given** and **Then** comment.
Please name the test method as much understandable possible. Also always test the **success** and **failure** methods.

The goal is to always coverage the code with unit testing.
Also is important to always update the unit test. When we need to know how the code works. We can always execute or check the unit test.
Example of Unit test
``` swift
func testMockTargetAvailableSuccess() throws {
        // Given
        let target = TargetType.get
        // When
        guard case .mock = target else {
                XCTFail("Expect Mock Envrioment")
                return
        }
        // Then
        // Success
}
```
We use **[XCtestCase](https://developer.apple.com/documentation/xctest/xctestcase)**  framework for unit test.

**Important**: If you want to test with **mocks**, please use the mock scheme on Xcode to execute the unit test.

## Rules DOD
To accomplish a feature we have to:

 1. Cover all the code coverage with unit test.
 2. Accomplish the architecture rules.
 3. At least one approval for the mobile architecture team.

## Help
If you have any doubts during the development cycle related to the architecture, code styling or any other subject please don't hesitate to ask. It is preferible to solve questions when arising that on Pull Request when everything is done. It is quicker, less frustrating and results on better code.

You can ask your colleagues, your Product Owner or the  [Mobile Chapter Lead](danielc@prettytechnical.io). We will try to attend your request as soon as possible.

**We also ask for your help! Help us improve this document**

If you consider that there is some information that is not clear, missing or needs more clarification please contact us and we will add it to this document as soon as possible. We can improve this document with all of your cooperation.

Thank you very much to help us all to make a better code
