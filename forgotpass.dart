import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'auth_helpers.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),

              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Forgot Password',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 60),

              Text(
                'Please Enter your email or Contact\nnumber to reset the password.',
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: Colors.white,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 28),

              // Plain input (no prefix icon — matches screenshot)
              TextField(
                controller: _controller,
                style: const TextStyle(color: Colors.black87, fontSize: 15),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFFFDF5F5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                      color: Color(0xFFCCCCCC),
                      width: 1,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 18,
                    horizontal: 20,
                  ),
                ),
              ),

              const SizedBox(height: 36),

              Center(
                child: AuthHelpers.authButton(
                  label: 'Reset  Password',
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const OtpVerificationScreen(),
                    ),
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

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final List<TextEditingController> _otpControllers = List.generate(
    5,
    (_) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(5, (_) => FocusNode());

  @override
  void dispose() {
    for (final c in _otpControllers) c.dispose();
    for (final f in _focusNodes) f.dispose();
    super.dispose();
  }

  Widget _buildOtpBox(int index) {
    return SizedBox(
      width: 54,
      height: 54,
      child: TextField(
        controller: _otpControllers[index],
        focusNode: _focusNodes[index],
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
        decoration: InputDecoration(
          counterText: '',
          filled: false,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white54, width: 1.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white54, width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white, width: 2),
          ),
          contentPadding: EdgeInsets.zero,
        ),
        onChanged: (value) {
          if (value.isNotEmpty && index < 4) {
            FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
          } else if (value.isEmpty && index > 0) {
            FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),

              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(
                  Icons.chevron_left,
                  color: Colors.white,
                  size: 28,
                ),
              ),

              const SizedBox(height: 48),

              Text(
                'Check your email',
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 14),

              RichText(
                text: TextSpan(
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.white70,
                    height: 1.6,
                  ),
                  children: const [
                    TextSpan(text: 'We sent a reset link to '),
                    TextSpan(
                      text: '@gmail.com',
                      style: TextStyle(color: Colors.white),
                    ),
                    TextSpan(
                      text: '\nenter 5 digit code that mentioned in the email',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 36),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(5, (i) => _buildOtpBox(i)),
              ),

              const SizedBox(height: 36),

              Center(
                child: AuthHelpers.authButton(
                  label: 'Verify Code',
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const PasswordResetSuccessScreen(),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              Center(
                child: RichText(
                  text: TextSpan(
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: Colors.white70,
                    ),
                    children: [
                      const TextSpan(text: "Haven't got the email yet? "),
                      WidgetSpan(
                        child: GestureDetector(
                          onTap: () {
                            // TODO: resend logic
                          },
                          child: Text(
                            'Resend email',
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              color: const Color(0xFFCC4444),
                              decoration: TextDecoration.underline,
                              decorationColor: const Color(0xFFCC4444),
                            ),
                          ),
                        ),
                      ),
                    ],
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

class PasswordResetSuccessScreen extends StatelessWidget {
  const PasswordResetSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),

              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(
                  Icons.chevron_left,
                  color: Colors.white,
                  size: 28,
                ),
              ),

              const SizedBox(height: 56),

              Text(
                'Password reset',
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 14),

              Text(
                'Your password has been successfully reset. click confirm to set a new password',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.white70,
                  height: 1.6,
                ),
              ),

              const SizedBox(height: 40),

              Center(
                child: AuthHelpers.authButton(
                  label: 'Confirm',
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const SetNewPasswordScreen(),
                    ),
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

class SetNewPasswordScreen extends StatefulWidget {
  const SetNewPasswordScreen({super.key});

  @override
  State<SetNewPasswordScreen> createState() => _SetNewPasswordScreenState();
}

class _SetNewPasswordScreenState extends State<SetNewPasswordScreen> {
  bool _obscureNew = true;
  bool _obscureConfirm = true;

  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  InputDecoration _whiteInputDecoration({
    required String hintText,
    required Widget? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: GoogleFonts.poppins(color: Colors.white38, fontSize: 14),
      suffixIcon: suffixIcon,
      filled: false,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.white30, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.white30, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.white60, width: 1.5),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),

              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(
                  Icons.chevron_left,
                  color: Colors.white,
                  size: 28,
                ),
              ),

              const SizedBox(height: 48),

              Text(
                'Set a new password',
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                'Create a new password. Ensure it differs from\nprevious ones for security',
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  color: Colors.white60,
                  height: 1.6,
                ),
              ),

              const SizedBox(height: 36),

              Text(
                'Password',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 10),

              TextField(
                controller: _newPasswordController,
                obscureText: _obscureNew,
                style: GoogleFonts.poppins(color: Colors.white70, fontSize: 14),
                decoration: _whiteInputDecoration(
                  hintText: 'Enter your new password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureNew
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: Colors.white38,
                      size: 20,
                    ),
                    onPressed: () => setState(() => _obscureNew = !_obscureNew),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              Text(
                'Confirm Password',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 10),

              TextField(
                controller: _confirmPasswordController,
                obscureText: _obscureConfirm,
                style: GoogleFonts.poppins(color: Colors.white70, fontSize: 14),
                decoration: _whiteInputDecoration(
                  hintText: 'Re-enter password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureConfirm
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: Colors.white38,
                      size: 20,
                    ),
                    onPressed: () =>
                        setState(() => _obscureConfirm = !_obscureConfirm),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              Center(
                child: AuthHelpers.authButton(
                  label: 'Enter',
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/login',
                      (route) => false,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
