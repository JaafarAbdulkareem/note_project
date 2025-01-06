import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_application/constant/app_color.dart';
import 'package:note_application/constant/app_image.dart';
import 'package:note_application/constant/langauage_keys.dart';
import 'package:note_application/constant/size_constant.dart';
import 'package:note_application/core/extension_language.dart';
import 'package:note_application/function/flashbar_function.dart';
import 'package:note_application/function/validation_function.dart';
import 'package:note_application/cubit/auth/auth_login_cubit.dart';
import 'package:note_application/screen/Auth/signup/signup_screen.dart';
import 'package:note_application/screen/companded/cusomer_definition_screen_widget.dart';
import 'package:note_application/screen/companded/customer_message_link_widget.dart';
import 'package:note_application/screen/companded/customer_note_logo_widget.dart';
import 'package:note_application/screen/widget/forget_password_widget.dart';
import 'package:note_application/shared/customer_image_button_widget.dart';
import 'package:note_application/shared/customer_text_field_widget.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: _formKey,
          autovalidateMode: _autoValidateMode,
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    const CustomerNoteLogoWidget(),
                    CustomerDefinitionScreenWidget(
                      title: LanguageKeys.logIn.tr(context),
                      content: LanguageKeys.logInContent.tr(context),
                    ),
                    CustomerFormFieldWidget(
                      hint: LanguageKeys.emailHint.tr(context),
                      controller: _emailController,
                      validator: (value) => validatorGeneral(
                        context,
                        value: value!,
                        min: ConstantSizeValid.validEmailMin,
                        max: ConstantSizeValid.validEmailMax,
                      ),
                      // onSaved: (value) {
                      //   // log(" $value : save : ${_emailController.text}");
                      //   // _formKey.currentState!.save();
                      // },
                      // onChange: (value) {
                      //   log("$_email :change : $value");
                      //   _email = value!;
                      // },
                    ),
                    CustomerFormFieldWidget(
                      hint: LanguageKeys.passwordHint.tr(context),
                      controller: _passwordController,
                      validator: (value) => validatorGeneral(
                        context,
                        value: value!,
                        min: ConstantSizeValid.validPasswordMin,
                        max: ConstantSizeValid.validPasswordMax,
                      ),
                      obscureText: true,
                    ),
                    ForgetPasswordWidget(
                      email: _emailController.text,
                      onTap: onTapResetPassword,
                    ),
                    AspectRatio(
                      aspectRatio: 5.6,
                      child: CustomerImageButtomWidget(
                        title: LanguageKeys.logIn.tr(context),
                        color: AppColor.main,
                        image: AppImage.auth,
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await BlocProvider.of<AuthLoginCubit>(context)
                                .login(
                              email: _emailController.text.trim(),
                              password: _passwordController.text.trim(),
                            );
                          } else {
                            _autoValidateMode = AutovalidateMode.always;
                            setState(() {});
                          }
                        },
                      ),
                    ),
                    AspectRatio(
                      aspectRatio: 5.6,
                      child: CustomerImageButtomWidget(
                        title: LanguageKeys.logInbyGoogle.tr(context),
                        color: AppColor.error,
                        image: AppImage.google,
                        onPressed: () async {
                          await BlocProvider.of<AuthLoginCubit>(context)
                              .loginWithGoogle();
                        },
                      ),
                    ),
                    CustomerMessageLinkWidget(
                      message: LanguageKeys.messageStatmentLogIn.tr(context),
                      link: LanguageKeys.signUp.tr(context),
                      onTap: () {
                        Navigator.of(context).pushNamed(SignupScreen.id);
                      },
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  void onTapResetPassword() async {
    String email = _emailController.text.trim();
    if (email.isEmpty) {
      flashBar(
        title: LanguageKeys.alertTitle.tr(context),
        message: LanguageKeys.empty.tr(context),
      ).show(context);
    } else {
      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        if (!context.mounted) return;
        flashBar(
          title: LanguageKeys.alertTitle.tr(context),
          message: LanguageKeys.verification.tr(context),
        ).show(context);
      } catch (e) {
        if (!context.mounted) return;
        flashBar(
          title: LanguageKeys.alertTitle.tr(context),
          message: LanguageKeys.alertEmailNotFound.tr(context),
        ).show(context);
      }
    }
  }
}
