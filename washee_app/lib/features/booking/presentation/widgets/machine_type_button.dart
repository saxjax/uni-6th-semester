import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:washee/features/electricity/data/datasources/green_score_database.dart';
import 'package:washee/features/location/presentation/pages/machine_enum.dart';
import 'package:washee/features/booking/data/models/booking_model.dart';

import '../../../../core/ui/themes/colors.dart';
import '../../../../core/ui/themes/dimens.dart';
import 'choose_time_view.dart';

class MachineTypeButton extends StatelessWidget {
  final int machineType;
  final List<BookingModel> bookingsForDay;
  final DateTime currentDate;

  MachineTypeButton(
      {required this.machineType,
      required this.bookingsForDay,
      required this.currentDate});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await showDialog(
          context: context,
          builder: (BuildContext context) {
            return ChooseTimeView(
              machineType: machineType,
              bookingsForDate: bookingsForDay,
              currentDate: currentDate,
            );
          },
        );
      },
      child: Container(
        height: 84.h,
        width: 279.81.w,
        decoration: BoxDecoration(
          color: AppColors.dialogLightGray,
          borderRadius: BorderRadius.circular(20.w),
          border: Border.all(
            color: Colors.white,
            width: 1.w,
          ),
        ),
        child: Center(
          child: Text(
            machineType == MachineType.Dryer ? "Tørretumbler" : "Vaskemaskine",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: textSize_32,
            ),
          ),
        ),
      ),
    );
  }
}
