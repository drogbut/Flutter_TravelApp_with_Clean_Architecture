# TravelApp
Design and build a travel platform as flutter project.

# Table of Content
1. [Aim of the project](#Aim-of-the-project)
2. [App design](#App-Design)
3. [Working of the project](#Working-of-the-project)
4. [Running the project](#Running-the-project)
5. [Contributing to TravelApp](#Contributing-to-TravelApp)

# Aim of the project
The aim of this project is to build a new **electronic flight platform** in terms of technology and design.

As a junior mobile developer, this project will allow me to **learn new skills (UI/UX designer)**, to **extend my knowledge in Dart/Flutter**, but especially to **offer to clients without IATA-agreement a mobile app** to their customers.

# App Design
The design of the app is done with the figma software and includes:
1. [A style guide](https://www.figma.com/file/mMvfzqhzETRqSQNksAD4fb/My-Travel-App?node-id=56%3A41&t=AnAN9EMoAG2tkXMu-0)
2. [The mobile page](https://www.figma.com/file/mMvfzqhzETRqSQNksAD4fb/My-Travel-App?node-id=0%3A1&t=AnAN9EMoAG2tkXMu-0)
3. [The desktop page](https://www.figma.com/file/mMvfzqhzETRqSQNksAD4fb/My-Travel-App?node-id=143%3A35792&t=AnAN9EMoAG2tkXMu-0)

# Working of the project
TravelApp is an end-to-end software solution that helps end-users or travel agencies to manage service providers, bookings, pricing, tracking, analyzing the inventory, etc. In addition to the ticket sales service, TravelApp includes other services such as hotel, tourism and car hire. The basic features are as follows:
1. Onboarding
2. Home
3. Product detail
4. Ckeckout
5. Confirmation

# Running the project
### Run an all plattform
To install packages and generate app localization files: (this is usually automatically handles by IDEs)
```sh
flutter pub get
```

The project uses multiple packages that depend on code generation ([mobx](https://pub.dev/packages/mobx), [injectable](https://pub.dev/packages/injectable), [freezed](https://pub.dev/packages/freezed)), so the following command must also be run: (this version will run once and exit)
```sh
flutter packages pub run build_runner build --delete-conflicting-outputs
```

and this will will listen for file changes: (useful for development)
```sh
flutter packages pub run build_runner watch --delete-conflicting-outputs
```

After this the project is ready to run (can be done from IDEs, or with `flutter` run command).

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

If you find a bug or want a feature, but don't know how to fix/implement it, please fill an [issue](...).  
If you fixed a bug or implemented a new feature, please send a [pull request](...).

### Thanks

:clap: Thanks to helper person