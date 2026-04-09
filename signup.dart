import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'auth_helpers.dart';
import 'login.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _contactController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
                const SizedBox(height: 48),

                Text(
                  'Sign Up',
                  style: GoogleFonts.poppins(
                    fontSize: 36,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 40),

                // Username
                TextField(
                  controller: _usernameController,
                  style: const TextStyle(color: Colors.black87, fontSize: 15),
                  decoration: AuthHelpers.inputDecoration(
                    hintText: 'User Name',
                    prefixIcon: const Icon(
                      Icons.person_outline,
                      color: Color(0xFF555555),
                      size: 20,
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Email
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

                const SizedBox(height: 16),

                // Contact Number
                TextField(
                  controller: _contactController,
                  keyboardType: TextInputType.phone,
                  style: const TextStyle(color: Colors.black87, fontSize: 15),
                  decoration: AuthHelpers.inputDecoration(
                    hintText: 'Contact Number',
                    prefixIcon: const Icon(
                      Icons.phone_outlined,
                      color: Color(0xFF555555),
                      size: 20,
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Password
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
                      onPressed: () =>
                          setState(() => _obscurePassword = !_obscurePassword),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Confirm Password
                TextField(
                  controller: _confirmPasswordController,
                  obscureText: _obscureConfirmPassword,
                  style: const TextStyle(color: Colors.black87, fontSize: 15),
                  decoration: AuthHelpers.inputDecoration(
                    hintText: 'Confirm Password',
                    prefixIcon: const Icon(
                      Icons.lock_outline,
                      color: Color(0xFF555555),
                      size: 20,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureConfirmPassword
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: const Color(0xFF555555),
                        size: 20,
                      ),
                      onPressed: () => setState(
                        () =>
                            _obscureConfirmPassword = !_obscureConfirmPassword,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 32),

                AuthHelpers.authButton(
                  label: 'Create Account',
                  onPressed: () {
                    // TODO: signup logic
                  },
                ),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an Account? ',
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: Colors.white70,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginScreen()),
                      ),
                      child: Text(
                        'Login.',
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
