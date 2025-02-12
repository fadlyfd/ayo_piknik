import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ayo_piknik/core/assets/assets.gen.dart';
import 'package:flutter_ayo_piknik/core/constants/colors.dart';
import 'package:flutter_ayo_piknik/core/extensions/build_context_ext.dart';
import 'package:flutter_ayo_piknik/presentation/explore/models/destination_model.dart';
import 'package:flutter_ayo_piknik/presentation/explore/widgets/all_widget.dart';
import 'package:flutter_ayo_piknik/presentation/explore/widgets/custom_tab.dart';

import '../../../core/components/spaces.dart';
import '../models/ticket_model.dart';
import '../widgets/card_destination.dart';

class ExplorePage extends StatefulWidget {
  ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final List<DestinationModel> voucherDestinations = [
    DestinationModel(
      name: "Water Splash Day Pass",
      image: Assets.images.waterSplash.path,
      price: "150000",
      priceDiscount: "",
      location: "Bandung",
      review: "8.8/10",
      ticktes: [
        TicketModel(
          title: "Full Day Access",
          category: "Dewasa",
          price: "150000",
          priceDiscount: "200000",
        ),
        TicketModel(
          title: "Full Day Access",
          category: "Anak",
          price: "100000",
          priceDiscount: "150000",
        ),
        TicketModel(
          title: "Full Day Access",
          category: "Pelajar/Mahasiswa",
          price: "120000",
          priceDiscount: "160000",
        ),
      ],
    ),
    DestinationModel(
      name: "Adventure Park Yogyakarta",
      image: Assets.images.adventure.path,
      price: "120000", // Harga tiket dewasa tanpa diskon
      priceDiscount: "150000", // Harga asli sebelum diskon
      location:
          "Hutan Pinus Kawasan Wisata Kaliurang, Kab Sleman, DI Yogyakarta",
      review: "4.5/5", // Rating lebih umum dalam sistem berbasis bintang
      ticktes: [
        TicketModel(
          title: "Adventure Park - Full Day Pass (Dewasa)",
          category: "Dewasa",
          price: "120000", // Harga tiket dewasa
          priceDiscount: "150000", // Harga asli dewasa sebelum diskon
        ),
        TicketModel(
          title: "Adventure Park - Full Day Pass (Pelajar)",
          category: "Pelajar/Mahasiswa (dengan Kartu Pelajar)",
          price: "100000", // Harga tiket pelajar
          priceDiscount: "130000", // Harga asli pelajar sebelum diskon
        ),
        TicketModel(
          title: "Adventure Park - Full Day Pass (Anak)",
          category: "Anak-anak (di bawah 12 tahun)",
          price: "80000", // Harga tiket anak
          priceDiscount: "100000", // Harga asli anak sebelum diskon
        ),
      ],
    ),
    DestinationModel(
      name: "Jungle Explore Ticket",
      image: Assets.images.jungleExploler.path,
      price: "50000",
      priceDiscount: "70000",
      location: "Malang",
      review: "8.8/10",
      ticktes: [
        TicketModel(
          title: "Explorer Pass",
          category: "Dewasa",
          price: "50000",
          priceDiscount: "70000",
        ),
        TicketModel(
          title: "Explorer Pass",
          category: "Anak",
          price: "35000",
          priceDiscount: "50000",
        ),
        TicketModel(
          title: "Explorer Pass",
          category: "Pelajar/Mahasiswa",
          price: "40000",
          priceDiscount: "60000",
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.primary,
      statusBarBrightness: Brightness.dark,
    ));
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 18),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Image.asset(
                      Assets.images.banner1.path,
                      width: context.deviceWidth,
                      fit: BoxFit.contain,
                    ),
                    Positioned(
                      top: context.deviceHeight * 0.22,
                      left: 16.0,
                      right: 16.0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 0),
                        decoration: BoxDecoration(
                          color: AppColors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 4),
                              blurRadius: 10.0,
                              color: Colors.black.withAlpha(25),
                            ),
                          ],
                        ),
                        height: 44,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
                              // color: Color(0xff9CA3AF),
                              color: AppColors.textBlack2,
                            ),
                            hintText: "Tiket Wisata",
                            hintStyle: TextStyle(
                              fontSize: 12.0,
                              // color: Color(0xffD1D5DB),
                              color: AppColors.textBlack2,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
          body: Column(
            children: [
              Container(
                color: AppColors.white,
                child: Builder(
                  builder: (context) {
                    final TabController controller =
                        DefaultTabController.of(context);

                    return AnimatedBuilder(
                      animation: controller,
                      builder: (context, _) {
                        return TabBar(
                          indicatorColor: AppColors.primary,
                          labelColor: AppColors.primary,
                          unselectedLabelColor: AppColors.disable,
                          tabs: [
                            CustomTab(
                              iconPath: Assets.icons.all.path,
                              isSelected: controller.index == 0,
                              label: "Semua",
                            ),
                            CustomTab(
                              iconPath: Assets.icons.beach.path,
                              isSelected: controller.index == 1,
                              label: "Pantai",
                            ),
                            CustomTab(
                              iconPath: Assets.icons.mountain.path,
                              isSelected: controller.index == 2,
                              label: "Atraksi",
                            ),
                            CustomTab(
                              iconPath: Assets.icons.games.path,
                              isSelected: controller.index == 3,
                              label: "Games",
                            ),
                            CustomTab(
                              iconPath: Assets.icons.culture.path,
                              isSelected: controller.index == 4,
                              label: "Budaya",
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    ListView(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Aktivitas Populer",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                  color: Color(
                                    0xff4B5563,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.chevron_right_outlined,
                                color: Color(
                                  0xff292D32,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(16.0),
                          height: 260,
                          child: ListView.separated(
                            itemCount: 3,
                            scrollDirection: Axis.horizontal,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SpaceWidth(16);
                            },
                            itemBuilder: (BuildContext context, int index) {
                              return CardDestination(
                                destination: voucherDestinations[index],
                              );
                            },
                          ),
                        ),
                        const SpaceHeight(10),
                        Stack(
                          children: [
                            Container(
                              height: 160,
                              width: context.deviceWidth,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    AppColors.primary,
                                    AppColors.white,
                                  ],
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                "Voucher bermain di Ayo Piknik",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                  color: Color(
                                    0xff4B5563,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 40),
                              height: 260,
                              padding: const EdgeInsets.all(16.0),
                              width: context.deviceWidth,
                              child: ListView.separated(
                                itemCount: 4,
                                scrollDirection: Axis.horizontal,
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return const SpaceWidth(16);
                                },
                                itemBuilder: (BuildContext context, int index) {
                                  return CardDestination(
                                    destination: voucherDestinations[index],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        const SpaceHeight(10),
                        Stack(
                          children: [
                            Container(
                              height: 160,
                              width: context.deviceWidth,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    AppColors.white,
                                    AppColors.primary,
                                    AppColors.white,
                                  ],
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                "Rekomendasi dari Ayo Piknik",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                  color: Color(
                                    0xff4B5563,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 40),
                              height: 260,
                              padding: const EdgeInsets.all(16.0),
                              width: context.deviceWidth,
                              child: ListView.separated(
                                itemCount: 3,
                                scrollDirection: Axis.horizontal,
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return const SpaceWidth(16);
                                },
                                itemBuilder: (BuildContext context, int index) {
                                  return CardDestination(
                                    destination: voucherDestinations[index],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
