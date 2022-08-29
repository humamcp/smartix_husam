import 'package:flutter/material.dart';
import 'package:smartix_husam/features/routine/view/routine_view.dart';

///
/// This page required in case of wraping the main feature page with:
/// 1- custom widgets
/// 2- custom providers
/// 3- else
///
class RoutinePage extends StatelessWidget {
  const RoutinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const RoutineView();
  }
}
