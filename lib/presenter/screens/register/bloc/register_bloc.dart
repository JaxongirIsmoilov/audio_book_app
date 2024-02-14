import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../data/models/auth_data.dart';
import '../../../../domain/repository/app_repository.dart';
import '../../../../domain/repository/impl/app_repository_impl.dart';

part 'register_event.dart';

part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AppRepository _repository = AppRepositoryImpl();

  RegisterBloc() : super(RegisterInitial()) {
    on<ClickBackEvent>((event, emit) {
      emit(ClickBackState());
    });

    on<ClickSignInEvent>((event, emit) {
      emit(ClickSignInState());
    });

    on<ClickRegisterEvent>((event, emit) async {
      emit(LoadingRegisterState());
      try {
        bool registerBehaviour = await _repository.registerWithEmailAndPassword(
            AuthData(event.email, event.password));
        if (registerBehaviour == true) {
          emit(SuccessRegisterState());
        } else {
          emit(FailRegisterState("Something went wrong!"));
        }
      } catch (e) {
        print("myCatch ${e.toString()}");
        emit(FailRegisterState(e.toString()));
      }
    });

    on<ClickGoogleEvent>((event, emit) async {
      emit(LoadingRegisterState());
      try {
        bool registerBehaviour = await _repository.authWithGoogle();
        if (registerBehaviour == true) {
          emit(SuccessRegisterState());
        } else {
          emit(FailRegisterState("Something went wrong!"));
        }
      } catch (e) {
        emit(FailRegisterState(e.toString()));
      }
    });

    on<ClickFacebookEvent>((event, emit) async {
      emit(LoadingRegisterState());
      try {
        bool registrationBehaviour = await _repository.authWithFacebook();
        if (registrationBehaviour == true) {
          emit(SuccessRegisterState());
        } else {
          emit(FailRegisterState("Something went wrong!"));
        }
      } catch (e) {
        emit(FailRegisterState(e.toString()));
      }
    });
  }
}
