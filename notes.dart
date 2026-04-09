import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home.dart';
import 'wallet.dart';
import 'profile.dart';
import 'more.dart';
import 'notifications.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

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
          screen = const MoreScreen(previousIndex: 2);
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

  Widget noteRow({bool deletable = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                color: const Color(0xFF8D8D8D),
                borderRadius: BorderRadius.horizontal(
                  left: const Radius.circular(16),
                  right: Radius.circular(deletable ? 0 : 16),
                ),
              ),
              child: Row(
                children: [
                  Text(
                    'Title',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Date & Time',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (deletable)
            Container(
              width: 56,
              height: 56,
              decoration: const BoxDecoration(
                color: Color(0xFFFF2929),
                borderRadius: BorderRadius.horizontal(
                  right: Radius.circular(16),
                ),
              ),
              child: const Icon(Icons.delete_outline, color: Colors.black),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: buildBottomNav(context, 2),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        onPressed: () {},
        child: const Icon(Icons.add, size: 34),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(14, 16, 14, 10),
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
                  const Spacer(),
                  Text(
                    'Notes',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  const Spacer(),
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

              const SizedBox(height: 10),

              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFF333333),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: ListView(
                    children: [
                      const SizedBox(height: 16),
                      noteRow(),
                      noteRow(deletable: true),
                      noteRow(),
                      noteRow(),
                      noteRow(),
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
