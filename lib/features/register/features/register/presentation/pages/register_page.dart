import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:urun_katalog_projesi/gen/assets.gen.dart';
import 'package:urun_katalog_projesi/product/components/color_manager.dart';
import 'package:urun_katalog_projesi/product/components/font_manager.dart';
import 'package:urun_katalog_projesi/product/components/reuseable_widgets.dart';

@RoutePage()
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
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
                child: reuseableTextField(
                    '···········', true, true, _passwordTextController),
              ),
              SizedBox(
                height: 5.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
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
              )
            ],
          )),
        ),
      ),
    );
  }
}