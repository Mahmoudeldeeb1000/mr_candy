import 'package:dartz/dartz.dart';
import 'package:flutter/src/widgets/editable_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_candy/features/login/data/repo/login_repo.dart';
import 'package:mr_candy/features/login/presentation/controller/login_states.dart';

class LoginCubit extends Cubit<LoginStates>{
  LoginCubit(this.loginRepo) : super(LoginInitialState ());
  final LoginRepo loginRepo;
Future <void> login(
    {
  required String email,
  required String pass,
}
    )async{
emit(LoginLoadingState());
  var result = await loginRepo.login(email: email, pass: pass);
  result.fold((left){
    emit(LoginFailureState(errorMessage: left.errorMassege));
  }, (right){
    emit(LoginSuccessState(userModel: right));
  });
  
}
}