import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartix_husam/features/device/cubit/device_cubit.dart';
import 'package:smartix_husam/features/device/model/device_model.dart';
import 'package:smartix_husam/features/routine/model/routine_model.dart';
import 'package:smartix_husam/features/routine/view/single_routine_view.dart';
import 'package:smartix_husam/mixins/loading_state_mixin.dart';
import 'package:smartix_husam/style/theme.dart';

import '../cubit/routine_cubit.dart';

class RoutineView extends StatefulWidget {
  const RoutineView({Key? key}) : super(key: key);

  @override
  State<RoutineView> createState() => _RoutineViewState();
}

class _RoutineViewState extends State<RoutineView> with LoadingStateMixin {
  // params
  final _formKey = GlobalKey<FormState>();
  DeviceModel? _deviceModel;
  String name = 'My Routine 1';
  String time = 'Every day - 12:00pm';
  String task = 'Turn on...';

  // methods
  @override
  void initState() {
    _iniRoutines();
    super.initState();
  }

  ///
  /// This Function is used to initalize the user routines
  ///
  _iniRoutines() async {
    // show loading
    showLoading();

    // init routines
    await BlocProvider.of<RoutineCubit>(context).init();

    // hide loading
    hideLoading();
  }

  ///
  /// add new routine for user
  ///
  _addRoutine() async {
    // check selected fields
    if (_deviceModel == null ||
        _formKey.currentState == null ||
        !_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please Enter All Fields Correctly'),
        ),
      );
      return;
    }
    _formKey.currentState!.save();

    // close Bottom Sheet
    Navigator.of(context).pop();

    // show loading
    showLoading();

    // add device
    await context.read<RoutineCubit>().addRoutine(RoutineModel(
          id: DateTime.now().millisecondsSinceEpoch,
          name: name,
          deviceId: _deviceModel != null ? _deviceModel!.id : -1,
          task: task,
          time: time,
          isActive: false,
        ));

    // hide loading
    hideLoading();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RoutineCubit, List<RoutineModel>>(
      listener: (context, state) {},
      builder: (context, state) {
        return isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                color: Colors.transparent,
                alignment: Alignment.center,
                child: Column(
                  children: [
                    const SizedBox(height: 24),

                    // Title
                    Text(
                      'You have ${state.length} routines',
                      style: AppTheme.TEXT_TITLE_STYLE,
                    ),

                    const SizedBox(height: 24),

                    // Routines List
                    if (state.isEmpty)
                      const Text('No Routine!')
                    else
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.length,
                          itemBuilder: (context, index) {
                            return SignleRoutineView(
                              routine: state[index],
                              onChanged: (bool value) {
                                showLoading();
                                BlocProvider.of<RoutineCubit>(context)
                                    .toggleRoutine(state[index].id,
                                        isActive: value);
                                hideLoading();
                              },
                              onDelete: () {
                                showLoading();
                                BlocProvider.of<RoutineCubit>(context)
                                    .removeRoutine(state[index]);
                                hideLoading();
                              },
                            );
                          },
                        ),
                      ),

                    // Add Routine button
                    Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: 1,
                          decoration: BoxDecoration(
                              color: Colors.blueGrey.withAlpha(50),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withAlpha(100),
                                  offset: const Offset(1, 1),
                                  blurRadius: 10,
                                )
                              ]),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton.icon(
                          onPressed: _onAddBtn,
                          icon: const Icon(
                            Icons.add_task,
                          ),
                          label: const Text(
                            'Add Routine',
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ],
                ),
              );
      },
    );
  }

  ///
  /// show add routine Bottom Sheet
  ///
  _onAddBtn() {
    final devices = BlocProvider.of<DeviceCubit>(context).state;
    Scaffold.of(context).showBottomSheet(
      backgroundColor: Colors.black.withAlpha(100),
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: MediaQuery.of(context).size.height,
      ),
      enableDrag: true,
      (context) {
        return Container(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * .9,
            height: MediaQuery.of(context).size.height * .65,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Add Routine',
                              style: AppTheme.TEXT_TITLE_STYLE,
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: const Icon(
                                Icons.close,
                                size: 32,
                              ),
                            ),
                          ],
                        ),

                        // name
                        const SizedBox(height: 24),
                        TextFormField(
                          initialValue: name,
                          keyboardType: TextInputType.text,
                          onChanged: (val) => name = val,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blueGrey,
                              ),
                            ),
                            hintText: 'Enter Routine Name',
                            labelText: 'Routine Name',
                          ),
                        ),

                        // device
                        const SizedBox(height: 24),
                        DropdownButtonFormField<DeviceModel>(
                            value: _deviceModel,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.blueGrey,
                                ),
                              ),
                              hintText: 'Select Routine Device',
                              labelText: 'Select Routine Device',
                            ),
                            items: devices.map((el) {
                              return DropdownMenuItem<DeviceModel>(
                                value: el,
                                child: Text(el.name),
                              );
                            }).toList(),
                            onChanged: (val) {
                              if (mounted) {
                                setState(() {
                                  _deviceModel = val!;
                                });
                              }
                            }),

                        // time
                        const SizedBox(height: 24),
                        TextFormField(
                          initialValue: time,
                          keyboardType: TextInputType.text,
                          onChanged: (val) => time = val,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blueGrey,
                              ),
                            ),
                            hintText: 'Enter Routine Time',
                            labelText: 'Routine Time',
                          ),
                        ),

                        // task
                        const SizedBox(height: 24),
                        TextFormField(
                          initialValue: task,
                          keyboardType: TextInputType.text,
                          onChanged: (val) => task = val,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blueGrey,
                              ),
                            ),
                            hintText: 'Enter Routine Task',
                            labelText: 'Routine Task',
                          ),
                        ),

                        // submit button
                        const SizedBox(height: 24),
                        ElevatedButton(
                          onPressed: _addRoutine,
                          child: const Text('Add Routine'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
