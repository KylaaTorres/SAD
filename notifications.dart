import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home.dart';
import 'wallet.dart';
import 'notes.dart';
import 'profile.dart';
import 'more.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

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
          screen = const MoreScreen(previousIndex: 0);
        }

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => screen),
        );
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.wallet_outlined), label: 'Wallet'),
        BottomNavigationBarItem(icon: Icon(Icons.edit_calendar_outlined), label: 'Notes'),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
        BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More'),
      ],
    );
  }

  Widget notificationCard({bool deletable = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 82,
              decoration: BoxDecoration(
                color: const Color(0xFFE1DFDF),
                borderRadius: BorderRadius.horizontal(
                  left: const Radius.circular(16),
                  right: Radius.circular(deletable ? 0 : 16),
                ),
              ),
            ),
          ),
          if (deletable)
            Container(
              width: 68,
              height: 82,
              decoration: const BoxDecoration(
                color: Color(0xFFFF2929),
                borderRadius: BorderRadius.horizontal(
                  right: Radius.circular(16),
                ),
              ),
              child: const Icon(
                Icons.delete_outline,
                color: Colors.black,
                size: 30,
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
        child: Padding(
          padding: const EdgeInsets.fromLTRB(6, 16, 6, 12),
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
                  Text(
                    'Notification',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 22),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(12, 14, 12, 18),
                  decoration: BoxDecoration(
                    color: const Color(0xFF333333),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView(
                          children: [
                            notificationCard(),
                            notificationCard(deletable: true),
                            notificationCard(),
                            notificationCard(),
                            notificationCard(),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: 255,
                        height: 48,
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
                            'View All',
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              color: Colors.black,
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