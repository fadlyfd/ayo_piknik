// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_ayo_piknik/core/components/spaces.dart';

import 'package:flutter_ayo_piknik/core/constants/colors.dart';
import 'package:flutter_ayo_piknik/core/extensions/build_context_ext.dart';
import 'package:flutter_ayo_piknik/presentation/explore/models/destination_model.dart';

class CardTicketPreview extends StatelessWidget {
  final DestinationModel destination;
  const CardTicketPreview({
    super.key,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.deviceWidth,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    destination.image,
                    width: 65.0,
                    height: 65.0,
                    fit: BoxFit.cover,
                  ),
                ),
                const SpaceWidth(10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        destination.name,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textBlack2,
                        ),
                      ),
                      Text(
                        "${destination.ticktes[0].category}: 1",
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: AppColors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: context.deviceWidth,
            padding: const EdgeInsets.all(16.0),
            decoration: const BoxDecoration(
                color: Color(0xffF2F2F2),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                )),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.info_outline, size: 20, color: AppColors.primary),
                SpaceWidth(8),
                Text(
                  'Valid Pada : 24 Desember 2024',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
