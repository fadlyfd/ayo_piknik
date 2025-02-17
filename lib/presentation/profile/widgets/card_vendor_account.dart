// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_ayo_piknik/core/components/spaces.dart';

import 'package:flutter_ayo_piknik/core/constants/colors.dart';
import 'package:flutter_ayo_piknik/core/extensions/build_context_ext.dart';
import 'package:flutter_ayo_piknik/data/models/responses/event_response_model.dart';
import 'package:flutter_ayo_piknik/presentation/profile/pages/profile_page.dart';

class CardVendorAccount extends StatelessWidget {
  final Vendor vendor;
  const CardVendorAccount({
    Key? key,
    required this.vendor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: context.deviceWidth,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primary),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                vendor.name!,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
              Text(
                vendor.verifyStatus!,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: vendor.verifyStatus == 'approved'
                      ? AppColors.primary
                      : AppColors.orange,
                ),
              ),
            ],
          ),
          SpaceHeight(8),
          Text(
            vendor.location!,
            style: TextStyle(fontSize: 16.0, color: AppColors.black),
          ),
        ],
      ),
    );
  }
}
