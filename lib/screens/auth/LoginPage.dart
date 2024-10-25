import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:mumbai_hacks/screens/NavPages/home.dart';
import 'package:mumbai_hacks/screens/auth/register_screen.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';
import 'package:neopop/widgets/buttons/neopop_tilted_button/neopop_tilted_button.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../main.dart';
import 'forgot_password.dart';

class Loginpage extends StatefulWidget {
  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    try {
      await supabase.auth.signInWithPassword(
        password: passwordController.text.trim(),
        email: emailController.text.trim(),
      );
      if (!mounted) return;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Home(),
        ),
      );
    } on AuthException catch (e) {
      print(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black12,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Center(
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
                    controller: emailController,
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
                      filled: true,
                    ),
                  ),
                ),

                //password textfeild
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  child: TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      prefixIcon: Icon(
                        Icons.password,
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
                      filled: true,
                    ),
                  ),
                ),
                //forgot password

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPassword()));
                            },
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontFamily: 'GeistMono',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    //Register button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Donr have an account?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontFamily: 'GeistMono',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));
                            },
                            child: Text(
                              'Sign Up',
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
                  ],
                ),
                //login button
                Padding(
                  padding: const EdgeInsets.all(40),
                  child: NeoPopTiltedButton(
                    isFloating: true,
                    onTapUp: () {
                      login();
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
                        'Login Now',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'Nexa',
                        ),
                      ),
                    ),
                  ),
                ),

                // or continue with
                Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Text(
                    'Or continue with' + '    ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'Nexa',
                    ),
                  ),
                ),
                // google button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Image(
                        image: AssetImage('assets/images/google.png'),
                        height: 30,
                        width: 30,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Image(
                        image: AssetImage('assets/images/apple.png'),
                        height: 50,
                        width: 50,
                      ),
                    ),
                  ],
                )
                //signup button
              ],
            ),
          ),
        ));
  }
}
