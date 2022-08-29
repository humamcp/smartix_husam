# smartix_husam


## Whats SmartixH App
with this application you can manage all your smart devices in one place & anywhere.


## How it work?
1- Register/login using your phone number and password.

2- Add a Smart Device or a Routine of a smart device

3- Monitor any changes to your devices

4- Modify/delete your devices and routines

## Implemented Technologies & Methodology
- IDE: vsCode - debug platform: Android phone/windows 10
- Bloc architecture with flutter_bloc package was used in this app
- Feature-driven directory structure was used in this app. this project structure enables us to scale the project by having self-contained features. In this app we only have a four features (home, devices, intro & routines) but in more complex applications we can have hundreds of different features (as auth, media ...etc).
- Every feature has file with same name of folder and contain exports for all feature main files (which reduces the amount of imports used in other classes and make the feature structure easier to understand by others).

## App Structure
- Features:
    1) auth: authentication  (such as: login,logout, register....) // not implemented
    2) device: For everything related to smart devices (models,widgets....)
    3) home: The home page and its UI elements
    4) intro: for splash screen, also in this page all startup data must be download (such as: settings, is application need to update when of new version, maintenance mode ...)
    5) routine: for every thing related to the routines of smart devices (models,widgets....)    

- mixins: this folder contain all mixins, mixin is a way of reusing a class's code in different class hierarchies. It is effectively reducing the amount of code.

- observers: contain all bloc observers (in this app we used just one main observer)

- shared_widgets: It contains widgets that are commonly used in many features.

- style: contain application style related themes, widgets ...etc

- utils: contain commonly used functions & classes.

## Notes
- Json serializing packages(like freezed) is not implemented because the test models are too simple.
- Features which need to be implemented in real world applications are mentioned by "/// TODO:".
- Testing: 2 functions was added as an example for unit test because adding tests for all app functionalities will take a lot of time (same as for widget or integration test).
- Feel free to ask me about anything that is not clear or if you encounter debugging/build issues.
- build: using vsCode & latest version of flutter with vsCode flutter plugin
- test: run the command: "flutter test test/unit_test.dart"

## Video

https://drive.google.com/file/d/12p84URpZ6J2dcoQnmBGCSfmhADXzAM5D/view?usp=sharing
