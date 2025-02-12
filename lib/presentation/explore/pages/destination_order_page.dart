// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_ayo_piknik/core/components/buttons.dart';
import 'package:flutter_ayo_piknik/core/components/spaces.dart';
import 'package:flutter_ayo_piknik/core/constants/colors.dart';
import 'package:flutter_ayo_piknik/core/extensions/build_context_ext.dart';
import 'package:flutter_ayo_piknik/presentation/explore/models/destination_model.dart';
import 'package:flutter_ayo_piknik/presentation/explore/pages/order_preview_page.dart';
import 'package:flutter_ayo_piknik/presentation/explore/widgets/calender_item_widget.dart';
import 'package:flutter_ayo_piknik/presentation/explore/widgets/dashedline.dart';
import 'package:flutter_ayo_piknik/presentation/explore/widgets/ticket_menu.dart';

class DestinationOrder extends StatefulWidget {
  final String ticket;
  final DestinationModel destination;
  const DestinationOrder({
    super.key,
    required this.ticket,
    required this.destination,
  });

  @override
  State<DestinationOrder> createState() => _DestinationOrderState();
}

class _DestinationOrderState extends State<DestinationOrder> {
  final DateTime today = DateTime.now();

  late List<DateTime> dates;
  int activeIndex = 1;
  @override
  void initState() {
    super.initState();
    dates = List.generate(7, (index) => today.add(Duration(days: index)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "Tambah Jumlah Pengunjung",
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
        height: 180,
        padding: const EdgeInsets.all(
          16,
        ),
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: AppColors.white,
          border: Border(
            top: BorderSide(
              color: Color(
                0xffF6F6F6,
              ),
              width: 1,
            ),
          ),
        ),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Harga Total',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textBlack,
                      ),
                    ),
                    Text(
                      'Sudah termasuk pajak',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.disable,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Rp. 120.000',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: AppColors.orange,
                  ),
                ),
              ],
            ),
            const SpaceHeight(12),
            const DashedLine(),
            const SpaceHeight(28),
            Button.filled(
              label: "✦ Pesan Sekarang ✦",
              onPressed: () {
                context.push(OrderPreviewPage(
                  destination: widget.destination,
                ));
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            width: context.deviceWidth,
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border(
                bottom: BorderSide(
                  color: const Color(0xff000000).withOpacity(0.2),
                  width: 0.5,
                ),
              ),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    widget.destination.image,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                const SpaceWidth(
                  20,
                ),
                Expanded(
                  child: Text(
                    widget.ticket,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textBlack,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SpaceHeight(16),
          SizedBox(
            width: context.deviceWidth,
            height: 88,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: dates.length,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (BuildContext context, int index) {
                return const SpaceWidth(12);
              },
              itemBuilder: (BuildContext context, int index) {
                final date = dates[index];
                final bool isToday = date.day == today.day &&
                    date.month == today.month &&
                    date.year == today.year;

                return CalendarItemWidget(
                  isToday: isToday,
                  isOutlined: true,
                  date: date,
                  isActive: activeIndex == index,
                  onTap: () {
                    setState(() {
                      activeIndex = index; // Ubah indeks aktif
                    });
                  },
                );
              },
            ),
          ),
          const SpaceHeight(16),
          const Center(
            child: Text(
              "Voucer bisa dipakai pada",
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SpaceHeight(8),
          const Center(
            child: Text(
              "Kamis, 19 Desember 2024",
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
                color: AppColors.textBlack,
              ),
            ),
          ),
          const SpaceHeight(
            16,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 20,
            ),
            width: context.deviceWidth,
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border(
                bottom: BorderSide(
                  color: const Color(0xff000000).withOpacity(0.2),
                  width: 0.5,
                ),
                top: BorderSide(
                  color: const Color(0xff000000).withOpacity(0.2),
                  width: 0.5,
                ),
              ),
            ),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.destination.ticktes.length,
              separatorBuilder: (BuildContext context, int index) {
                return const SpaceHeight(
                  16,
                );
              },
              itemBuilder: (BuildContext context, int index) {
                return TicketMenu(
                  ticketModel: widget.destination.ticktes[index],
                );
              },
            ),
          ),
          const SpaceHeight(
            52,
          )
        ],
      ),
    );
  }
}
