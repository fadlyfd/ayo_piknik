// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_ayo_piknik/core/components/spaces.dart';
import 'package:flutter_ayo_piknik/core/constants/colors.dart';
import 'package:flutter_ayo_piknik/core/extensions/string_ext.dart';
import 'package:flutter_ayo_piknik/presentation/explore/models/ticket_model.dart';

class TicketMenu extends StatelessWidget {
  final TicketModel ticketModel;
  const TicketMenu({
    super.key,
    required this.ticketModel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ticketModel.title,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textBlack,
                ),
              ),
              const SpaceHeight(4),
              Text(
                ticketModel.category,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: Color(
                    0xff667085,
                  ),
                ),
              ),
              const SpaceHeight(16),
              Text(
                ticketModel.price.currencyFormatRpV2,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.orange,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 112,
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(
                      0xffE7EAED,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(
                    4,
                  ),
                ),
                child: Center(
                  child: Container(
                    height: 2,
                    width: 12,
                    decoration: BoxDecoration(
                      color: const Color(
                        0xff3949AB,
                      ),
                      borderRadius: BorderRadius.circular(
                        4,
                      ),
                    ),
                  ),
                ),
              ),
              const Text(
                "1",
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: Color(
                    0xff031222,
                  ),
                ),
              ),
              Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(
                      0xffE7EAED,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(
                    4,
                  ),
                ),
                child: const Center(
                  child: Icon(
                    Icons.add,
                    color: Color(
                      0xff3949AB,
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
