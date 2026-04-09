import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home.dart';
import 'wallet.dart';
import 'notes.dart';
import 'profile.dart';
import 'expense_category.dart';
import 'create_category.dart';

class MoreScreen extends StatelessWidget {
  final int previousIndex;

  const MoreScreen({super.key, this.previousIndex = 0});

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
          screen = MoreScreen(previousIndex: previousIndex);
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

  Widget menuItem({
    required IconData icon,
    required String title,
    VoidCallback? onTap,
    bool showArrow = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 28),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Icon(icon, color: Colors.black, size: 34),
            const SizedBox(width: 18),
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.poppins(color: Colors.black, fontSize: 18),
              ),
            ),
            if (showArrow)
              const Icon(Icons.chevron_right, color: Colors.black, size: 34),
          ],
        ),
      ),
    );
  }

  Widget buildBackgroundContent() {
    if (previousIndex == 1) {
      return _walletLikeBackground();
    } else if (previousIndex == 2) {
      return _notesLikeBackground();
    } else if (previousIndex == 3) {
      return _profileLikeBackground();
    } else {
      return _homeLikeBackground();
    }
  }

  Widget _safeImage(String path, {double height = 105, double width = 105}) {
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
            size: 40,
          ),
        );
      },
    );
  }

  Widget _homeLikeBackground() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _safeImage('assets/images/owl_logo.png'),
          const SizedBox(height: 10),
          Container(
            width: 170,
            height: 98,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF333333),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Spent',
                  style: GoogleFonts.poppins(
                    color: const Color(0xFFFF2B2B),
                    fontSize: 14,
                  ),
                ),
                const Spacer(),
                Text(
                  '₱00.00',
                  style: GoogleFonts.poppins(color: Colors.white, fontSize: 24),
                ),
              ],
            ),
          ),
          const SizedBox(height: 22),
          Container(
            width: 170,
            height: 98,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF333333),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Budget',
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF38FF4C),
                    fontSize: 14,
                  ),
                ),
                const Spacer(),
                Text(
                  '₱00.00',
                  style: GoogleFonts.poppins(color: Colors.white, fontSize: 24),
                ),
              ],
            ),
          ),
          const SizedBox(height: 42),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color(0xFF333333),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Text(
                'Recent Expenses',
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _walletLikeBackground() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 16, 14, 10),
      child: Column(
        children: [
          const SizedBox(height: 70),
          Container(
            width: double.infinity,
            height: 190,
            decoration: BoxDecoration(
              color: const Color(0xFF333333),
              borderRadius: BorderRadius.circular(18),
            ),
          ),
          const SizedBox(height: 28),
          Text(
            'Expenses',
            style: GoogleFonts.poppins(color: Colors.white, fontSize: 20),
          ),
          Container(
            margin: const EdgeInsets.only(top: 2, bottom: 20),
            width: 175,
            height: 1.2,
            color: Colors.white,
          ),
          Container(
            width: double.infinity,
            height: 72,
            decoration: BoxDecoration(
              color: const Color(0xFF8B8B8B),
              borderRadius: BorderRadius.circular(18),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            height: 72,
            decoration: BoxDecoration(
              color: const Color(0xFF8B8B8B),
              borderRadius: BorderRadius.circular(18),
            ),
          ),
        ],
      ),
    );
  }

  Widget _notesLikeBackground() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 16, 14, 10),
      child: Column(
        children: [
          const SizedBox(height: 70),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFF333333),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  _fakeRow(),
                  _fakeRow(),
                  _fakeRow(),
                  _fakeRow(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _profileLikeBackground() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 16, 8, 10),
      child: Column(
        children: [
          const SizedBox(height: 80),
          Text(
            'Profile',
            style: GoogleFonts.poppins(color: Colors.white, fontSize: 22),
          ),
          const SizedBox(height: 18),
          const CircleAvatar(
            radius: 80,
            backgroundColor: Color(0xFF2E2E2E),
            child: Icon(Icons.person, size: 110, color: Color(0xFFF0F0F0)),
          ),
          const SizedBox(height: 12),
          Text(
            'User Name',
            style: GoogleFonts.poppins(color: Colors.white, fontSize: 24),
          ),
          Text(
            'Email',
            style: GoogleFonts.poppins(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _fakeRow() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      height: 56,
      decoration: BoxDecoration(
        color: const Color(0xFF8D8D8D),
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double panelWidth = MediaQuery.of(context).size.width * 0.78;

    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: buildBottomNav(context, 4),
      body: SafeArea(
        child: Stack(
          children: [
            buildBackgroundContent(),

            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: panelWidth,
                height: double.infinity,
                child: Column(
                  children: [
                    // TOP DESIGN
                    Container(
                      height: 140,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Color(0xFF666666),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(34),
                        ),
                      ),
                    ),

                    // WHITE MENU BODY
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        color: const Color(0xFFE1DFDF),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(16, 34, 16, 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              menuItem(
                                icon: Icons.grid_view_rounded,
                                title: 'Create Categories',
                                showArrow: true,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          const CreateCategoryScreen(),
                                    ),
                                  );
                                },
                              ),
                              menuItem(
                                icon: Icons.add_circle,
                                title: 'Expense Categories',
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          const ExpenseCategoriesScreen(),
                                    ),
                                  );
                                },
                              ),
                              menuItem(
                                icon: Icons.calendar_month_outlined,
                                title: 'Calendar',
                                onTap: () {},
                              ),
                            ],
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
    );
  }
}
