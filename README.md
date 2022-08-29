# smartix_husam


## Whats SmartixH App
with this application you can manage all your smart devices in one place & anywhere.


## How it work?
1- Register/login using your phone number and password.

2- Add a smart device or Routine for the smart device

3- Monitor any changes to your devices

4- Modify/delete your devices and routines

## Implemented Technologies & Methodology
- IDE: vsCode - debug platform: Android phone/windows 10
- The application uses bloc architecture with flutter_bloc package
- The application uses a feature-driven directory structure. This project structure enables us to scale the project by having self-contained features. In this app we only have a three features (home, devices & routines) but in more complex applications we can have hundreds of different features.
- Every feature has file with same name of folder and contain exports for all feature main files

## App Structure
- Features:
    1) auth: authenetication (such as: login,logout, register....) // not implemented
    2) device: for every thing related to smart devices(models,widgets....)
    3) home: home page & its widgets
    4) intro: for splash screen, also in this page all startup data must be download (such as: settings, application need to update because of new version, maintanance mode ...)
    5) routine: for every thing related to smart devices Routines (models,widgets....)    

- mixins: this folder contain all mixins, mixin is a way of reusing a class's code in different class hierarchies. which is minimize the amount of code affectivly.

- observers: contain all bloc observers (in this app we used just one main observer)

- shared_widgets: contain widgets which commonly used in multiple features.

- style: contain application style related themes, widgets ...etc

- utils: contain commonly used functions & classes.

## Notes
- Json serializing packages(like freezed) is not implemented because
the test models is very simple
- Features must implemented in real world apps were mentioned by "/// TODO:"
-  Testing: 2 functions was added as an example for unit test because adding tests for all
app functionalities will take a lot of time (same as for widget or integration test).
- Feel free to ask me about anything not clear or if you encountered debuging issues.

