import 'package:flutter/material.dart';
import 'package:washee/core/ui/widgets/dialog_box_Ok.dart';

import '../../../../core/ui/navigation/home_screen.dart';
import '../../../../core/ui/navigation/pages_enum.dart';

class BookingSuccessDialog extends StatelessWidget {
  const BookingSuccessDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
          child: DialogBoxOk(
              boxMessage: "Du har nu booket en maskine",
              navigate: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(
                      page: PageNumber.WasheeScreen,
                    ),
                  ),
                );
              })),
    );
  }
}
