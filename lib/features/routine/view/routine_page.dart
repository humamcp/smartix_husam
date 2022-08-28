import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartix_husam/features/routine/routine.dart';
import 'package:smartix_husam/features/routine/view/routine_view.dart';

/// {@template counter_page}
/// A [StatelessWidget] which is responsible for providing a
/// [RoutineCubit] instance to the [RoutineView].
/// {@endtemplate}
class RoutinePage extends StatelessWidget {
  /// {@macro counter_page}
  const RoutinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RoutineCubit(),
      child: const RoutineView(),
    );
  }
}
