import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_ui/providers/auth_provider.dart';
import 'package:flutter_login_ui/providers/login_form_provider.dart';
import 'package:flutter_login_ui/router/router.dart';
import 'package:flutter_login_ui/ui/inputs/custom_input.dart';
import 'package:flutter_login_ui/ui/layout/auth/widget/custom_title_auth.dart';
import 'package:flutter_login_ui/ui/layout/auth/widget/fade_animation.dart';
import 'package:flutter_login_ui/widgets/constants.dart';

import 'package:provider/provider.dart';

class ResetPasswordView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return ChangeNotifierProvider(
        create: (_) => LoginFormProvider(),
        child: Builder(builder: (context) {
          final loginFormProvider =
              Provider.of<LoginFormProvider>(context, listen: false);

          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 270,
                  child: Stack(
                    children: [
                      Positioned(
                          left: 30,
                          width: 80,
                          height: 200,
                          child: FadeAnimation(
                              1,
                              Container(
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/light-1.png'))),
                              ))),
                      Positioned(
                        left: 140,
                        width: 80,
                        height: 150,
                        child: FadeAnimation(
                            1.3,
                            Container(
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/light-2.png'))),
                            )),
                      ),
                      Positioned(
                        right: 30,
                        top: 40,
                        width: 80,
                        height: 150,
                        child: FadeAnimation(
                            1.5,
                            Container(
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/clock.png'))),
                            )),
                      ),
                      Positioned(
                          child: Container(
                              margin: EdgeInsets.only(top: 20),
                              child: FadeAnimation(
                                1,
                                Center(
                                  child: CustomTitleAuth.loginTitleDecoration(
                                      label: 'Recuperar', color: strongColor),
                                ),
                              )))
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 370),
                      child: Form(
                          key: loginFormProvider.formKey,
                          child: Column(
                            children: [
                              // Email
                              TextFormField(
                                onFieldSubmitted: (_) {
                                  onFormSubmit(loginFormProvider, authProvider);
                                },
                                validator: (value) {
                                  if (!EmailValidator.validate(value ?? ''))
                                    return 'Email no válido';

                                  return null;
                                },
                                onChanged: (value) =>
                                    loginFormProvider.email = value,
                                style: TextStyle(color: strongColor),
                                decoration: CustomInputs.loginInputDecoration(
                                    hint: 'Ingrese su correo',
                                    label: 'Email',
                                    icon: Icons.email_outlined),
                              ),

                              SizedBox(height: 20),

                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      padding:
                                          EdgeInsets.fromLTRB(75, 15, 75, 15),
                                      primary: strongColor,
                                      onPrimary: secondaryColor),
                                  onPressed: () {
                                    onFormSubmit(
                                        loginFormProvider, authProvider);
                                  },
                                  child: Text('SOLICITAR',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.white))),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    child: Text(
                                      'Ingresar',
                                      style: TextStyle(color: strongColor),
                                    ),
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, Routes.loginRoute);
                                    },
                                  ),
                                ],
                              )
                            ],
                          )),
                    ),
                  ),
                ),
              ],
            ),
          );
        }));
  }

  void onFormSubmit(
      LoginFormProvider loginFormProvider, AuthProvider authProvider) {
    final isValid = loginFormProvider.validateForm();
    if (isValid) {
      authProvider.login(loginFormProvider.email, loginFormProvider.password);
    }
  }
}
