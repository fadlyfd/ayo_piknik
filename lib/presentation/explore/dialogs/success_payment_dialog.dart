import 'package:flutter/material.dart';
import 'package:flutter_ayo_piknik/core/assets/assets.gen.dart';
import 'package:flutter_ayo_piknik/core/components/spaces.dart';
import 'package:flutter_ayo_piknik/core/constants/colors.dart';

class SuccessPaymentDialog extends StatelessWidget {
  const SuccessPaymentDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.white,
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            Assets.images.paymentSuccess.path,
            width: 296,
          ),
          const SpaceHeight(8),
          const Text(
            'Pembayaran Anda Telah Sukses',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.textBlack2,
            ),
          ),
          const SpaceHeight(4),
          const Text(
            "Pembayaran Anda telah berhasil kami verifikasi. selamat piknik, liburan asik di ayo piknik",
            style: TextStyle(
              fontSize: 14.0,
              color: AppColors.grey,
            ),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
