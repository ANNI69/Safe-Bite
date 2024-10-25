import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mumbai_hacks/screens/NavPages/home.dart';
import 'package:mumbai_hacks/screens/auth/LoginPage.dart';
import 'package:neopop/widgets/buttons/neopop_tilted_button/neopop_tilted_button.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../main.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Future<void> signUp() async {
    try {
      await supabase.auth.signUp(
          password: passwordController.text.trim(),
          email: emailController.text.trim(),
          data: {'email': emailController.text.trim()}
      );
      if(!mounted) return;
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const Home()
          )
      );

    } on AuthException catch (e) {
      print(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black12,
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              //Logo
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Lottie.asset('assets/images/login.json',
                    height: 200, width: 200),
              ),
              // Moto
              Text(
                'BiteSafe.',
                style: TextStyle(
                  fontSize: 46,
                  color: Colors.white,
                  fontFamily: 'Nexa',
                ),
              ),
              //email textfeild
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Email',
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontFamily: 'GeistMono',
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    fillColor: Colors.black38,
                  ),
                ),
              ),
              //password textfeild
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Password',
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.white,
                    ),
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontFamily: 'GeistMono',
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    fillColor: Colors.black38,
                  ),
                ),
              ),
              //confirm password textfeild
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.white,
                    ),
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontFamily: 'GeistMono',
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    fillColor: Colors.black38,
                  ),
                ),
              ),
              //register button
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontFamily: 'GeistMono',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Loginpage()));
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 10,
                          fontFamily: 'GeistMono',
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(40),
                child: NeoPopTiltedButton(
                  isFloating: true,
                  onTapUp: () {
                    signUp();
                  },
                  decoration: const NeoPopTiltedButtonDecoration(
                    color: Color.fromRGBO(255, 235, 52, 1),
                    plunkColor: Color.fromRGBO(255, 235, 52, 1),
                    shadowColor: Color.fromRGBO(36, 36, 36, 1),
                    showShimmer: true,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 70.0,
                      vertical: 15,
                    ),
                    child: Text(
                      'Register ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'Nexa',
                      ),
                    ),
                  ),
                ),
              ),
              //login button
            ],
          ),
        ),
      ),
    );
  }
}
