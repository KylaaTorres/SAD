import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home.dart';
import 'wallet.dart';
import 'notes.dart';
import 'profile.dart';
import 'more.dart';

class CreateCategoryScreen extends StatefulWidget {
  const CreateCategoryScreen({super.key});

  @override
  State<CreateCategoryScreen> createState() => _CreateCategoryScreenState();
}

class _CreateCategoryScreenState extends State<CreateCategoryScreen> {
  final TextEditingController weeklyController = TextEditingController(
    text: '00.00',
  );
  final TextEditingController dailyController = TextEditingController(
    text: '00.00',
  );
  final TextEditingController monthlyController = TextEditingController(
    text: '00.00',
  );

  @override
  void dispose() {
    weeklyController.dispose();
    dailyController.dispose();
    monthlyController.dispose();
    super.dispose();
  }

  Widget buildBottomNav(BuildContext context, int currentIndex) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: const Color(0xFF3A3A3A),
      currentIndex: currentIndex,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
      selectedLabelStyle: GoogleFonts.poppins(fontSize: 12),
      unselectedLabelStyle: GoogleFonts.poppins(fontSize: 12),
      onTap: (index) {
        Widget screen;
        if (index == 0) {
          screen = const HomeScreen();
        } else if (index == 1) {
          screen = const WalletScreen();
        } else if (index == 2) {
          screen = const NotesScreen();
        } else if (index == 3) {
          screen = const ProfileScreen();
        } else {
          screen = const MoreScreen(previousIndex: 4);
        }

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => screen),
        );
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
        BottomNavigationBarItem(
          icon: Icon(Icons.wallet_outlined),
          label: 'Wallet',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.edit_calendar_outlined),
          label: 'Notes',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Profile',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More'),
      ],
    );
  }

  Widget allowanceCard({
    required String title,
    required TextEditingController controller,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.fromLTRB(14, 16, 14, 14),
      decoration: BoxDecoration(
        color: const Color(0xFF666666),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 14),
          TextField(
            controller: controller,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            style: GoogleFonts.poppins(color: Colors.black, fontSize: 16),
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFE3E1E1),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 14, top: 12),
                child: Text(
                  '₱',
                  style: GoogleFonts.poppins(color: Colors.black, fontSize: 20),
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: const BorderSide(color: Colors.white30),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 16,
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Align(
            alignment: Alignment.centerRight,
            child: Icon(Icons.chevron_right, color: Colors.black, size: 38),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: buildBottomNav(context, 4),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 16, 18, 10),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                      size: 34,
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Create Categories',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 48),
                ],
              ),

              const SizedBox(height: 26),

              Text(
                'Set Your Allowances',
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 22),
              ),

              const SizedBox(height: 24),

              Expanded(
                child: ListView(
                  children: [
                    allowanceCard(
                      title: 'Weekly Allowance',
                      controller: weeklyController,
                    ),
                    allowanceCard(
                      title: 'Daily Allowance',
                      controller: dailyController,
                    ),
                    allowanceCard(
                      title: 'Monthly Allowance',
                      controller: monthlyController,
                    ),
                    const SizedBox(height: 4),
                    Center(
                      child: SizedBox(
                        width: 255,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFD0D0D0),
                            foregroundColor: Colors.black,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                          child: Text(
                            'Save',
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
