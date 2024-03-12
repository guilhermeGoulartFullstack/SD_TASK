import 'package:bloc/bloc.dart';
import 'package:sd_task/bloc/user_account_event.bloc.dart';
import 'package:sd_task/bloc/user_account_state.bloc.dart';
import 'package:sd_task/domain/user_account.domain.dart';

class UserAccountbloc extends Bloc<UserAccountEvent, UserAccountState> {
  // final _repository = FirebaseUserAccount();

  UserAccountbloc() : super(UserAccountLoadingState()) {
    //
    on<LoadUserAccountEvent>((event, emit) async {
      try {
        // UserAccount userAccount = await _repository.get(event.userId);

        // emit(UserAccountSuccessState(userAccount: userAccount));
      } catch (e) {
        emit(UserAccountErrorState(error: e.toString()));
      }
    });
  }
}
