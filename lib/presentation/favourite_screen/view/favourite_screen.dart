import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/text_styles.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favourites",
          style: GLTextStyles.loraStyle(
              color: ColorConstants.black, size: 18, weight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
    );
  }
}
