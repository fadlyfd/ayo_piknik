import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ayo_piknik/core/constants/colors.dart';
import 'package:flutter_ayo_piknik/data/datasources/auth_remote_datasource.dart';
import 'package:flutter_ayo_piknik/data/datasources/event_category_remote_datasource.dart';
import 'package:flutter_ayo_piknik/data/datasources/event_remote_datasource.dart';
import 'package:flutter_ayo_piknik/data/datasources/order_remote_datasource.dart';
import 'package:flutter_ayo_piknik/data/datasources/ticket_remote_datasource.dart';
import 'package:flutter_ayo_piknik/data/datasources/vendor_remote_datasource.dart';
import 'package:flutter_ayo_piknik/data/models/responses/event_response_model.dart';
import 'package:flutter_ayo_piknik/presentation/auth/blocs/login/login_bloc.dart';
import 'package:flutter_ayo_piknik/presentation/auth/blocs/logout/logout_bloc.dart';
import 'package:flutter_ayo_piknik/presentation/auth/blocs/register/register_bloc.dart';
import 'package:flutter_ayo_piknik/presentation/auth/pages/splash_page.dart';
import 'package:flutter_ayo_piknik/presentation/partner/event/blocs/create_event/create_event_bloc.dart';
import 'package:flutter_ayo_piknik/presentation/partner/event/blocs/delete_event/delete_event_bloc.dart';
import 'package:flutter_ayo_piknik/presentation/partner/event/blocs/edit_event/edit_event_bloc.dart';
import 'package:flutter_ayo_piknik/presentation/partner/event/blocs/get_event_user/get_event_user_bloc.dart';
import 'package:flutter_ayo_piknik/presentation/explore/blocs/create_order/create_order_bloc.dart';
import 'package:flutter_ayo_piknik/presentation/explore/blocs/event/event_bloc.dart';
import 'package:flutter_ayo_piknik/presentation/explore/blocs/event_category/event_category_bloc.dart';
import 'package:flutter_ayo_piknik/presentation/order/blocs/get_orders_user/get_orders_user_bloc.dart';
import 'package:flutter_ayo_piknik/presentation/partner/profile_partner/blocs/get_vendor_user/get_vendor_user_bloc.dart';
import 'package:flutter_ayo_piknik/presentation/partner/ticket/blocs/get_ticket_user/get_ticket_user_bloc.dart';
import 'package:flutter_ayo_piknik/presentation/partner/transaction/blocs/get_orders_vendor/get_orders_vendor_bloc.dart';
import 'package:flutter_ayo_piknik/presentation/partner/transaction/blocs/get_total_orders_vendor/get_total_orders_vendor_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.primary,
      statusBarBrightness: Brightness.dark,
    ));
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(AuthRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => LogoutBloc(AuthRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => RegisterBloc(AuthRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => EventBloc(EventRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) =>
              EventCategoryBloc(EventCategoryRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => CreateOrderBloc(OrderRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => GetOrdersUserBloc(OrderRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => GetOrdersVendorBloc(OrderRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) =>
              GetTotalOrdersVendorBloc(OrderRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => GetEventUserBloc(EventRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => CreateEventBloc(EventRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => GetTicketUserBloc(TicketRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => GetVendorUserBloc(VendorRemoteDataSource()),
        ),
        BlocProvider(
          create: (context) => EditEventBloc(EventRemoteDatasource()),
        ),
        BlocProvider(
          create: (context) => DeleteEventBloc(EventRemoteDatasource()),
        ),
      ],
      child: MaterialApp(
        title: 'Ayo Piknik',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
          useMaterial3: true,
          textTheme: GoogleFonts.interTextTheme(
            Theme.of(context).textTheme,
          ),
          appBarTheme: AppBarTheme(
            color: AppColors.white,
            elevation: 0,
            titleTextStyle: GoogleFonts.inter(
              color: AppColors.primary,
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
            iconTheme: const IconThemeData(
              color: AppColors.primary,
            ),
          ),
        ),
        home: const SplashPage(),
      ),
    );
  }
}
