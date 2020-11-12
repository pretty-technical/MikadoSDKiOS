# Mikado SDK

## Content

- [Description](#description)

- [Architecture](#architecture)

    - [UseCase](#UseCase)
    - [Data](#data)
    - [Domain](#domain)
        - [Entities](#entity)
        - [Services](#service)
        - [Mapper](#mapper)
    - [Core](#core)

- [Features](#features)

    - [Login](#Login)

    - [SignUp](#SignUp)

    - [Game List](#Game-List)

    - [Game Launch](#Game-Launch)

- [External Library](#external-library)



## Description 

MikadoSDK is a software development kit (SDK) for IOS gaming apps that implement main features as login, sign up, get the game list and launch games. The SDK simplifies the development of new gaming apps and manage all the backend connections.   

## Install

### Pods

Cocoapods is a dependency manager in Swift and Objective-C that basically is used to add external libraries. 

To install it, open the terminal and execute `$ sudo gem install cocoapods`, then `pod init`. After execute this commands, a file called `Podfile` is generate and is where all the external libraries are declare. To get more information about it, enter [Cocoapods](https://cocoapods.org/)

### SDK

After install Cocoapods, open the PodFile with the command `open podfile` and copy `pod 'MikadoSDK'`, then update the pods with `pod update` or `pod install` command.

## Usage

Mikado SDK is really simple to setup in the project. In the `AppDelegate` declare `Mikado.instance.initialize()` which will automatically validate if the user's session has expired and get the currency list. The SDK also has other methods that can be implemented inside the project, these are:

- `Mikado.instance.hasSession()`
- `Mikado.instance.downloadGameList()`

Also, the SDK have a group of use cases for easy access, these are:

- `Mikado.instance.player`
- `Mikado.instance.arcade`
- `Mikado.instance.utils`

## Architecture
The project is base on Clean Architecture, it includes the Use Case layer, Data layer and Domain Layer. Additionally, there is a Core layer where all the base implementations are.  

### UseCase

- GameUseCase
- UserUseCase
- UtilsUseCase

### Data
- APIStatusCode
- DataDomainMapper
- DataRequest
- MockRepository
- PreferenceData
- Repository

### Domain

#### Entities
- CurrencyEntity
- GameEntity
- LaunchGameEntity
- LaunchGameResponseEntity
- LogInEntity
- Player
- SignUpEntity

#### Services
- GameService
- LogInService
- SignUpService
- UtilsService

#### Mapper
- DomainUseCaseMapper

### Core

- BaseEntity
- BaseError
- BaseIntercator
- BaseService
- Constants
- JsonCodableManagement
- Observable
- SDKDelegate

## Features

### Login

The login module gets and validates the user's credencials and return the user profile information and access token or an exceptions if the credentials are wrong. 

To implement login in your project, just with `Mikado.instance.player.login(email: String, password: String, result: @escaping (() throws -> Void) -> Void)` where it just need the email and password input by the user. Because the method has an autoclosure, is necessary to execute the result, for example:
``` Swift
do {
    try result()
} catch {
    print(error.localizedDescription)
}
```
#### Exceptions

The login method can return the following exceptions:

- `internalError`
- `invalidCredentials`
- `weakSelfError`

#### Success Result

When the login is successful, the method will:

- Save the email, password, token, user Id in the `Keychain`  
- Set the user information in the observable `userInformation`, which to be use in the app, you should called as:
```Swift
Mikado.instance.player.userInformation.observe(on: self) { user in
    guard let user  = user else {
        return
    }
}
```
- Call the service of get the game list. 

### SignUp

The sign up module gets the user information and return the user profile information and access token or an exceptions if something went wrong. 

To implement the sign up in your project, just with `Mikado.instance.player.signUp(userEntity: SignUpEntity?, result: @escaping (() throws -> Void) -> Void)` where it just need the user information as `SignUpEntity` model. Because the method has an autoclosure, is necessary to execute the result, for example:
``` swift
do {
    try result()
} catch {
    print(error.localizedDescription)
}
```

The `SignUpEntity` model have the following attributes:

- companyID
- firstName
- lastName 
- dateOfBirth
- contactNumber 
- country 
- address 
- city
- postCode 
- email
- password 
- currencyID
- offerEmail 
- emailVerified 
- idVerified

#### Exceptions

The sign up method can return the following exceptions:

- `internalError`
- `invalidCredentials`
- `weakSelfError`

#### Success Result

When the sign up is successful, the method will call the login method with the email and password input of the user.

### Game List

The game list module is for get the list of games available to the user. 

To implement the game list in your project, just with `Mikado.instance.arcade.getGameList(result: @escaping (() throws -> Void) -> Void)` where it does not request any parameters. Because the method has an autoclosure, is necessary to execute the result, for example:
```
do {
    try result()
} catch {
    print(error.localizedDescription)
}
```

#### Exceptions

The game list method can return the following exceptions:

- `internalError`
- `invalidCredentials`
- `weakSelfError`

#### Success Result

When the game list is successful, the method will save the list in a observable that can be called as:
``` swift
Mikado.instance.arcade.gameList.observe(on: self) { gameList in
    guard let gameList  = gameList else {
        return
    }
}
``` 

### Game Launch
The game launch module is used to launch the game the user select. 

To implement the launch game in your project, just with `Mikado.instance.arcade.launchGame(result: @escaping (() throws -> Void) -> Void)` where it does not request any parameters. Because the method has an autoclsoure, is necessary to execute the result, for example:
```swift
do {
    try result()
} catch {
    print(error.localizedDescription)
}
```

#### Exceptions

The launch game method could return the following exceptions:

- `internalError`
- `invalidCredentials`
- `weakSelfError`

#### Success Result

When the launch game is successful, it will return the game url to access it (you should use a safari view).

## External Library

| Plugin | Version | Site |
| ------ | ------- | ---- |
| Alamofire | 4.7 | https://github.com/Alamofire/Alamofire |
| SwiftLint | 0.39.2 | https://github.com/realm/SwiftLint |
| SwiftKeychainWrapper | 3.4 | https://github.com/jrendel/SwiftKeychainWrapper |



