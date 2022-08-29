import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartix_husam/features/device/cubit/device_cubit.dart';
import 'package:smartix_husam/features/device/model/device_model.dart';
import 'package:smartix_husam/features/routine/model/routine_model.dart';
import 'package:smartix_husam/style/theme.dart';

class SignleRoutineView extends StatelessWidget {
  const SignleRoutineView({
    Key? key,
    required this.routine,
    required this.onChanged,
    required this.onDelete,
  }) : super(key: key);
  final RoutineModel routine;
  final ValueChanged<bool>? onChanged;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    // init  & check routine device
    final devices = BlocProvider.of<DeviceCubit>(context)
        .state
        .where((element) => element.id == routine.deviceId);
    final DeviceModel? device = devices.isNotEmpty ? devices.first : null;
    return Card(
      child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              // name & device
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    routine.name,
                    style: AppTheme.TEXT_SUB_STYLE,
                  ),
                ],
              ),
              const SizedBox(height: 34),
              if (device != null) Text('device: ${device.name}'),
              const SizedBox(height: 8),

              // time
              Text('time: ${routine.time}'),

              const SizedBox(height: 8),

              // task
              Text('time: ${routine.task}'),

              const SizedBox(height: 8),

              // is Available & delete
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Transform.scale(
                    alignment: Alignment.center,
                    scaleY: 0.8,
                    scaleX: 0.85,
                    child: CupertinoSwitch(
                      onChanged: onChanged,
                      value: routine.isActive,
                      activeColor: routine.isActive
                          ? Colors.red.withOpacity(0.4)
                          : Colors.black,
                      trackColor: Colors.black,
                    ),
                  ),
                  IconButton(
                    onPressed: onDelete,
                    icon: const Icon(
                      Icons.delete_forever_outlined,
                      size: 32,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),
            ],
          )),
    );
  }
}
