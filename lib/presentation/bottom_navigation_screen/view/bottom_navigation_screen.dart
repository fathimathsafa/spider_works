import 'package:flutter/material.dart';
import 'package:news_spider/presentation/profile_screen/profile_screen.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/text_styles.dart';
import '../../favourite_screen/view/favourite_screen.dart';
import '../../home_screen/view/home_screen.dart';
import '../controller/bottom_navigation_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  void initState() {
    super.initState();
    // ✅ Post-frame callback to avoid build phase mutation error
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<BottomNavigationController>(context, listen: false).selectedIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Consumer<BottomNavigationController>(
        builder: (context, provider, child) {
          return IndexedStack(
            index: provider.selectedIndex,
            children: const [HomeScreen(), FavouriteScreen(), ProfileScreen()],
          );
        },
      ),
      bottomNavigationBar: Consumer<BottomNavigationController>(
        builder: (context, controller, _) {
          return Theme(
            data: ThemeData(splashColor: Colors.transparent),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 42.w, vertical: 25.h),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(42.r),
                child: SizedBox(
                  height: 0.115.sh,
                  child: BottomNavigationBar(
                    selectedItemColor: const Color(0xffFF8086),
                    unselectedItemColor: ColorConstants.grey,
                    selectedLabelStyle: GLTextStyles.nunitoStyle(
                        color: ColorConstants.maroon, size: 10.sp),
                    unselectedLabelStyle: GLTextStyles.nunitoStyle(
                        color: ColorConstants.grey, size: 10.sp),
                    backgroundColor: ColorConstants.white,
                    currentIndex: controller.selectedIndex,
                    onTap: (index) {
                      controller.selectedIndex = index;
                    },
                    elevation: 0,
                    items: const [
                      BottomNavigationBarItem(
                          icon: Icon(Icons.home_outlined), label: 'Home'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.favorite_outline), label: 'Favourite'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.perm_identity_sharp), label: 'Profile'),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
