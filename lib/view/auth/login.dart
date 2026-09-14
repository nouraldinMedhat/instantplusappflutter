import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instantplus/resources/assets_resources.dart';
import 'package:instantplus/resources/colors_resources.dart';
import 'package:instantplus/resources/fonts_resources.dart';
import 'package:instantplus/resources/strings_resources.dart';
import 'package:instantplus/resources/text_style_resources.dart';
import 'package:instantplus/resources/validations.dart';
import 'package:instantplus/reusable_components/regular_button.dart';
import 'package:instantplus/reusable_components/regular_text_field.dart';
import 'package:instantplus/reusable_components/text_widget.dart';
import 'package:instantplus/view/home/home_screen.dart';
import 'package:instantplus/view_model/auth/login_view_model.dart';
import 'package:instantplus/resources/navigator_resource.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginViewModel(),
      child: const _LoginBody(),
    );
  }
}

class _LoginBody extends StatelessWidget {
  const _LoginBody();

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<LoginViewModel>();

    return Scaffold(
      backgroundColor: ColorsManager.scaffold,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _LoginMediaCard(),
              SizedBox(height: 24.h),
              Row(
                children: [
                  GestureDetector(
                    onTap: () =>
                        RouteManager.navigateAndPopAll(const HomeScreen()),
                    child: Row(
                      children: [
                        Icon(Icons.arrow_forward_ios,
                            size: 16.sp, color: ColorsManager.black),
                        SizedBox(width: 4.w),
                        TextWidget(
                          text: StringsManager.backToHome,
                          textStyle: getMediumStyle(
                            fontSize: FontSize.kindaSmall,
                            color: ColorsManager.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Image.asset(
                    AssetsResource.logoBlue,
                    height: 36.h,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
              SizedBox(height: 28.h),
              TextWidget(
                text: vm.showOtp
                    ? StringsManager.otpTitle
                    : StringsManager.welcomeBack,
                textStyle: getBoldStyle(
                  fontSize: FontSize.subTitle,
                  color: ColorsManager.black,
                ),
              ),
              SizedBox(height: 8.h),
              TextWidget(
                text: vm.showOtp
                    ? 'قم بإدخال رمز المرور المُرسل إليك عن طريق ${vm.identifier.isEmpty ? "رقم الهاتف / البريد" : vm.identifier} المسجل لدينا'
                    : StringsManager.loginDescription,
                maxLines: 3,
                textStyle: getRegularStyle(
                  fontSize: FontSize.kindaSmall,
                  color: ColorsManager.greyText,
                ),
              ),
              SizedBox(height: 24.h),
              if (!vm.showOtp) ...[
                Form(
                  key: vm.formKey,
                  child: RegularTextField(
                    controller: vm.identifierController,
                    inputType: TextInputType.emailAddress,
                    label: StringsManager.enterEmailOrPhone,
                    validator: Validations.validateField,
                  ),
                ),
                SizedBox(height: 20.h),
                RegularButton(
                  text: StringsManager.login,
                  onPressed: vm.isLoading ? null : vm.submitLogin,
                ),
              ] else ...[
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(5, (index) {
                      return SizedBox(
                        width: 54.w,
                        height: 56.h,
                        child: TextField(
                          controller: vm.otpControllers[index],
                          focusNode: vm.otpFocusNodes[index],
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          style: getBoldStyle(fontSize: FontSize.mediumTitle),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          onChanged: (v) => vm.onOtpChanged(index, v),
                          decoration: InputDecoration(
                            counterText: '',
                            filled: true,
                            fillColor: ColorsManager.inputColor,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.r),
                              borderSide: const BorderSide(
                                color: ColorsManager.basicBorder,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.r),
                              borderSide: const BorderSide(
                                color: ColorsManager.primary,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                SizedBox(height: 20.h),
                RegularButton(
                  text: StringsManager.confirm,
                  onPressed: vm.isLoading ? null : vm.submitOtp,
                ),
              ],
              SizedBox(height: 28.h),
              Row(
                children: [
                  TextWidget(
                    text: StringsManager.haveProblem,
                    textStyle: getMediumStyle(
                      fontSize: FontSize.kindaSmall,
                      color: ColorsManager.black,
                    ),
                  ),
                  SizedBox(width: 6.w),
                  TextWidget(
                    text: StringsManager.contactUs,
                    textStyle: getSemiBoldStyle(
                      fontSize: FontSize.kindaSmall,
                      color: ColorsManager.primary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginMediaCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.r),
      child: SizedBox(
        height: 220.h,
        width: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              AssetsResource.slider1,
              fit: BoxFit.cover,
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    ColorsManager.primary.withValues(alpha: 0.15),
                    ColorsManager.primary.withValues(alpha: 0.92),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(18.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      color: ColorsManager.white.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: TextWidget(
                      text: StringsManager.welcomeBadge,
                      textStyle: getSemiBoldStyle(
                        fontSize: FontSize.smallText,
                        color: ColorsManager.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  TextWidget(
                    text: StringsManager.startJourney,
                    textStyle: getBoldStyle(
                      fontSize: FontSize.mediumTitle,
                      color: ColorsManager.white,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  TextWidget(
                    text: StringsManager.loginMediaBody,
                    maxLines: 3,
                    textStyle: getRegularStyle(
                      fontSize: FontSize.kindaSmall,
                      color: ColorsManager.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
