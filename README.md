# TravelApp

Design and build a travel platform as flutter project.

# Table of Content

1. [Aim of the project](#Aim-of-the-project)
2. [Features developed in this app](#Features-developed-in-this-app)
3. [New knowledge gained during the project](#New-knowledge-gained-during-the-project)
4. [Running the project](#Running-the-project)
5. [Contributing to TravelApp](#Contributing-to-TravelApp)

# Aim of the project

The aim of this project is to build a new **electronic flight platform** in terms of technology and
design.

As a junior mobile developer, this project will allow me to **learn new skills (UI/UX designer)**,
to **extend my knowledge in Dart/Flutter**, but especially to **offer to clients without
IATA-agreement a mobile app**.

# Features developed in this app
1. **Flight offer**: This feature answers the question: What are the cheapest flights from Yaounde to Dusseldorf on December 1st.
3. 
4. 
5. 

# New knowledge gained during the project
1. **Flutter Project Structure**: The Secret to Maintainable Apps [Reso coder Proposal](https://resocoder.com/2019/08/27/flutter-tdd-clean-architecture-course-1-explanation-project-structure/)
2. **How to define Entities**: What kind of data will the Travel App operate with? Why and how do you merge an Entity and a model in Flutter?
3. **Define the first use-case and test it** get available flights as use-case and using Mockito to make the test Drive development 
3. **REST-APIs**: How to fetch flight offers from Amadeus API using OAuth2?[Amadeuis authorization](https://developers.amadeus.com/self-service/apis-docs/guides/authorization-262)
4. **dependeny Inversion**: How do you separate the domain layer (Abstract Repositories) and the Data layer (Repository involves)?
5. **Network info**: What is the benefit of managing network information separately from the repository?

# Running the project

### Run an all plattform

To install packages and generate app localization files: (this is usually automatically handles by
IDEs)

```sh
flutter pub get
```

The project uses multiple packages that depend on code
generation ([mobx](https://pub.dev/packages/mobx), [injectable](https://pub.dev/packages/injectable)
, [freezed](https://pub.dev/packages/freezed)), so the following command must also be run: (this
version will run once and exit)

```sh
flutter packages pub run build_runner build --delete-conflicting-outputs
```

and this will will listen for file changes: (useful for development)

```sh
flutter packages pub run build_runner watch --delete-conflicting-outputs
```

After this the project is ready to run (can be done from IDEs, or with `flutter` run command).

### Running on web

When running the app on web/Chrome, in dev environment (connected to real API), you might encounter
CORS errors (they can be seen in the console, as well as in the network tab in inspect element).
This happens because the API is restricted to being called from the same domain, and localhost does
not match that domain.

To get around this restriction, we need to disable CORS checks in the instance of Chrome used by
Flutter. One way of achieving this is with
the [flutter_cors tool](https://pub.dev/packages/flutter_cors). This is hosted on the dart package
repository, but it's not a project package, instead it needs to be installed globally, like this:

```
dart pub global activate flutter_cors
```

Afterwards, to disable CORS checks, you must run the tool like this:

```
fluttercors --disable
```

NOTE: if your flutter is not installed in a standard location, the tool might throw an error, and
then you have to invoke it like this instead:

```
fluttercors --disable -p /path/to/flutter
```

To find out the path to your flutter, you can use `which flutter`, or else get the path from your
IDE settings (Flutter SDK path).

NOTE 2: if you have CORS checks disabled, you will get an error when you try to `flutter upgrade`,
and you will have to use `flutter upgrade --force` instead, and also, you will have to run the CORS
tool _again_ after the upgrade is done.

### Upgrade the plattform

To get latest master

```sh
#get the latest version of Flutter 
flutter upgrade --force
# clean build folder
flutter clean
# delete Pod artifacts
rm -rf ios/Pods macos/Pods
# rm -rf ios/Podfile.lock macos/Podfile.lock 
# update Pod reference globally
pod repo update
# get dependencies
flutter pub get
# install pod in BOTH the ios and macos folders
cd ios
pod install
cd ../macos
pod install
cd ..
```

- restart IDE to avoid cache issues

# Contributing to TravelApp

Feel free to contribute to this project.

If you find a bug or want a feature, but don't know how to fix/implement it, please fill
an [issue](...).  
If you fixed a bug or implemented a new feature, please send a [pull request](...).

### Thanks

1. [Which Flutter Project Structure for your project by Code With ANDREA](https://codewithandrea.com/articles/flutter-project-structure/)
1. [Flutter App Architecture with Riverpod: An Introduction](https://codewithandrea.com/articles/flutter-app-architecture-riverpod-introduction/)
