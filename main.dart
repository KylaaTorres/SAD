import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login.dart';
import 'signup.dart';
import 'forgotpass.dart';
import 'splash_screen.dart';
import 'home.dart';
import 'wallet.dart';
import 'notifications.dart';
import 'notes.dart';
import 'profile.dart';
import 'more.dart';
import 'expense_category.dart';
import 'create_category.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Study Budget',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
        colorScheme: const ColorScheme.dark(
          surface: Colors.black,
          primary: Colors.white,
        ),
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/forgot-password': (context) => const ForgotPasswordScreen(),
        '/home': (context) => const HomeScreen(),
        '/wallet': (context) => const WalletScreen(),
        '/notifications': (context) => const NotificationsScreen(),
        '/notes': (context) => const NotesScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/more': (context) => const MoreScreen(),
        '/expense-categories': (context) => const ExpenseCategoriesScreen(),
        '/create-category': (context) => const CreateCategoryScreen(),
      },
    );
  }
}
