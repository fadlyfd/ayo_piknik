import 'package:flutter/material.dart';
import 'package:flutter_ayo_piknik/core/assets/assets.gen.dart';
import 'package:flutter_ayo_piknik/core/components/spaces.dart';
import 'package:flutter_ayo_piknik/core/constants/colors.dart';
import 'package:flutter_ayo_piknik/core/extensions/build_context_ext.dart';
import 'package:flutter_ayo_piknik/presentation/partner/event/pages/event_managemnet_page.dart';
import 'package:flutter_ayo_piknik/presentation/partner/ticket/pages/ticket_partner_page.dart';
import 'package:flutter_ayo_piknik/presentation/profile/pages/status_account_page.dart';

class DashboardPartnerPage extends StatelessWidget {
  const DashboardPartnerPage({super.key});

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
          "Ticket Status",
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            color: AppColors.white,
          ),
        ),
        centerTitle: true,
        actions: const [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Row(
          children: [
            Expanded(
                child: _item(context, Assets.icons.eventManagement.path,
                    "Event Management", () {
              context.push(const EventManagemnetPage());
            })),
            const SpaceWidth(16),
            Expanded(
                child: _item(context, Assets.icons.ticketExpired.path,
                    "Ticket Management", () {
              context.push(const TicketPartnerPage());
            })),
          ],
        ),
      ),
    );
  }

  Widget _item(
    BuildContext context,
    String icon,
    String title,
    Function()? onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 154,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: const [
            BoxShadow(
              color: Color(0xff00000005),
              blurRadius: 5.5,
              offset: Offset(0, 3.5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              width: 70.0,
              height: 70.0,
              fit: BoxFit.cover,
            ),
            const SpaceHeight(10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
