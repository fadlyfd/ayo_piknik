import 'package:flutter/material.dart';
import 'package:flutter_ayo_piknik/core/constants/colors.dart';
import 'package:flutter_ayo_piknik/presentation/save/widgets/card_save_order.dart';

class SaveOrderPage extends StatelessWidget {
  const SaveOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.lightBackground,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.primary,
          leading: const SizedBox.shrink(),
          title: const Text(
            "Daftar Simpan",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              color: AppColors.white,
            ),
          ),
          actions: const [],
        ),
        body: ListView(
          children: const [
            CardSaveOrder(),
          ],
        ));
  }
}
