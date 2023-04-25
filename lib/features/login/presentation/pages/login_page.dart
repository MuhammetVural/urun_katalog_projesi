import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:urun_katalog_projesi/core/network_manager/network_manager.dart';
import 'package:urun_katalog_projesi/features/home/presentation/pages/home_page.dart';
import 'package:urun_katalog_projesi/features/login/data/models/login_model.dart';
import 'package:urun_katalog_projesi/features/login/data/repositories/login_repository.dart';
import 'package:urun_katalog_projesi/gen/assets.gen.dart';
import 'package:urun_katalog_projesi/product/components/color_manager.dart';
import 'package:urun_katalog_projesi/product/components/font_manager.dart';
import 'package:urun_katalog_projesi/product/components/reuseable_widgets.dart';
import 'package:urun_katalog_projesi/product/locator/locator.dart';
import 'package:urun_katalog_projesi/product/navigation/app_router.dart';

import '../../../../main.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();

  final LoginRepository _loginService = LoginRepositoryImp(service: getIt<NetworkManager>());
  late String? token;

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    // ignore: avoid_print
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool? isChecked = false;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 60.h),
          child: Form(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Assets.images.logo.path,
                height: 65,
              ),
              SizedBox(
                height: 115.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: const Text(
                  'Welcome Back!',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: FontSize.s16,
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: const Text(
                  'Login to your account',
                  style: TextStyle(
                      fontWeight: FontWeight.w600, fontSize: FontSize.s20),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: const Text(
                  'E-mail',
                  style: TextStyle(
                      fontWeight: FontWeight.w500, fontSize: FontSize.s16),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: reuseableTextField(
                    'jhon@mail.com', false, true, _emailTextController),
              ),
              SizedBox(
                height: 24.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.h),
                child: const Text(
                  'Password',
                  style: TextStyle(
                      fontWeight: FontWeight.w500, fontSize: FontSize.s16),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.h),
                  child: TextField(
                    controller: _passwordTextController,
                    // obscureText: _obsecureText,
                    obscureText: true,
                    enabled: true,
                    enableSuggestions: true,
                    autocorrect: true,
                    cursorColor: Colors.grey,
                    style: TextStyle(color: Colors.black54.withOpacity(0.8)),
                    decoration: InputDecoration(
                      labelText: '............',
                      labelStyle:
                          TextStyle(color: Colors.grey.withOpacity(0.7)),
                      filled: true,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      fillColor: ColorManager.textFieldGreyBackround,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: const BorderSide(
                              width: 0, style: BorderStyle.none)),
                    ),
                    keyboardType: true
                        ? TextInputType.visiblePassword
                        : TextInputType.emailAddress,
                    
                  )),
              SizedBox(
                height: 5.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                            value: isChecked,
                            activeColor: Colors.amber,
                            hoverColor: ColorManager.textAndButtonPurple,
                            checkColor: Colors.amber,
                            focusColor: ColorManager.textAndButtonPurple,
                            onChanged: (newBool) {
                              setState(() {
                                isChecked = newBool;
                              });
                            }),
                        Text(
                          'Remember me',
                          style: TextStyle(
                              color: ColorManager.textAndButtonPurple,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: TextButton(
                        onPressed: () {
                          router.push(const RegisterRoute());
                        },
                        child: Text(
                          'Register',
                          style: TextStyle(
                              color: ColorManager.textAndButtonPurple,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 350.w,
                height: 60.h,
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: ElevatedButton(
                    onPressed: () async {
                      await loginButtonPressed();
                      if (token!.isEmpty || token == null) {
                        // ignore: use_build_context_synchronously
                        await showDialogBox(context);
                      } else {
                        
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => HomePage(token: token!)),
                            (route) => route.isFirst);
                      }
                    },
                    child: const Text('Login')),
              ),
            ],
          )),
        ),
      ),
    );
  }

    Future<dynamic> showDialogBox(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text("Error"),
        contentPadding: EdgeInsets.all(20),
      ),
    );
  }

    Future<void> loginButtonPressed() {
    return loginButton(
      _emailTextController.text.trim(),
      _passwordTextController.text.trim(),
    );
  }

    Future<void> loginButton(String email, String password) async {
    token = await _loginService.getLogin(email, password);
  }
}
