import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_candy/core/utiles/app_images.dart';
import 'package:mr_candy/features/login/data/repo/login_repo_impelemntation.dart';
import 'package:mr_candy/features/login/presentation/controller/login_cupit.dart';
import 'package:mr_candy/features/login/presentation/controller/login_states.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5C23CD),
      body: BlocProvider(
        create: (context) => LoginCubit(LoginRepoImpelemntation()),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(60),
              alignment: Alignment.topCenter,
              child: Image.asset(AppImages.logo, width: 120, height: 120,),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(70),
                        topRight: Radius.circular(70)
                    )
                ),
                height: double.infinity,
                width: double.infinity,
                child: ListView(
                  children: [
                    SizedBox(height: 50,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Color(0xff5C23CD)),
                          color: Colors.white,
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {
                            print(value);
                          },
                          controller: email,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "email is required";
                            } else {
                              return null;
                            }
                          },
                          style: TextStyle(
                              color: Color(0xff5C23CD)
                          ),

                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email_outlined),
                            prefixIconColor: Color(0xff5C23CD),

                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            hintText: "ادخل البريد الالكترونى",
                            hintStyle: TextStyle(color: Color(0xff5C23CD),
                                fontSize: 20),


                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Color(0xff5C23CD)),
                          color: Colors.white,
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {
                            print(value);
                          },
                          controller: pass,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "password is required";
                            } else {
                              return null;
                            }
                          },
                          style: TextStyle(
                              color: Color(0xff5C23CD)
                          ),

                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            prefixIconColor: Color(0xff5C23CD),

                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            hintText: "ادخل كلمة المرور",
                            hintStyle: TextStyle(color: Color(0xff5C23CD),
                                fontSize: 20),


                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30,),
                    BlocConsumer<LoginCubit, LoginStates>(
                      listener: (context, state) {
                        if(state is LoginFailureState){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text(state.errorMessage) ));
                        }
                        if(state is LoginSuccessState){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("تم تسجيل الدخول بنجاح") ));
                        }
                      },
                      builder: (context, state) {
                        return Padding(
                          padding: const EdgeInsets.only(right:100,left: 100 ),
                          child: Container(
                            height: 70,
                            width: 20,
                            child:
                            state is LoginLoadingState?
                            Center(child: CircularProgressIndicator())
                                :
                            MaterialButton(
                                color: Color(0xff5C23CD),
                                textColor: Colors.white,
                                child: Text("Login"),
                                onPressed: () {
                                  BlocProvider.of<LoginCubit>(context).login(
                                      email: email.text.trim(),
                                      pass: pass.text.trim());
                                }
                            ),
                          ),
                        );
                      },
                    ),
                    Row(
                      children: [
                        MaterialButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => SizedBox(),));
                            },
                            child: Text("ليس لديك جساب؟ قم بانشاء حساب"))
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),

    );
  }
}
