
// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:note_application/cubit/auth/auth_login_cubit.dart';
// import 'package:note_application/cubit/auth/auth_signup_cubit.dart';
// import 'package:note_application/cubit/category/add_category/add_category_cubit.dart';
// import 'package:note_application/cubit/category/category_center/category_center_cubit.dart';
// import 'package:note_application/cubit/category/edit_category/edit_category_cubit.dart';
// import 'package:note_application/cubit/change_date/change_date_cubit.dart';
// import 'package:note_application/cubit/category/category_choose_image/category_choose_image_cubit.dart';
// import 'package:note_application/cubit/data_center/data_center_cubit.dart';
// import 'package:note_application/cubit/note/add_note/add_note_cubit.dart';
// import 'package:note_application/cubit/note/delete_note/delete_note_cubit.dart';
// import 'package:note_application/cubit/note/note_choose_image/note_choose_image_cubit.dart';
// import 'package:note_application/cubit/password/password_cubit.dart';
// import 'package:note_application/screen/note/edit_note/edit_note_cubit.dart';
// class MyWidget extends StatelessWidget {
//   const MyWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//      List<SingleChildWidget> providers = [
//   BlocProvider(create: (context) => PasswordCubit()),
//   BlocProvider(create: (context) => EditNoteCubit()),
//   BlocProvider(create: (context) => DeleteNoteCubit()),
//   BlocProvider(create: (context) => AddNoteCubit()),
//   BlocProvider(create: (context) => NoteChooseImageCubit()),
//   // BlocProvider(create: (context) => DeleteCategoryCubit()),
//   BlocProvider(create: (context) => ChangeDateCubit()),
//   BlocProvider(create: (context) => EditCategoryCubit()),
//   BlocProvider(create: (context) => AddCategoryCubit()),
//   BlocProvider(create: (context) => CategoryChooseImageCubit()),
//   BlocProvider(create: (context) => CategoryCenterCubit()),
//   BlocProvider(create: (context) => DataCenterCubit()..postAppData()),
//   BlocProvider(create: (context) => AuthLoginCubit()),
//   BlocProvider(create: (context) => AuthSignupCubit()),
// ];
//     return const Placeholder();
//   }
// }
// List<SingleChildWidget> providers(BuildContext context) {
//     return  [
//       BlocProvider(create: (context) => PasswordCubit()),
//       BlocProvider(create: (context) => EditNoteCubit()),
//       BlocProvider(create: (context) => DeleteNoteCubit()),
//       BlocProvider(create: (context) => AddNoteCubit()),
//       BlocProvider(create: (context) => NoteChooseImageCubit()),
//       // BlocProvider(create: (context) => DeleteCategoryCubit()),
//       BlocProvider(create: (context) => ChangeDateCubit()),
//       BlocProvider(create: (context) => EditCategoryCubit()),
//       BlocProvider(create: (context) => AddCategoryCubit()),
//       BlocProvider(create: (context) => CategoryChooseImageCubit()),
//       BlocProvider(create: (context) => CategoryCenterCubit()),
//       BlocProvider(create: (context) => DataCenterCubit()..postAppData()),
//       BlocProvider(create: (context) => AuthLoginCubit()),
//       BlocProvider(create: (context) => AuthSignupCubit()),
//     ];
//   }

// List<BlocProvider<StateStreamableSource<Object?>>> 
// List<BlocProvider> providers = [
//   BlocProvider(create: (context) => PasswordCubit()),
//   BlocProvider(create: (context) => EditNoteCubit()),
//   BlocProvider(create: (context) => DeleteNoteCubit()),
//   BlocProvider(create: (context) => AddNoteCubit()),
//   BlocProvider(create: (context) => NoteChooseImageCubit()),
//   // BlocProvider(create: (context) => DeleteCategoryCubit()),
//   BlocProvider(create: (context) => ChangeDateCubit()),
//   BlocProvider(create: (context) => EditCategoryCubit()),
//   BlocProvider(create: (context) => AddCategoryCubit()),
//   BlocProvider(create: (context) => CategoryChooseImageCubit()),
//   BlocProvider(create: (context) => CategoryCenterCubit()),
//   BlocProvider(create: (context) => DataCenterCubit()..postAppData()),
//   BlocProvider(create: (context) => AuthLoginCubit()),
//   BlocProvider(create: (context) => AuthSignupCubit()),
// ];
