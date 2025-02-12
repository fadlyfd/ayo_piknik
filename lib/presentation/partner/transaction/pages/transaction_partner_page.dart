import 'package:flutter/material.dart';
import 'package:flutter_ayo_piknik/core/assets/assets.gen.dart';
import 'package:flutter_ayo_piknik/core/components/spaces.dart';
import 'package:flutter_ayo_piknik/core/constants/colors.dart';
import 'package:flutter_ayo_piknik/core/extensions/build_context_ext.dart';
import 'package:flutter_ayo_piknik/presentation/explore/widgets/card_destination.dart';

import '../../../explore/models/ticket_model.dart';

class TransactionPartnerPage extends StatelessWidget {
  const TransactionPartnerPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<TicketModel> ticketList = [
      TicketModel(
        title: "Taman Mini Indonesia Indah",
        category: "Budaya",
        price: "50000",
        priceDiscount: "45000",
        isSuccess: true,
      ),
      TicketModel(
        title: "Ancol Dreamland",
        category: "Taman Hiburan",
        price: "150000",
        priceDiscount: "130000",
        isSuccess: false,
      ),
      TicketModel(
        title: "Candi Borobudur",
        category: "Sejarah",
        price: "50000",
        priceDiscount: "40000",
        isSuccess: true,
      ),
      TicketModel(
        title: "Kawah Putih Ciwidey",
        category: "Alam",
        price: "25000",
        priceDiscount: "20000",
        isSuccess: true,
      ),
      TicketModel(
        title: "Gunung Bromo",
        category: "Pendakian",
        price: "35000",
        priceDiscount: "30000",
        isSuccess: true,
      ),
      TicketModel(
        title: "Taman Nasional Komodo",
        category: "Alam",
        price: "200000",
        priceDiscount: "180000",
        isSuccess: false,
      ),
      TicketModel(
        title: "Pantai Kuta",
        category: "Pantai",
        price: "10000",
        priceDiscount: "5000",
        isSuccess: false,
      ),
      TicketModel(
        title: "Danau Toba",
        category: "Alam",
        price: "25000",
        priceDiscount: "20000",
        isSuccess: false,
      ),
      TicketModel(
        title: "Tana Toraja",
        category: "Budaya",
        price: "40000",
        priceDiscount: "35000",
        isSuccess: false,
      ),
      TicketModel(
        title: "Labuan Bajo",
        category: "Snorkeling",
        price: "300000",
        priceDiscount: "270000",
        isSuccess: false,
      ),
      TicketModel(
        title: "Taman Safari Indonesia",
        isSuccess: false,
        category: "Hewan",
        price: "200000",
        priceDiscount: "180000",
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.white,
      body: ListView(
        children: [
          SpaceHeight(20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  child: Image.asset(
                    Assets.images.profileImage.path,
                    width: 50.0,
                    height: 50.0,
                    fit: BoxFit.cover,
                  ),
                ),
                SpaceWidth(16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Selamat Datang",
                      style: TextStyle(
                        fontSize: 14.0,
                        color: AppColors.primary,
                      ),
                    ),
                    Text(
                      "Wisata Bahari ID",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Image.asset(
                  Assets.icons.ticketIcon.path,
                  width: 24.0,
                  height: 24.0,
                  fit: BoxFit.cover,
                ),
                SpaceWidth(4),
                GestureDetector(
                  onTap: () {
                    // context.push(TicketPartnerPage());
                  },
                  child: Text(
                    "E-tiket",
                    style: TextStyle(
                      fontSize: 14.0,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SpaceHeight(8),
          Container(
            margin: const EdgeInsets.all(20.0),
            padding: const EdgeInsets.all(20.0),
            width: context.deviceWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: LinearGradient(
                colors: [
                  AppColors.primary.withOpacity(
                    0.6,
                  ),
                  AppColors.primary
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Pendapatan",
                  style: TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white.withOpacity(0.72),
                  ),
                ),
                Text(
                  "Rp. 1.600.000",
                  style: TextStyle(
                    fontSize: 34.0,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
          SpaceHeight(32),
          Divider(
            color: AppColors.lightBackground,
            thickness: 5,
          ),
          SpaceHeight(16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const Row(
              children: [
                Expanded(
                  child: Divider(
                    color: Color(0xffD3E0FE),
                    thickness: 1,
                  ),
                ),
                SpaceWidth(8),
                Text(
                  "Transaksi",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: AppColors.textBlack2,
                  ),
                ),
                SpaceWidth(8),
                Expanded(
                  child: Divider(
                    color: Color(0xffD3E0FE),
                    thickness: 1,
                  ),
                ),
              ],
            ),
          ),
          SpaceHeight(16),
          // ticketList.isEmpty
          //     ? const EmptyTransactionWidget()
          //     : ListView.builder(
          //         itemCount: ticketList.length,
          //         shrinkWrap: true,
          //         physics: const NeverScrollableScrollPhysics(),
          //         itemBuilder: (BuildContext context, int index) {
          //           return CardTransactionPartner(ticket: ticketList[index]);
          //         },
          //       ),
        ],
      ),
    );
  }
}
