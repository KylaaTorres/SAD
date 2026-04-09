import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  Widget buildSafeImage(String path, {double height = 280}) {
    return Image.asset(
      path,
      height: height,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) {
        return Icon(
          Icons.image_outlined,
          color: Colors.white54,
          size: height * 0.6,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 24),
          child: Column(
            children: [
              const Spacer(),

              Center(
                child: buildSafeImage(
                  'assets/images/study_budget_logo.png',
                  height: 280,
                ),
              ),

              const SizedBox(height: 28),

              Text(
                'Track\nyour spending',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: 260,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const SecondSplashScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD0D0D0),
                    foregroundColor: Colors.black,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: Text(
                    'Get Started',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class SecondSplashScreen extends StatelessWidget {
  const SecondSplashScreen({super.key});

  Widget buildSafeImage(String path, {double height = 220}) {
    return Image.asset(
      path,
      height: height,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) {
        return Icon(
          Icons.image_outlined,
          color: Colors.white54,
          size: height * 0.6,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 24),
          child: Column(
            children: [
              const Spacer(flex: 2),

              Center(
                child: buildSafeImage(
                  'assets/images/owl_logo.png',
                  height: 250,
                ),
              ),

              const SizedBox(height: 28),

              Center(
                child: Text(
                  'Welcome to your\nExpense Tracker.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                  ),
                ),
              ),

              const SizedBox(height: 18),

              Center(
                child: Text(
                  'Monitor your weekly budget with confidence.\nKnow exactly where your allowance goes.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 1.6,
                  ),
                ),
              ),

              const SizedBox(height: 28),

              SizedBox(
                width: 260,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const LoginScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD0D0D0),
                    foregroundColor: Colors.black,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: Text(
                    'Continue',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),

              const Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}
