import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartix_husam/features/device/cubit/device_cubit.dart';
import 'package:smartix_husam/features/device/model/device_model.dart';
import 'package:smartix_husam/features/device/view/devices.dart';
import 'package:smartix_husam/mixins/loading_state_mixin.dart';
import 'package:smartix_husam/utils/string_to_color.dart';

class DeviceView extends StatefulWidget {
  const DeviceView({Key? key}) : super(key: key);

  @override
  State<DeviceView> createState() => _DeviceViewState();
}

class _DeviceViewState extends State<DeviceView> with LoadingStateMixin {
  @override
  void initState() {
    _initDevices();
    super.initState();
  }

  // @override
  // didChangeDependencies(){
  //   super.didChangeDependencies();
  // }

  ///
  /// This Function is used to initalize the user devices
  ///
  _initDevices() async {
    // show loading
    showLoading();

    // initDevices
    await BlocProvider.of<DeviceCubit>(context).init();

    // hide loading
    hideLoading();
  }

  @override
  Widget build(BuildContext context) {
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
              child:  CircularProgressIndicator(),
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
                                AssetImage("assets/images/user.webp"))
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      BlocBuilder<DeviceCubit,
                                          List<DeviceModel>>(
                                        builder: (context, state) {
                                          return Text(
                                            "A total of ${state.length} devices",
                                            style: const TextStyle(
                                                fontSize: 15,
                                                color: Colors.grey,
                                                fontWeight: FontWeight.normal),
                                          );
                                        },
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
                                  Icon(
                                    Icons.more_horiz,
                                    color: Colors.grey[300],
                                    size: 30,
                                  )
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
                                    itemCount: devices.length,
                                    itemBuilder: (BuildContext ctx, index) {
                                      return Devices(
                                        name: devices[index].name,
                                        svg: devices[index].icon,
                                        color: devices[index].color.toColor(),
                                        isActive: devices[index].isActive,
                                        onChanged: (val) {
                                          setState(() {
                                            devices[index].isActive =
                                                !devices[index].isActive;
                                          });
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
    // final textTheme = Theme.of(context).textTheme;
    // Scaffold(
    //   appBar: AppBar(title: const Text('Counter')),
    //   body: Center(
    //     child: BlocBuilder<DeviceCubit, int>(
    //       builder: (context, state) {
    //         return Text('$state', style: textTheme.headline2);
    //       },
    //     ),
    //   ),
    //   floatingActionButton: Column(
    //     mainAxisAlignment: MainAxisAlignment.end,
    //     crossAxisAlignment: CrossAxisAlignment.end,
    //     children: <Widget>[
    //       FloatingActionButton(
    //         key: const Key('counterView_increment_floatingActionButton'),
    //         child: const Icon(Icons.add),
    //         onPressed: () => context.read<DeviceCubit>().increment(),
    //       ),
    //       const SizedBox(height: 8),
    //       FloatingActionButton(
    //         key: const Key('counterView_decrement_floatingActionButton'),
    //         child: const Icon(Icons.remove),
    //         onPressed: () => context.read<DeviceCubit>().decrement(),
    //       ),
    //     ],
    //   ),
    // );
  }
}
