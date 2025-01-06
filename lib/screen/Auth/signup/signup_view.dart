import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_application/constant/app_color.dart';
import 'package:note_application/constant/app_image.dart';
import 'package:note_application/constant/langauage_keys.dart';
import 'package:note_application/constant/size_constant.dart';
import 'package:note_application/core/extension_language.dart';
import 'package:note_application/function/validation_function.dart';
import 'package:note_application/cubit/auth/auth_signup_cubit.dart';
import 'package:note_application/screen/companded/cusomer_definition_screen_widget.dart';
import 'package:note_application/screen/companded/customer_message_link_widget.dart';
import 'package:note_application/screen/companded/customer_note_logo_widget.dart';
import 'package:note_application/shared/customer_image_button_widget.dart';
import 'package:note_application/shared/customer_text_field_widget.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});
  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;
  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
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
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    const CustomerNoteLogoWidget(),
                    CustomerDefinitionScreenWidget(
                      title: LanguageKeys.signUp.tr(context),
                      content: LanguageKeys.signUpContent.tr(context),
                    ),
                    CustomerFormFieldWidget(
                      hint: LanguageKeys.usernameHint.tr(context),
                      controller: _usernameController,
                      validator: (value) => validatorGeneral(
                        context,
                        value: value!,
                        min: ConstantSizeValid.validUsernamelMin,
                        max: ConstantSizeValid.validUsernamelMax,
                      ),
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
                    AspectRatio(
                      aspectRatio: 5.8,
                      child: CustomerImageButtomWidget(
                        title: LanguageKeys.signUp.tr(context),
                        color: AppColor.main,
                        image: AppImage.auth,
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await BlocProvider.of<AuthSignupCubit>(context)
                                .signUp(
                              username: _usernameController.text,
                              email: _emailController.text,
                              password: _passwordController.text,
                            );
                          } else {
                            _autoValidateMode = AutovalidateMode.always;
                            setState(() {});
                          }
                        },
                      ),
                    ),
                    CustomerMessageLinkWidget(
                      message: LanguageKeys.messageStatmentSignUp.tr(context),
                      link: LanguageKeys.logIn.tr(context),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
