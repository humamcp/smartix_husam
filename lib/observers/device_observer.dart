import 'package:bloc/bloc.dart';

/// {@template device_observer}
/// [BlocObserver] for the Device application which
/// observes all state changes.
/// {@endtemplate}
class DeviceObserver extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    // ignore: avoid_print
    print('${bloc.runtimeType} $change');
  }
}
