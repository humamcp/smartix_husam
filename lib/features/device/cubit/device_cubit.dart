import 'package:bloc/bloc.dart';
import 'package:smartix_husam/features/device/model/device_model.dart';

/// {@template home_cubit}
/// A [Cubit] which manages an [int] as its state.
/// {@endtemplate}
class DeviceCubit extends Cubit<List<DeviceModel>> {
  /// {@macro home_cubit}
  DeviceCubit() : super([]);

  ///
  /// init Devices list for user
  ///
  Future<void> init() async {
    // TODO: check if user logged in else -> go to login page
    // ...

    // TODO: in real app call api request for adding device
    await Future.delayed(const Duration(seconds: 2));

    // update the state
    emit(devices);
  }

  ///
  /// Add Device for user
  ///
  Future<void> addDevice(DeviceModel model) async {
    // TODO: check if user logged in else -> go to login page
    // ...

    // TODO: in real app call api request for adding device
    await Future.delayed(const Duration(seconds: 2));

    // update the state
    emit([...state, model]);
  }

  /// Add 1 to the current state.
  Future<void> removeDevice(DeviceModel model) async {
    // TODO: check if user logged in else -> go to login page
    // ...

    // TODO: in real app call api request for deleting device
    await Future.delayed(const Duration(seconds: 2));

    // update the state
    state.removeWhere((element) => element.id == model.id);
    emit(state);
  }
}

// Mockup Devices
List<DeviceModel> devices = [
  DeviceModel(
      id: 23423,
      name: 'Smart Spotlight',
      isActive: true,
      color: "#ff5f5f",
      icon: 'assets/svg/light.svg'),
  DeviceModel(
      id: 204233,
      name: 'Smart AC',
      isActive: true,
      color: "#7739ff",
      icon: 'assets/svg/ac.svg'),
  DeviceModel(
      id: 234123,
      name: 'Smart TV',
      isActive: false,
      color: "#c9c306",
      icon: 'assets/svg/tv.svg'),
  DeviceModel(
      id: 2352423,
      name: 'Smart Sound',
      isActive: false,
      color: "#c207db",
      icon: 'assets/svg/speaker.svg'),
];
