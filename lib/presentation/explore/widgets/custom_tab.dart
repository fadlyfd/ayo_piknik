import 'package:flutter/material.dart';
import 'package:flutter_ayo_piknik/core/constants/colors.dart';
import 'package:flutter_svg/svg.dart';

class CustomTab extends StatelessWidget {
  final String iconPath;
  final String label;
  final bool isSelected;

  const CustomTab({
    super.key,
    required this.iconPath,
    required this.label,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      icon: SvgPicture.asset(
        iconPath,
        colorFilter: ColorFilter.mode(
          isSelected ? AppColors.primary : AppColors.disable,
          BlendMode.srcIn,
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 10.0, // Ganti dengan ukuran yang diinginkan
        ),
      ),
    );
  }
}
