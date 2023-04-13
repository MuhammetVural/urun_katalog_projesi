import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:urun_katalog_projesi/features/home/presentation/pages/home_page.dart';
import 'package:urun_katalog_projesi/gen/assets.gen.dart';
import 'package:urun_katalog_projesi/product/components/color_manager.dart';
import 'package:urun_katalog_projesi/product/components/font_manager.dart';
import 'package:urun_katalog_projesi/product/components/reuseable_widgets.dart';
import 'package:urun_katalog_projesi/product/navigation/app_router.dart';

import '../../../../main.dart';

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
                    onPressed: () {
                      router.push(const HomaRoute());
                    },
                    child: const Text('Login')),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
