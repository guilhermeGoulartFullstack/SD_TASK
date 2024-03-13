import 'package:bloc/bloc.dart';
import 'package:sd_task/domain/user_account.domain.dart';
import 'package:sd_task/bloc/user_account_event.bloc.dart';
import 'package:sd_task/bloc/user_account_state.bloc.dart';
import 'package:sd_task/firebase/controller/user_account_controller.firebase.dart';

class UserAccountBloc extends Bloc<UserAccountEvent, UserAccountState> {
  final _repository = UserAccountController();

  UserAccountBloc() : super(UserAccountLoadingState()) {
    //
    on<LoadUserAccountEvent>((event, emit) async {
      try {
        emit(UserAccountLoadingState());
        UserAccount userAccount = await _repository.get(user: event.user);

        emit(UserAccountSuccessState(userAccount: userAccount));
      } catch (e) {
        emit(UserAccountErrorState(error: e.toString()));
      }
    });
    //
    on<EditUserAccountNicknameEvent>((event, emit) async {
      try {
        emit(UserAccountLoadingState());
        await _repository.updateNickname(
            user: event.user, newNickname: event.newNickname);

        UserAccount userAccount = await _repository.get(user: event.user);

        emit(UserAccountSuccessState(userAccount: userAccount));
      } catch (e) {
        emit(UserAccountErrorState(error: e.toString()));
      }
    });
    //
    on<EditUserAccountPhotoEvent>((event, emit) async {
      try {
        emit(UserAccountLoadingState());
        await _repository.updatePhoto(user: event.user, file: event.file);

        UserAccount userAccount = await _repository.get(user: event.user);

        emit(UserAccountSuccessState(userAccount: userAccount));
      } catch (e) {
        emit(UserAccountErrorState(error: e.toString()));
      }
    });
    //
    on<AddPeriodToUserAccountEvent>((event, emit) async {
      try {
        emit(UserAccountLoadingState());
        await _repository.addPeriod(user: event.user, request: event.request);
        UserAccount userAccount = await _repository.get(user: event.user);

        emit(UserAccountSuccessState(userAccount: userAccount));
      } catch (e) {
        emit(UserAccountErrorState(error: e.toString()));
      }
    });
    //
    on<EditUserAccontPeriodEvent>((event, emit) async {
      try {
        emit(UserAccountLoadingState());
        await _repository.editPeriod(user: event.user, request: event.request);
        UserAccount userAccount = await _repository.get(user: event.user);

        emit(UserAccountSuccessState(userAccount: userAccount));
      } catch (e) {
        emit(UserAccountErrorState(error: e.toString()));
      }
    });
    //
    on<DeletePeriodFromUserAccountEvent>((event, emit) async {
      try {
        emit(UserAccountLoadingState());
        await _repository.deletePeriod(user: event.user, id: event.id);
        UserAccount userAccount = await _repository.get(user: event.user);

        emit(UserAccountSuccessState(userAccount: userAccount));
      } catch (e) {
        emit(UserAccountErrorState(error: e.toString()));
      }
    });
  }
}
