import 'package:bloc/bloc.dart';

///
/// [BlocObserver] for the Device application which
/// observes all state changes.
class MainObserver extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    // ignore: avoid_print
    print('${bloc.runtimeType} $change');
  }
}
