import 'package:another_flushbar/flushbar.dart';
import 'package:note_application/class/app_snack_bar.dart';

Flushbar flashBar({
  required String title,
  required String message,
}) {
  return Flushbar(
    duration: AppSnackBar.duration,
    backgroundGradient: AppSnackBar.backgroundColor,
    title: title,
    message: message,
    messageSize: AppSnackBar.messageSize,
    flushbarPosition: AppSnackBar.direction,
    messageColor: AppSnackBar.messageColor,
  );
}
