import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:washee/core/errors/booking_error_prompt.dart';
import 'package:washee/core/errors/error_handler.dart';
import 'package:washee/features/booking/presentation/provider/calendar_provider.dart';

import '../../../../core/presentation/themes/colors.dart';
import '../../../../core/presentation/themes/dimens.dart';
import '../../../../core/presentation/themes/themes.dart';

class TimeSlotItem extends StatefulWidget {
  final DateTime time;
  final bool isAvailable;
  final bool isOutdated;

  TimeSlotItem(
      {required this.time,
      required this.isAvailable,
      required this.isOutdated});

  @override
  State<TimeSlotItem> createState() => _TimeSlotItemState();
}

class _TimeSlotItemState extends State<TimeSlotItem>
    with AutomaticKeepAliveClientMixin {
  String _formatHoursAndMinutes(DateTime time) {
    String formatted = "";
    if (time.hour < 9) {
      formatted += "0" + time.hour.toString();
    } else {
      formatted += time.hour.toString();
    }

    if (time.minute != 30) {
      formatted += ":" + "0" + time.minute.toString();
    } else {
      formatted += ":" + time.minute.toString();
    }
    return formatted;
  }

  bool _selected = false;

  String _determineAvailabilityOrOutdated() {
    if (widget.isAvailable && widget.isOutdated) {
      return _formatHoursAndMinutes(widget.time) + "       udløbet";
    } else if (widget.isAvailable && !widget.isOutdated) {
      return _formatHoursAndMinutes(widget.time);
    } else {
      return _formatHoursAndMinutes(widget.time) + "       optaget";
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var calendar = Provider.of<CalendarProvider>(context, listen: false);
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: Container(
        width: 770.w,
        height: 80.h,
        decoration: BoxDecoration(
          color: _selected ? AppColors.deepGreen : AppColors.sportItemGray,
          borderRadius: BorderRadius.circular(20.w),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: InkWell(
                onTap: () {},
                child: Text(
                  _determineAvailabilityOrOutdated(),
                  style: textStyle.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: textSize_32,
                    color: !widget.isAvailable
                        ? AppColors.red
                        : widget.isOutdated
                            ? AppColors.backupGrey
                            : Colors.white,
                  ),
                ),
              ),
            ),
            _determineAvailableOrOutdated(context, calendar),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  Widget _determineAvailableOrOutdated(
      BuildContext context, CalendarProvider calendar) {
    if (widget.isAvailable && widget.isOutdated) {
      return SizedBox.shrink();
    } else {
      return IconButton(
          onPressed: () async {
            if (!widget.isAvailable) {
              ErrorHandler.errorHandlerView(
                  context: context,
                  prompt:
                      BookingErrorPrompt(message: "Tidspunktet er optaget!"));
            } else if (widget.isOutdated) {
              ErrorHandler.errorHandlerView(
                  context: context,
                  prompt:
                      BookingErrorPrompt(message: "Tidspunktet er udløbet!"));
            } else if (_selected == false) {
              calendar.addTimeSlot(widget.time);
            } else {
              calendar.removeTimeSlot(widget.time);
            }
            setState(() {
              _selected = !_selected;
            });
          },
          icon: widget.isAvailable
              ? Icon(
                  _selected ? Icons.check_box : Icons.check_box_outline_blank,
                  color: _selected ? AppColors.activeTrackGreen : Colors.white,
                  size: iconSize_44,
                )
              : Icon(
                  Icons.not_interested_outlined,
                  color: AppColors.red,
                ));
    }
  }
}
