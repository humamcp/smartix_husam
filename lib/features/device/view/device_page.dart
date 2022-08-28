import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartix_husam/features/device/cubit/device_cubit.dart';
import 'package:smartix_husam/features/device/view/device_view.dart';

/// {@template counter_page}
/// A [StatelessWidget] which is responsible for providing a
/// [DeviceCubit] instance to the [DeviceView].
/// {@endtemplate}
class DevicePage extends StatelessWidget {
  /// {@macro counter_page}
  const DevicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DeviceCubit(),
      child: const DeviceView(),
    );
  }
}
