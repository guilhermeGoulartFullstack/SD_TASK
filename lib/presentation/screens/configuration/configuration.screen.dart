import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sd_task/domain/period.domain.dart';
import 'package:sd_task/core/custom_colors.core.dart';
import 'package:sd_task/bloc/user_account_bloc.bloc.dart';
import 'package:sd_task/bloc/user_account_state.bloc.dart';
import 'package:sd_task/bloc/user_account_event.bloc.dart';
import 'package:sd_task/firebase/requests/period_request.firebase.dart';
import 'package:sd_task/presentation/screens/configuration/mobx/configuration_mobx.mobx.dart';
import 'package:sd_task/presentation/components/configuration_screen/build_bottom_bar.component.dart';
import 'package:sd_task/presentation/components/configuration_screen/build_period_list.component.dart';
import 'package:sd_task/presentation/components/configuration_screen/build_top_nav_bar.component.dart';
import 'package:sd_task/presentation/components/configuration_screen/build_period_modal.component.dart';
import 'package:sd_task/presentation/components/configuration_screen/loading_configuration.component.dart';
import 'package:sd_task/presentation/components/configuration_screen/build_user_account_info.component.dart';

class Configuration extends StatefulWidget {
  static const String route = "/configuration";

  const Configuration({super.key});

  @override
  State<Configuration> createState() => _ConfigurationState();
}

class _ConfigurationState extends State<Configuration> {
  User? currentUser;
  late final UserAccountBloc bloc;
  late final ConfigurationMobx mobx;

  @override
  void initState() {
    mobx = ConfigurationMobx();
    bloc = UserAccountBloc();
    currentUser = FirebaseAuth.instance.currentUser;
    bloc.add(LoadUserAccountEvent(user: currentUser));
    super.initState();
  }

  void openModal({required bool isEdit, Period? period}) {
    showDialog(
        barrierColor: CustomColors.black.withOpacity(0.25),
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (builder, setState) {
            return BuildPeriodModal(
              isNewPeriod: isEdit,
              period: period,
              addPeriodCallback: (PeriodRequest request) {
                bloc.add(
                  AddPeriodToUserAccountEvent(
                    user: currentUser,
                    request: request,
                  ),
                );
              },
              editPeriodCallback: (PeriodRequest request) {
                bloc.add(EditUserAccontPeriodEvent(
                    user: currentUser, request: request));
              },
              deletePeriodCallback: (String id) {
                bloc.add(DeletePeriodFromUserAccountEvent(
                    user: currentUser, id: id));
              },
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserAccountBloc, UserAccountState>(
        bloc: bloc,
        builder: (context, state) {
          if (state is UserAccountLoadingState) {
            return const LoadingConfiguration();
          }
          if (state is UserAccountSuccessState) {
            Size size = MediaQuery.of(context).size;
            String nickname = state.userAccount!.nickname;

            return Scaffold(
              body: SingleChildScrollView(
                child: SizedBox(
                  width: size.width,
                  height: size.height,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        const Gap(30),
                        const BuildTopNavBar(),
                        const Gap(25),
                        BuildUserAccountInfo(
                          nickname: nickname,
                          photoUrl: state.userAccount!.photoUrl,
                          editarFotoCallback: () async {
                            ImagePicker imagePicker = ImagePicker();

                            XFile? file = await imagePicker.pickImage(
                                source: ImageSource.gallery);

                            if (file != null) {
                              bloc.add(EditUserAccountPhotoEvent(
                                  user: currentUser, file: file));
                            }
                          },
                        ),
                        const Divider(),
                        Observer(builder: (context) {
                          return Expanded(
                            child: BuildPeriodList(
                              userAccount: state.userAccount!,
                              openNewPeriodModalCallback: () {
                                return openModal(isEdit: false);
                              },
                              openEditModalCallback: (Period period) {
                                return openModal(isEdit: true, period: period);
                              },
                            ),
                          );
                        }),
                        const Gap(40),
                        BuildBottomBar(
                          photoUrl: state.userAccount?.photoUrl,
                          nickName: state.userAccount!.nickname,
                        ),
                        const Gap(65),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          return _Error(
            callback: () {
              bloc.add(LoadUserAccountEvent(user: currentUser));
            },
          );
        });
  }
}

class _Error extends StatelessWidget {
  const _Error({required this.callback});

  final Function callback;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Erro ao carregar dados,",
              style: GoogleFonts.inter(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "tente novamente",
              style: GoogleFonts.inter(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Gap(10),
            ElevatedButton(
              onPressed: () {
                callback();
              },
              child: const Text("Recarregar"),
            ),
          ],
        ),
      ),
    );
  }
}
