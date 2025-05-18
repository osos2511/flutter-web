//step-8-p2
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web/domain/usecases/signIn_usecase.dart';
import 'package:flutter_web/presentation/cubit/signIn_state.dart';

class SignInCubit extends Cubit<SignInState>{
  final SignInUseCase signInUseCase;
  SignInCubit(this.signInUseCase):super(SignInInitial());
  Future<void> signIn(String email,String password)async{
    emit(SignInLoading());
    final result=await signInUseCase(email: email,password: password);
    result.fold((failure) {
      print('SignIn failed: ${failure.message}');
      emit(SignInFailure(failure.message));
        },
            (success)=>emit(SignInSuccess()));
  }

}