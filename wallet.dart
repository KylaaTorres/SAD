import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home.dart';
import 'notes.dart';
import 'profile.dart';
import 'more.dart';
import 'notifications.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

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
          screen = const MoreScreen(previousIndex: 1);
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

  Widget expenseTile({
    required String title,
    required String date,
    required String amount,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFF8B8B8B),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(color: Colors.white, fontSize: 14),
                ),
                const SizedBox(height: 2),
                Text(
                  date,
                  style: GoogleFonts.poppins(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: GoogleFonts.poppins(
              color: const Color(0xFFFF2B2B),
              fontSize: 16,
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
      bottomNavigationBar: buildBottomNav(context, 1),
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
                    'Wallet',
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

              const SizedBox(height: 18),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF333333),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  children: [
                    Text(
                      'Monthly Budget',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 2),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '₱',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 58,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: ' 00.00',
                            style: GoogleFonts.poppins(
                              color: const Color(0xFF38FF4C),
                              fontSize: 36,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 18),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Total Spent',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 4),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '₱',
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 44,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '00.00',
                                      style: GoogleFonts.poppins(
                                        color: const Color(0xFFFF2B2B),
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Left to Spend',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 4),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '₱',
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 44,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '00.00',
                                      style: GoogleFonts.poppins(
                                        color: const Color(0xFF38FF4C),
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              Column(
                children: [
                  Text(
                    'Expenses',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 2),
                    width: 175,
                    height: 1.2,
                    color: Colors.white,
                  ),
                ],
              ),

              const SizedBox(height: 28),

              Expanded(
                child: ListView(
                  children: [
                    expenseTile(
                      title: 'Category',
                      date: 'Date & Time',
                      amount: '-00.00',
                    ),
                    expenseTile(
                      title: 'Category',
                      date: 'Date & Time',
                      amount: '-00.00',
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
