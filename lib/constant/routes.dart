import 'package:flutter/widgets.dart';
import 'package:note_application/screen/Auth/login/login_screen.dart';
import 'package:note_application/screen/Auth/signup/signup_screen.dart';
import 'package:note_application/screen/category/edit_category/edit_category_screen.dart';
import 'package:note_application/screen/category/home_category/home_category_screen.dart';
import 'package:note_application/screen/initial_screen.dart';
import 'package:note_application/screen/note/add_note/add_note_screen.dart';
import 'package:note_application/screen/note/display_note/display_note_screen.dart';
import 'package:note_application/screen/note/edit_note/edit_note_screen.dart';
import 'package:note_application/screen/note/home_note/home_note_screen.dart';
import 'package:note_application/screen/wifi_lost.dart';

Map<String, Widget Function(dynamic)> routes = {
  DisplayNoteScreen.id: (context) => const DisplayNoteScreen(),
  EditNoteScreen.id: (context) => const EditNoteScreen(),
  AddNoteScreen.id: (context) => const AddNoteScreen(),
  HomeNoteScreen.id: (context) => const HomeNoteScreen(),
  EditCategoryScreen.id: (context) => const EditCategoryScreen(),
  HomeCategoryScreen.id: (context) => const HomeCategoryScreen(),
  InitialScreen.id: (context) => const InitialScreen(),
  LoginScreen.id: (context) => const LoginScreen(),
  SignupScreen.id: (context) => const SignupScreen(),
  WifiLost.id: (context) => const WifiLost(),
};

// Map<String, Widget Function(dynamic)>