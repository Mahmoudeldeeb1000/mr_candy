import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../data/models/onbording_model.dart';

class OnbordingScreen extends StatelessWidget {
   OnbordingScreen({super.key});
  PageController pageController= PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        itemCount: onbordings.length,

        itemBuilder:(context, index) {
          return Stack(

            children: [
              Image.asset(onbordings[index].backgroundImage,
                fit: BoxFit.cover,
              ),
              Positioned(
                top:80 ,
                left:50 ,
                right: 50,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(onbordings[index].image,
                      ),
                      const SizedBox(
                        height: 140,
                      ),
                      Text(onbordings[index].title,
                        style: TextStyle(
                          color: Color(0xff5C23CD),

                            fontSize: 20
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        onbordings[index].desc,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey,

                            fontSize: 18
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      MaterialButton(
                        minWidth: double.infinity,
                        color: Color(0xff5C23CD),
                        shape:  RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(60),
                              topLeft: Radius.circular(60),
                              topRight: Radius.circular(4),
                              bottomLeft: Radius.circular(4),
                            )),
                        textColor: Colors.white,
                        onPressed: (){
                          if (index==onbordings.length-1){
                            Navigator.pushReplacement(context,  MaterialPageRoute(builder:(context) {
                              return SizedBox();
                            },));
                          }else{
                            pageController.animateToPage(index+1, duration: Duration(
                                seconds: 1
                            ), curve: Curves.fastOutSlowIn);
                          }
                        },
                        child: Text(onbordings[index].textButton),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      SmoothPageIndicator(
                        controller: pageController,  // PageController
                        count:  onbordings.length,
                        // forcing the indicator to use a specific direction
                        effect:   JumpingDotEffect(
                            activeDotColor: Color(0xff5E22CD) ,
                            dotHeight: 10,
                            dotColor: Colors.grey.withOpacity(0.5)
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
