import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'auth_helpers.dart';
import 'signup.dart';
import 'forgotpass.dart';
import 'home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 60),

                Text(
                  'Login',
                  style: GoogleFonts.poppins(
                    fontSize: 36,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 48),

                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(color: Colors.black87, fontSize: 15),
                  decoration: AuthHelpers.inputDecoration(
                    hintText: 'Email',
                    prefixIcon: const Icon(
                      Icons.mail_outline,
                      color: Color(0xFF555555),
                      size: 20,
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                TextField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  style: const TextStyle(color: Colors.black87, fontSize: 15),
                  decoration: AuthHelpers.inputDecoration(
                    hintText: 'Password',
                    prefixIcon: const Icon(
                      Icons.lock_outline,
                      color: Color(0xFF555555),
                      size: 20,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: const Color(0xFF555555),
                        size: 20,
                      ),
                      onPressed: () {
                        setState(() => _obscurePassword = !_obscurePassword);
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ForgotPasswordScreen(),
                      ),
                    ),
                    child: Text(
                      'Forgot Password',
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 28),

                AuthHelpers.authButton(
                  label: 'Login',
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const HomeScreen()),
                    );
                  },
                ),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an Account? ",
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: Colors.white70,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const SignupScreen()),
                      ),
                      child: Text(
                        'Sign In.',
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
