import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  // methods
  @override
  void initState() {
    _iniRoutines();
    super.initState();
  }

  _iniRoutines() async {
    showLoading();
    await BlocProvider.of<RoutineCubit>(context).init();
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
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.length,
                        itemBuilder: (context, index) {
                          return SignleRoutineView(
                            routine: state[index],
                            onChanged: (bool value) {
                              BlocProvider.of<RoutineCubit>(context)
                                  .toggleRoutine(state[index].id,
                                      isActive: value);
                            },
                            onDelete: () {
                              BlocProvider.of<RoutineCubit>(context)
                                  .removeRoutine(state[index]);
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }
}
