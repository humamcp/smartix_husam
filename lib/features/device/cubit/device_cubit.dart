import 'package:bloc/bloc.dart';
import 'package:smartix_husam/features/device/model/device_model.dart';

///
/// Manage Devices State
///
class DeviceCubit extends Cubit<List<DeviceModel>> {
  DeviceCubit() : super([]);
  bool isInit = false;

  ///
  /// toggle device active status
  ///
  Future<void> toggleDevice(int id, {required bool isActive}) async {
    // TODO: check if user logged in else -> go to login page
    // ...

    // update list
    final nstate = [...state];
    nstate.firstWhere((element) => element.id == id).isActive = isActive;

    // TODO: in real app call api request for adding device
    await Future.delayed(const Duration(milliseconds: 250));

    // update the state
    emit(nstate);
  }

  ///
  /// init Devices list for user
  ///
  Future<void> init() async {
    // check if already initalized
    if (!isInit) {
      isInit = true;
    } else {
      return;
    }

    // TODO: check if user logged in else -> go to login page
    // ...

    // TODO: in real app call api request for adding device
    await Future.delayed(const Duration(seconds: 1));

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
    await Future.delayed(const Duration(milliseconds: 500));

    // update the state
    emit([...state, model]);
  }

  ///
  /// Remove User Device
  ///
  Future<void> removeDevice(DeviceModel model) async {
    // TODO: check if user logged in else -> go to login page
    // ...

    // TODO: in real app call api request for deleting device
    await Future.delayed(const Duration(milliseconds: 300));

    // update the state
    final nstate = state.where((el) => el.id != model.id).toList();
    // nstate.removeWhere((element) => element.id == model.id);
    emit(nstate);
  }
}

// Mockup Devices
List<DeviceModel> devices = [
  DeviceModel(
      id: 11,
      name: 'Smart Spotlight',
      isActive: true,
      color: "#ff5f5f",
      icon: 'assets/svg/light.svg'),
  DeviceModel(
      id: 12,
      name: 'Smart AC',
      isActive: true,
      color: "#7739ff",
      icon: 'assets/svg/ac.svg'),
  DeviceModel(
      id: 13,
      name: 'Smart TV',
      isActive: false,
      color: "#c9c306",
      icon: 'assets/svg/tv.svg'),
  DeviceModel(
      id: 14,
      name: 'Smart Sound',
      isActive: false,
      color: "#c207db",
      icon: 'assets/svg/speaker.svg'),
];
