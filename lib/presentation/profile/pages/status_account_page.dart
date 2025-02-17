import 'package:flutter/material.dart';
import 'package:flutter_ayo_piknik/core/assets/assets.gen.dart';
import 'package:flutter_ayo_piknik/core/components/buttons.dart';
import 'package:flutter_ayo_piknik/core/components/spaces.dart';
import 'package:flutter_ayo_piknik/core/constants/colors.dart';
import 'package:flutter_ayo_piknik/core/extensions/build_context_ext.dart';

class StatusAccountPage extends StatelessWidget {
  const StatusAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Status Akun",
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            color: AppColors.white,
          ),
        ),
        centerTitle: true,
        actions: const [],
      ),
      body: Container(
        height: context.deviceHeight / 2,
        padding: const EdgeInsets.all(16.0),
        width: context.deviceWidth,
        decoration: const BoxDecoration(
          color: AppColors.white,
        ),
        child: Column(children: [
          Image.asset(
            Assets.images.statusAccount.path,
            height: 194.0,
            fit: BoxFit.cover,
          ),
          const SpaceHeight(16),
          const Text(
            "Proses Verifikasi Sedang Berjalan!",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: Color(
                0xff2E3139,
              ),
            ),
          ),
          const SpaceHeight(16),
          const Text(
            "Tim kami sedang memeriksa data Anda. Mohon tunggu sebentar, kami akan segera mengaktifkan akun Anda untuk mulai bergabung dengan Ayo Piknik.",
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
              color: Color(
                0xffB2B2B2,
              ),
            ),
            textAlign: TextAlign.center,
          ),
          const SpaceHeight(16),
          Button.filled(
              height: 48, fontSize: 15.0, onPressed: () {}, label: 'Mengerti')
        ]),
      ),
    );
  }
}
