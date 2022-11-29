import 'package:doctor_app/screens/auth/components/sign_in_form.dart';
import 'package:doctor_app/screens/auth/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'constants.dart';
import 'controller/auth_controller.dart';

class FirstPage extends StatelessWidget {
      String email;
      FirstPage({Key? key,required this.email}) : super(key: key);

  // final GlobalKey formKey;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset(
            "assets/icons/Sign_Up_bg.svg",
            height: MediaQuery.of(context).size.height,
            // Now it takes 100% of our height
          ),
          Padding(
            padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
            child: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome to Health Care",
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      email,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[500]
                      ),
                    ),


                    const SizedBox(height: defaultPadding * 2),
                    const SizedBox(height: defaultPadding * 2),

                    GestureDetector(
                        onTap: (){
                          AuthController.instance.logout();
                        },
                        child: Container(
                          width: 350,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(80),
                          ),
                          child: Center(
                            child: Text(
                              "Sign Out",
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color:Colors.white
                              ),
                            ),

                          ),
                        )
                    )



                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
