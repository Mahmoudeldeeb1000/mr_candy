import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:mr_candy/core/apis/endpoints.dart';
import 'package:mr_candy/core/failure.dart';
import 'package:mr_candy/features/login/data/models/user_model.dart';
import 'package:mr_candy/features/login/data/repo/login_repo.dart';
import 'package:http/http.dart'as http;

class LoginRepoImpelemntation implements LoginRepo{
  @override
  Future<Either<Failure, UserModel>> login({required String email, required String pass}) async{
   try{
     var result = await http.post(
         Uri.parse(EndPoints.baseUrl+EndPoints.login),
         body:
         {
           "email":email,
           "password": pass
         }
     );
     var body= jsonDecode(result.body);
     if(body["status"]){
       return Right(UserModel(id: body["data"]["id"], name: body["data"]["name"], email: body["data"]["email"], phone: body["data"]["phone"], image: body["data"]["image"], points: body["data"]["points"], credit: body["data"]["credit"], token: body["data"]["token"]));
     }else{
       return Left(ApiFailure(errorMassege: body["message"]));
     }

   }on SocketException{
     return Left(NoInternetFailure(errorMassege: "No Internet"));
   } catch(e){
     return Left(ApiFailure(errorMassege: "error"));
   }
  
  
  
  
  
  }
  
}