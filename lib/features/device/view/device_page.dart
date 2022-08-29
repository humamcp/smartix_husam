import 'package:flutter/material.dart';
import 'package:smartix_husam/features/device/view/device_view.dart';

///
/// This page required in case of wraping the main feature page with:
/// 1- custom widgets
/// 2- custom providers
/// 3- else
///
class DevicePage extends StatelessWidget {
  const DevicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DeviceView();
  }
}
