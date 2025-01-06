// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class CustomerShowSheetWidget extends StatelessWidget {
//   const CustomerShowSheetWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<AddHomeCategoryCubit, AddHomeCategoryState>(
//       builder: ((context, state) {
//         if (state is StateAddHomeCategoryLoading) {
//           return const AbsorbPointer(
//             absorbing: true,
//             child: BodyCustomerAddCategoryShowSheetWidget(),
//           );
//         } else {
//           return const BodyCustomerAddCategoryShowSheetWidget();
//         }
//       }),
//       listener: ((context, state) {
//         if (state is StateAddHomeCategorySuccessful) {
//           BlocProvider.of<DisplayHomeCategoryCubit>(context).refreshCategory();
//           Navigator.pop(context);
//         } else if (state is StateAddHomeCategoryFailed) {
//           Navigator.pop(context);
//           debugPrint('Error ${state.errorMessage}');
//           FlushBarFunction.flushbarFunction(
//             context: context,
//             title: 'Error',
//             message: state.errorMessage.tr(context),
//           );
//         }
//       }),
//     );
//   }
// }