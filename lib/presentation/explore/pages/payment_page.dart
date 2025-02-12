// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_ayo_piknik/core/assets/assets.gen.dart';
import 'package:flutter_ayo_piknik/core/components/buttons.dart';
import 'package:flutter_ayo_piknik/core/components/spaces.dart';

import 'package:flutter_ayo_piknik/core/constants/colors.dart';
import 'package:flutter_ayo_piknik/core/extensions/build_context_ext.dart';
import 'package:flutter_ayo_piknik/presentation/explore/dialogs/success_payment_dialog.dart';
import 'package:flutter_ayo_piknik/presentation/explore/models/payment_option.dart';

class PaymentPage extends StatelessWidget {
  final PaymentOption payment;
  const PaymentPage({
    super.key,
    required this.payment,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.lightBackground,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.white,
            ),
          ),
          backgroundColor: AppColors.primary,
          title: const Text(
            "Pembayaran",
            style: TextStyle(
              color: AppColors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
          actions: const [],
        ),
        bottomNavigationBar: Container(
          height: 92,
          padding: const EdgeInsets.symmetric(
            vertical: 22,
            horizontal: 16,
          ),
          width: context.deviceWidth,
          decoration: const BoxDecoration(
            color: AppColors.white,
          ),
          child: Button.filled(
            textColor: AppColors.white,
            fontSize: 14.0,
            onPressed: () {},
            label: 'Batalkan',
            color: AppColors.red,
          ),
        ),
        body: ListView(
          children: [
            GestureDetector(
              onTap: () async {
                await showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => const SuccessPaymentDialog(),
                );
              },
              child: Container(
                width: context.deviceWidth,
                padding: const EdgeInsets.all(16.0),
                decoration: const BoxDecoration(
                  color: AppColors.white,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          payment.icon,
                          width: 40.0,
                          height: 40.0,
                          fit: BoxFit.cover,
                        ),
                        const SpaceWidth(
                          10,
                        ),
                        Text(
                          payment.name,
                          style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textBlack2),
                        ),
                      ],
                    ),
                    const SpaceHeight(
                      18,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Nomor Virtual Account",
                              style: TextStyle(
                                fontSize: 14.0,
                                color: AppColors.grey,
                              ),
                            ),
                            Text(
                              "1234567891234567",
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textBlack2,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 40,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 8),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1.0,
                              color: const Color(
                                0xffF4F4F5,
                              ),
                            ),
                            borderRadius: BorderRadius.circular(
                              8,
                            ),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                Assets.icons.copy.path,
                                width: 24.0,
                                height: 24.0,
                                fit: BoxFit.cover,
                              ),
                              const SpaceWidth(10),
                              const Text(
                                "Copy",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.primary,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SpaceHeight(2),
            Container(
              width: context.deviceWidth,
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                color: AppColors.white,
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pesanan",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textBlack2,
                    ),
                  ),
                  SpaceHeight(
                    8,
                  ),
                  Text(
                    "[WEEKEND & HIGH SEASON] Tiket Jatim Park 1 + Museum Tubuh",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textBlack2,
                    ),
                  ),
                  SpaceHeight(
                    8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Rp. 113.000",
                        style: TextStyle(
                          fontSize: 12.0,
                          color: AppColors.textBlack2,
                        ),
                      ),
                      Text(
                        "1x",
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textBlack2,
                        ),
                      ),
                    ],
                  ),
                  SpaceHeight(8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textBlack2,
                        ),
                      ),
                      Text(
                        "Rp 113.000",
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textBlack2,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
