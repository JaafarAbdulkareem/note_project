import 'package:device_preview/device_preview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_application/constant/lang_constant.dart';
import 'package:note_application/constant/localizations_delegates.dart';
import 'package:note_application/constant/routes.dart';
import 'package:note_application/cubit/internet/internet_bloc.dart';
import 'package:note_application/cubit/internet/internet_state.dart';
import 'package:note_application/screen/Auth/login/login_screen.dart';
import 'package:note_application/screen/initial_screen.dart';
import 'package:note_application/cubit/auth/auth_login_cubit.dart';
import 'package:note_application/cubit/auth/auth_signup_cubit.dart';
import 'package:note_application/cubit/category/add_category/add_category_cubit.dart';
import 'package:note_application/cubit/category/category_center/category_center_cubit.dart';
import 'package:note_application/cubit/category/edit_category/edit_category_cubit.dart';
import 'package:note_application/cubit/change_date/change_date_cubit.dart';
import 'package:note_application/cubit/category/category_choose_image/category_choose_image_cubit.dart';
import 'package:note_application/cubit/data_center/data_center_cubit.dart';
import 'package:note_application/cubit/note/add_note/add_note_cubit.dart';
import 'package:note_application/cubit/note/delete_note/delete_note_cubit.dart';
import 'package:note_application/cubit/note/note_choose_image/note_choose_image_cubit.dart';
import 'package:note_application/cubit/password/password_cubit.dart';
import 'package:note_application/screen/note/edit_note/edit_note_cubit.dart';
import 'package:note_application/screen/wifi_lost.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PasswordCubit()),
        BlocProvider(create: (context) => EditNoteCubit()),
        BlocProvider(create: (context) => DeleteNoteCubit()),
        BlocProvider(create: (context) => AddNoteCubit()),
        BlocProvider(create: (context) => NoteChooseImageCubit()),
        // BlocProvider(create: (context) => DeleteCategoryCubit()),
        BlocProvider(create: (context) => ChangeDateCubit()),
        BlocProvider(create: (context) => EditCategoryCubit()),
        BlocProvider(create: (context) => AddCategoryCubit()),
        BlocProvider(create: (context) => CategoryChooseImageCubit()),
        BlocProvider(create: (context) => CategoryCenterCubit()),
        // BlocProvider(create: (context) => DataCenterCubit()),
        BlocProvider(create: (context) => DataCenterCubit()..postAppData()),
        BlocProvider(create: (context) => AuthLoginCubit()),
        BlocProvider(create: (context) => AuthSignupCubit()),
        BlocProvider(create: (context) => InternetBloc()),
      ],
      child: MaterialApp(
        title: 'Note Application',
        debugShowCheckedModeBanner: false,
        // debugShowMaterialGrid: true,
        // useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        // theme: ThemeData(
        //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //   useMaterial3: true,
        // ),
        routes: routes,
        // initialRoute:
        // (FirebaseAuth.instance.currentUser != null &&
        //         FirebaseAuth.instance.currentUser!.emailVerified)
        //     ? InitialScreen.id
        //     : LoginScreen.id,
        home: BlocBuilder<InternetBloc, InternetState>(
          builder: (context, state) {
            if (state is ConnectedState) {
              return (FirebaseAuth.instance.currentUser != null &&
                      FirebaseAuth.instance.currentUser!.emailVerified)
                  ? const InitialScreen()
                  : const LoginScreen();
            }
            return const WifiLost();
          },
        ),

        localizationsDelegates: localizationsDelegates,
        supportedLocales: _supportedLocales,
        localeResolutionCallback: _localResolution,
      ),
    );
  }

  Locale? _localResolution(deviceLocale, supportedLocales) {
    for (Locale locale in supportedLocales) {
      if (deviceLocale != null &&
          deviceLocale.languageCode == locale.languageCode) {
        return deviceLocale;
      }
    }
    return supportedLocales.first;
  }

  List<Locale> get _supportedLocales {
    List<Locale> localesLanguage = [];
    for (String element in ConstantLang.langs) {
      localesLanguage.add(Locale(element));
    }
    return localesLanguage;
  }
}
