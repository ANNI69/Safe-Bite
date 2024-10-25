import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:neopop/widgets/buttons/neopop_tilted_button/neopop_tilted_button.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Forgot Password',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Nexa',
              )
          ),
          backgroundColor: Colors.black12,
        ),
        backgroundColor: Colors.black12,
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
              Padding(
                padding: const EdgeInsets.all(15),
                child: NeoPopTiltedButton(
                  isFloating: true,
                  onTapUp: () {},
                  decoration: const NeoPopTiltedButtonDecoration(
                    color: Color(0xFF0D0D0D),
                    plunkColor: Color(0xFF3F6915),
                    shadowColor: Colors.white,
                    border: Border.fromBorderSide(
                      BorderSide(color: Color(0xFF8DD04A), width: 1),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 70.0, vertical: 15),
                    child: Text('Get Email', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
