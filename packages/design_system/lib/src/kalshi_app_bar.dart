import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class KalshiAppBar extends StatelessWidget implements PreferredSizeWidget {
  const KalshiAppBar({super.key, this.automaticallyImplyLeading = true});

  final bool automaticallyImplyLeading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: SvgPicture.asset('assets/logo.svg', height: 20),
      centerTitle: true,
      automaticallyImplyLeading: automaticallyImplyLeading,
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
