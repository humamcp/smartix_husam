import 'package:bloc/bloc.dart';
import 'package:smartix_husam/features/routine/model/routine_model.dart';

///
/// Manage Routines State
///
class RoutineCubit extends Cubit<List<RoutineModel>> {
  RoutineCubit() : super([]);

  ///
  /// toggle routine active status
  ///
  Future<void> toggleRoutine(int id, {required bool isActive}) async {
    // TODO: check if user logged in else -> go to login page
    // ...

    // update list
    final nstate = [...state];
    nstate.firstWhere((element) => element.id == id).isActive = isActive;

    // TODO: in real app call api request for adding routine
    await Future.delayed(const Duration(milliseconds: 250));

    // update the state
    emit(nstate);
  }

  ///
  /// init Routines list for user
  ///
  Future<void> init() async {
    // check if already initalized
    if (state.isNotEmpty) return;

    // TODO: check if user logged in else -> go to login page
    // ...

    // TODO: in real app call api request for adding routine
    await Future.delayed(const Duration(seconds: 1));

    // update the state
    emit(routines);
  }

  ///
  /// Add Routine for user
  ///
  Future<void> addRoutine(RoutineModel model) async {
    // TODO: check if user logged in else -> go to login page
    // ...

    // TODO: in real app call api request for adding routine
    await Future.delayed(const Duration(milliseconds: 500));

    // update the state
    emit([...state, model]);
  }

  /// Add 1 to the current state.
  Future<void> removeRoutine(RoutineModel model) async {
    // TODO: check if user logged in else -> go to login page
    // ...

    // TODO: in real app call api request for deleting routine
    await Future.delayed(const Duration(milliseconds: 300));

    // update the state
    final nstate = state.where((el) => el.id != model.id).toList();
    // nstate.removeWhere((element) => element.id == model.id);
    emit(nstate);
  }
}

// Mockup Routines
List<RoutineModel> routines = [
  RoutineModel(
    id: 21,
    deviceId: 11,
    name: 'Light at night',
    isActive: true,
    time: "Every Day - 12:00 AM",
    task: 'Turn of Light',
  ),
  RoutineModel(
    id: 22,
    deviceId: 12,
    name: 'it\'s too hot',
    isActive: true,
    time: "Every Saturday - 02:00 PM",
    task: 'Turn on - 18 degree',
  ),
];
