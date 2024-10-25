import 'package:flutter/material.dart';
import 'package:mumbai_hacks/screens/NavPages/home.dart';
import 'package:mumbai_hacks/screens/auth/register_screen.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart' as App;
import 'package:mumbai_hacks/screens/auth/LoginPage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

const SUPABASE_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Ind1c3VsaGNtZnZxd250Z2d2empuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mjk3OTYzMDgsImV4cCI6MjA0NTM3MjMwOH0.OnrV_T3eyDt954xRoQTFOsubIlUvteKzRQYLo2afYPs';
const SUPABASE_URL = 'https://wusulhcmfvqwntggvzjn.supabase.co';

Future<void> main() async {
  await Supabase.initialize(
    url: SUPABASE_URL,
    anonKey: SUPABASE_KEY,
  );

  runApp(
    App.ShadcnApp(
      title: 'BiteSafe',
      home: Loginpage(),
      debugShowCheckedModeBanner: false,
      theme: App.ThemeData(
        colorScheme: App.ColorSchemes.lightGray(),
        radius: 0.5,
      ),
    ),
  );
}

// Get a reference your Supabase client
final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Loginpage(),
        '/home': (context) => Home(),
        '/signup': (context) => const Register(),
      },
      home: Loginpage(),
    );
  }
}
