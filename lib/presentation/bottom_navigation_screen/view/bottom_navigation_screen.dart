// import 'package:flutter/material.dart';
// import 'package:newsapp_spiderworks/presentation/profile_screen/view/profile_screen.dart';
// import 'package:provider/provider.dart';
// import '../../../core/constants/colors.dart';
// import '../../../core/constants/text_styles.dart';
// import '../../favourite_screen/view/favourite_screen.dart';
// import '../../home_screen/view/home_screen.dart';
// import '../controller/bottom_navigation_controller.dart';

// class BottomNavBar extends StatefulWidget {
//   const BottomNavBar({super.key});

//   @override
//   State<BottomNavBar> createState() => _BottomNavBarState();
// }

// class _BottomNavBarState extends State<BottomNavBar> {
//   @override
//   void initState() {
//     Provider.of<BottomNavigationController>(context, listen: false)
//         .selectedIndex = 0;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.sizeOf(context);
//     return Scaffold(
//       extendBody: true,
//       body: Consumer<BottomNavigationController>(
//         builder: (context, provider, child) {
//           return IndexedStack(
//             index: provider.selectedIndex,
//             children: const [HomeScreen(), FavouriteScreen(), ProfileScreen()],
//           );
//         },
//       ),
//       bottomNavigationBar: Consumer<BottomNavigationController>(
//         builder: (context, controller, _) {
//           return Theme(
//             data: ThemeData(splashColor: Colors.transparent),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 42, vertical: 25),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(42),
//                 child: SizedBox(
//                   height: size.width * .18,
//                   child: BottomNavigationBar(
//                     selectedItemColor: const Color(0xffFF8086),
//                     unselectedItemColor: ColorConstants.grey,
//                     selectedLabelStyle: GLTextStyles.nunitoStyle(
//                         color: ColorConstants.maroon, size: 10),
//                     unselectedLabelStyle: GLTextStyles.nunitoStyle(
//                         color: ColorConstants.grey, size: 10),
//                     backgroundColor: ColorConstants.white,
//                     currentIndex:
//                         Provider.of<BottomNavigationController>(context)
//                             .selectedIndex,
//                     onTap: (index) => setState(() {
//                       controller.selectedIndex = index;
//                     }),
//                     elevation: 0,
//                     items: const [
//                       BottomNavigationBarItem(
//                           icon: Icon(Icons.home_outlined), label: 'Home'),
//                       BottomNavigationBarItem(
//                           icon: Icon(Icons.favorite_outline),
//                           label: 'Favourite'),
//                       BottomNavigationBarItem(
//                           icon: Icon(Icons.perm_identity_sharp),
//                           label: 'Profile'),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
