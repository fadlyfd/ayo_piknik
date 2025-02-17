import 'package:flutter/material.dart';
import 'package:flutter_ayo_piknik/core/assets/assets.gen.dart';
import 'package:flutter_ayo_piknik/core/components/buttons.dart';
import 'package:flutter_ayo_piknik/core/components/custom_text_field.dart';
import 'package:flutter_ayo_piknik/core/components/image_picker_widget.dart';
import 'package:flutter_ayo_piknik/core/components/loading_indicator.dart';
import 'package:flutter_ayo_piknik/core/components/spaces.dart';
import 'package:flutter_ayo_piknik/core/constants/colors.dart';
import 'package:flutter_ayo_piknik/data/models/responses/event_category_response_model.dart';
import 'package:flutter_ayo_piknik/presentation/explore/blocs/event_category/event_category_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTicketPage extends StatefulWidget {
  const AddTicketPage({super.key});

  @override
  State<AddTicketPage> createState() => _AddTicketPageState();
}

class _AddTicketPageState extends State<AddTicketPage> {
  TextEditingController? nameTicketController;
  TextEditingController? priceController;
  TextEditingController? quotaController;
  EventCategoryModel? selectEventCategory;
  String? selectedStatus;

  @override
  void initState() {
    nameTicketController = TextEditingController();
    priceController = TextEditingController();
    quotaController = TextEditingController();
    context
        .read<EventCategoryBloc>()
        .add(const EventCategoryEvent.getEventCategories());
    super.initState();
  }

  @override
  void dispose() {
    nameTicketController?.dispose();
    priceController?.dispose();
    quotaController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
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
            "Tambah Tiket",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: AppColors.white,
            ),
          ),
          centerTitle: true,
          actions: const [],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Button.filled(
            onPressed: () {},
            label: 'Simpan',
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(20.0),
          children: [
            CustomTextField(
              prefixIcon: Image.asset(
                Assets.icons.ticket.path,
                width: 10.0,
                height: 10.0,
              ),
              borderColor: AppColors.grey,
              showLabel: true,
              controller: nameTicketController!,
              label: 'Nama Tiket',
            ),
            const SpaceHeight(
              16,
            ),
            const Text(
              "Kategori Event",
              style: TextStyle(
                fontSize: 12,
                color: AppColors.textBlack2,
              ),
            ),
            const SpaceHeight(6.0),
            BlocBuilder<EventCategoryBloc, EventCategoryState>(
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () {
                    return const SizedBox.shrink();
                  },
                  loading: () {
                    return const LoadingIndicator();
                  },
                  success: (data) {
                    return DropdownButtonFormField<EventCategoryModel>(
                      decoration: InputDecoration(
                        prefixIcon: Container(
                          padding: const EdgeInsets.all(12),
                          child: Image.asset(
                            Assets.icons.a3dRotate.path,
                            width: 10.0,
                            height: 10.0,
                          ),
                        ),
                        // suffixIcon: const Icon(Icons.keyboard_arrow_down,
                        //     color: AppColors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                      ),
                      hint: const Text(
                        'Select Type',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.textBlack2,
                        ),
                      ),
                      value: selectEventCategory,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.textBlack2,
                      ),
                      onChanged: (newValue) {
                        setState(() {
                          selectEventCategory = newValue;
                        });
                      },
                      items: data.data!.map((EventCategoryModel option) {
                        return DropdownMenuItem<EventCategoryModel>(
                          value: option,
                          child: Text(option.name!),
                        );
                      }).toList(),
                    );
                  },
                );
              },
            ),
            const SpaceHeight(
              16,
            ),
            const Text(
              "Status",
              style: TextStyle(
                fontSize: 12,
                color: AppColors.textBlack2,
              ),
            ),
            const SpaceHeight(6.0),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                prefixIcon: Container(
                  padding: const EdgeInsets.all(12),
                  child: Image.asset(
                    Assets.icons.a3dRotate.path,
                    width: 10.0,
                    height: 10.0,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              ),
              hint: const Text(
                'Select Status',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              value: selectedStatus, // nilai yang dipilih
              onChanged: (newValue) {
                setState(() {
                  selectedStatus = newValue;
                });
              },
              items: ['Aktif', 'Tidak Aktif'].map((String option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: Text(option),
                );
              }).toList(),
            ),
            SpaceHeight(16),
            CustomTextField(
              prefixIcon: Image.asset(
                Assets.icons.moneys.path,
                width: 10.0,
                height: 10.0,
              ),
              borderColor: AppColors.grey,
              showLabel: true,
              controller: priceController!,
              label: 'Harga (Rp)',
            ),
            const SpaceHeight(
              16,
            ),
            CustomTextField(
              prefixIcon: Image.asset(
                Assets.icons.repeatCircle.path,
                width: 10.0,
                height: 10.0,
              ),
              borderColor: AppColors.grey,
              showLabel: true,
              controller: quotaController!,
              label: 'Kuota Tiket',
            ),
            const SpaceHeight(
              16,
            ),
          ],
        ));
  }
}
