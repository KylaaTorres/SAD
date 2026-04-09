import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'wallet.dart';
import 'notes.dart';
import 'profile.dart';
import 'more.dart';
import 'notifications.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
        if (index == currentIndex) return;

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
          screen = const MoreScreen();
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

  Widget buildSafeImage(String path, {double height = 90, double width = 90}) {
    return Image.asset(
      path,
      height: height,
      width: width,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) {
        return SizedBox(
          height: height,
          width: width,
          child: const Icon(
            Icons.image_outlined,
            color: Colors.white54,
            size: 42,
          ),
        );
      },
    );
  }

  Widget summaryCard({
    required String title,
    required String amount,
    required Color titleColor,
    double height = 100,
  }) {
    return Container(
      width: double.infinity, // FIX
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF333333),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.poppins(
              color: titleColor,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '₱',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextSpan(
                    text: amount,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: buildBottomNav(context, 0),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buildSafeImage(
                    'assets/images/owl_logo.png',
                    height: 200,
                    width: 200,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Study Budget',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const NotificationsScreen(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.notifications_none_outlined,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              summaryCard(
                title: 'Total Spent',
                amount: '00.00',
                titleColor: const Color(0xFFFF2B2B),
              ),

              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    child: summaryCard(
                      title: 'Budget',
                      amount: '00.00',
                      titleColor: const Color(0xFF38FF4C),
                      height: 84,
                    ),
                  ),
                  const SizedBox(width: 18),
                  Expanded(
                    child: summaryCard(
                      title: 'Left to Spend',
                      amount: '00.00',
                      titleColor: const Color(0xFFFF2B2B),
                      height: 84,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 34),

              Container(
                width: double.infinity,
                height: 320,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF333333),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Recent Expenses',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    const Spacer(),
                    Center(
                      child: Text(
                        'No Expenses yet.',
                        style: GoogleFonts.poppins(
                          color: const Color(0xFFFF2B2B),
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const Spacer(),
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
