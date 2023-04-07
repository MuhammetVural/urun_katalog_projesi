import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:urun_katalog_projesi/gen/assets.gen.dart';
import 'package:urun_katalog_projesi/product/components/font_manager.dart';
import 'package:urun_katalog_projesi/product/components/reuseable_widgets.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 60),
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
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
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
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Login to your account',
                  style: TextStyle(
                      fontWeight: FontWeight.w600, fontSize: FontSize.s20),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'E-mail',
                  style: TextStyle(
                      fontWeight: FontWeight.w500, fontSize: FontSize.s16),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: reuseableTextField(
                    'jhon@mail.com', false, true, _emailTextController),
              ),
              SizedBox(
                height: 24.h,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Password',
                  style: TextStyle(
                      fontWeight: FontWeight.w500, fontSize: FontSize.s16),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: reuseableTextField(
                    '···········', true, true, _passwordTextController),
              ),
              SizedBox(
                height: 12.h,
              ),
            ],
          )),
        ),
      ),
    );
  }
}
