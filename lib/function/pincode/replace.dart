//  import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:flutter/widgets.dart';
// import 'package:note_application/class/awesome_dialog.dart';

// AwesomeDialog replace(
//       {required BuildContext context, required int index}) {
//     return AwesomeDialog(
//       context: context,
//       dialogType: DialogType.warning,
//       desc: 'Do you want REPLACE or REMOVE your password!?',
//       btnOkText: 'REPLACE',
//       btnOkOnPress: () {
//         checkpasswordAwesomeDialog(
//                 context: context,
//                 index: index,
//                 methodType: ""// AwesomeDialogReplaceFunctionIndex.edit,
                
//                 )
//             .show();
//       },
//       btnCancelText: 'REMOVE',
//       btnCancelOnPress: () {
//         checkpasswordAwesomeDialog(
//                 context: context,
//                 index: index,
//                 methodType:"" //AwesomeDialogReplaceFunctionIndex.remove
//                 )
//             .show();
//       },
//     );
//   }

//  AwesomeDialog checkpasswordAwesomeDialog(
//       {required BuildContext context,
//       required int index,
//       required String methodType}) {
//     String? newPassword;
//     return AwesomeDialog(
//       animType: AppAwesomeDialog.animType,
//       headerAnimationLoop: AppAwesomeDialog.headerAnimationLoop,
//       dismissOnTouchOutside: AppAwesomeDialog.dismissOnTouchOutside,
//       showCloseIcon: AppAwesomeDialog.showCloseIcon,
//       dialogType: DialogType.question,
//       // padding: AppAwesomeDialog.padding,
//       context: context,
//       body: Column(
//         children: [
//           const Text(
//             'Your old Password, Please',
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 18,
//             ),
//           ),
//           CustomerUnlockPinCodeTextFileWidget(
//             onCompleted: (value) {
//               debugPrint("Completed");
//               newPassword = value;
//             },
//           ),
//         ],
//       ),
//       btnOkOnPress: () {
//         if (newPassword == null) {
//           Flushbar(
//             duration: AppSnackBar.duration,
//             backgroundGradient: AppSnackBar.backgroundColor,
//             message: 'Filled all fields',
//             messageSize: AppSnackBar.messageSize,
//             flushbarPosition: AppSnackBar.direction,
//             messageColor: AppSnackBar.messageColor,
//           ).show(context);
//         }
//         if (DisplayNoteCubit.dataNote[index].passwordLock != newPassword) {
//           Flushbar(
//             duration: AppSnackBar.duration,
//             backgroundGradient: AppSnackBar.backgroundColor,
//             title: 'Error',
//             message: 'Your password is wrong',
//             messageSize: AppSnackBar.messageSize,
//             flushbarPosition: AppSnackBar.direction,
//             messageColor: AppSnackBar.messageColor,
//           ).show(context);
//         } else {
//           if (methodType == AwesomeDialogReplaceFunctionIndex.edit) {
//             AwesomeDialog(
//               context: context,
//               dialogType: DialogType.warning,
//               desc: 'Are you sure for REPLACE password',
//               btnOkText: 'YES',
//               btnOkOnPress: () {
//                 AppAwesomeDialogFunction.reWriteNewPasswordAwesomeDialogMethod(
//                   context: context,
//                   index: index,
//                 ).show();
//               },
//               btnCancelText: 'NO',
//               btnCancelOnPress: () {},
//             ).show();
//           } else if (methodType == AwesomeDialogReplaceFunctionIndex.remove) {
//             AwesomeDialog(
//               context: context,
//               dialogType: DialogType.warning,
//               desc: 'Are you sure for REMOVE password',
//               btnOkText: 'YES',
//               btnOkOnPress: () {
//                 DisplayNoteCubit.dataNote[index].passwordLock = null;
//                 BlocProvider.of<DisplayNoteCubit>(context).refreshNote();
//                 Navigator.pop(context);
//               },
//               btnCancelText: 'NO',
//               btnCancelOnPress: () {},
//             ).show();
//           }
//         }
//       },
//       btnCancelOnPress: () {},
//     );
//   }