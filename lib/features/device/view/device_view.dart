import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartix_husam/features/device/cubit/device_cubit.dart';
import 'package:smartix_husam/features/device/mockups/device_types.dart';
import 'package:smartix_husam/features/device/model/device_model.dart';
import 'package:smartix_husam/features/device/model/device_type.dart';
import 'package:smartix_husam/features/device/view/single_device_view.dart';
import 'package:smartix_husam/mixins/loading_state_mixin.dart';
import 'package:smartix_husam/style/theme.dart';
import 'package:smartix_husam/utils/string_to_color.dart';

class DeviceView extends StatefulWidget {
  const DeviceView({Key? key}) : super(key: key);

  @override
  State<DeviceView> createState() => _DeviceViewState();
}

class _DeviceViewState extends State<DeviceView> with LoadingStateMixin {
  // params
  int? _deviceId;
  DeviceType _type = deviceTypes.first;

  // methods
  @override
  void initState() {
    _initDevices();
    super.initState();
  }

  ///
  /// This Function is used to initalize the user devices
  ///
  _initDevices() async {
    // show loading
    showLoading();

    // initDevices
    await BlocProvider.of<DeviceCubit>(context).init();
    _type = deviceTypes[0];

    // hide loading
    hideLoading();
  }

  ///
  /// add new device  for user
  ///
  _addDevice() async {
    // check selected type & id
    print(_deviceId);
    if (_deviceId == null || _deviceId == -1) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please Enter Device ID'),
        ),
      );
      return;
    }

    // close Bottom Sheet
    Navigator.of(context).pop();

    // show loading
    showLoading();

    // add device
    await context.read<DeviceCubit>().addDevice(DeviceModel(
          id: _deviceId!,
          name: _type.name,
          icon: _type.icon,
          color: _type.color,
          isActive: false,
        ));
    // hide loading
    hideLoading();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeviceCubit, List<DeviceModel>>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[Color(0xFFfce2e1), Colors.white]),
          ),
          child: isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                  child: SafeArea(
                    child: Column(
                      children: [
                        // user welcome section
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text(
                              "Hi, Matti",
                              style: TextStyle(
                                  fontSize: 28,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            CircleAvatar(
                              minRadius: 16,
                              backgroundImage:
                                  AssetImage("assets/images/user.webp"),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),

                        // widgets section
                        Expanded(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30.0),
                                topLeft: Radius.circular(30.0),
                              ),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // 1- title
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "A total of ${state.length} devices",
                                            style: const TextStyle(
                                                fontSize: 15,
                                                color: Colors.grey,
                                                fontWeight: FontWeight.normal),
                                          ),
                                          const Text(
                                            "Living Room",
                                            style: TextStyle(
                                                height: 1.1,
                                                fontSize: 17,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                      IconButton(
                                        onPressed: _onAddBtn,
                                        icon: const Icon(
                                          Icons.add_box_outlined,
                                          size: 28,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),

                                  // 2- widgets
                                  Expanded(
                                    child: GridView.builder(
                                        padding: const EdgeInsets.only(
                                            top: 10, bottom: 20),
                                        gridDelegate:
                                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                                maxCrossAxisExtent: 200,
                                                childAspectRatio: 3 / 4,
                                                crossAxisSpacing: 20,
                                                mainAxisSpacing: 20),
                                        itemCount: state.length,
                                        itemBuilder: (BuildContext ctx, index) {
                                          return SingleDeviceView(
                                            name: state[index].name,
                                            svg: state[index].icon,
                                            color: state[index].color.toColor(),
                                            isActive: state[index].isActive,
                                            onChanged: (val) async {
                                              showLoading();
                                              await context
                                                  .read<DeviceCubit>()
                                                  .toggleDevice(state[index].id,
                                                      isActive: val);
                                              hideLoading();
                                            },
                                            onDelete: () async {
                                              showLoading();
                                              await context
                                                  .read<DeviceCubit>()
                                                  .removeDevice(state[index]);
                                              hideLoading();
                                            },
                                          );
                                        }),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }

  ///
  /// show add device Bottom Sheet
  ///
  _onAddBtn() {
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
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Add device',
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
                    const SizedBox(height: 24),
                    TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (val) => _deviceId =
                          val.isEmpty ? -1 : (int.tryParse(val) ?? -1),
                      decoration: const InputDecoration(
                        hintText: 'Enter Device Id',
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    DropdownButton<DeviceType>(
                        value: _type,
                        items: deviceTypes.map((el) {
                          return DropdownMenuItem<DeviceType>(
                            value: el,
                            child: Text(el.name),
                          );
                        }).toList(),
                        onChanged: (val) {
                          if (mounted) {
                            setState(() {
                              _type = val!;
                            });
                          }
                        }),
                    const SizedBox(
                      height: 24,
                    ),
                    ElevatedButton(
                      onPressed: _addDevice,
                      child: const Text('Add'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
