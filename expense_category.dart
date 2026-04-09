import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home.dart';
import 'wallet.dart';
import 'notes.dart';
import 'profile.dart';
import 'more.dart';
import 'notifications.dart';

class ExpenseCategoriesScreen extends StatelessWidget {
  const ExpenseCategoriesScreen({super.key});

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

  Widget safeCategoryImage(String? imagePath) {
    if (imagePath == null) {
      return Container(
        width: 54,
        height: 54,
        alignment: Alignment.center,
        child: const Icon(
          Icons.category_outlined,
          color: Colors.white54,
          size: 32,
        ),
      );
    }

    return Image.asset(
      imagePath,
      width: 54,
      height: 54,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) {
        return const SizedBox(
          width: 54,
          height: 54,
          child: Icon(Icons.image_outlined, color: Colors.white54, size: 30),
        );
      },
    );
  }

  Widget categoryTile({required String title, String? imagePath}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF666666),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          safeCategoryImage(imagePath),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(color: Colors.white, fontSize: 18),
            ),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.chevron_right, color: Colors.black, size: 36),
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
          padding: const EdgeInsets.fromLTRB(12, 16, 12, 10),
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

              const SizedBox(height: 22),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 18),
                decoration: BoxDecoration(
                  color: const Color(0xFF5D5D5D),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Center(
                  child: Text(
                    'Expense Categories',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: const Color(0xFF333333),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: ListView(
                    children: [
                      const SizedBox(height: 6),
                      categoryTile(
                        title: 'Food',
                        imagePath: 'assets/images/food.png',
                      ),
                      categoryTile(
                        title: 'Transportation',
                        imagePath: 'assets/images/transport.png',
                      ),
                      categoryTile(
                        title: 'School Supplies',
                        imagePath: 'assets/images/school_supplies.png',
                      ),
                      categoryTile(
                        title: 'Personal',
                        imagePath: 'assets/images/personal.png',
                      ),
                      categoryTile(title: 'Others'),
                      const SizedBox(height: 12),
                      Center(
                        child: SizedBox(
                          width: 220,
                          height: 48,
                          child: ElevatedButton(
                            onPressed: () => Navigator.pop(context),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFD0D0D0),
                              foregroundColor: Colors.black,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            child: Text(
                              'Cancel',
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
