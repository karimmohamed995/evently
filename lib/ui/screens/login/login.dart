import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/ui/providers/language_provider.dart';
import 'package:evently/ui/providers/theme_provider.dart';
import 'package:evently/ui/utilities/app_assets.dart';
import 'package:evently/ui/utilities/app_colors.dart';
import 'package:evently/ui/widgets/custom_button.dart';
import 'package:evently/ui/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  int selectedIndex = 0;
  final List<String> flags = ['assets/images/EG.png', 'assets/images/LR.png'];
  late AppLocalizations l10n;
  // bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    languageProvider = Provider.of(context);
    themeProvider = Provider.of(context);
    l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 24),
              buildAppLogo(context),
              SizedBox(height: 24),
              buildEmailTextField(),
              SizedBox(height: 16),
              buildPasswordTextField(),
              SizedBox(height: 16),
              buildForgetPasswordText(context),
              SizedBox(height: 24),
              buildLoginButton(),
              SizedBox(height: 24),
              buildSignUpText(),
              SizedBox(height: 24),
              buildOrRow(),
              SizedBox(height: 24),
              buildGoogleLogin(),
              SizedBox(height: 24),
              buildLanguageToggle(),
              SizedBox(height: 24),
              buildThemeToggle(),
            ],
          ),
        ),
      ),
    );
  }

  buildAppLogo(BuildContext context) => Image.asset(
    AppAssets.logoVertical,
    height: MediaQuery.of(context).size.height * 0.2,
  );

  buildEmailTextField() => Container(
    child: CustomTextField(
      hint: l10n.emailHint,
      prefixIcon: AppAssets.mailIcon,
    ),
  );

  buildPasswordTextField() => Container(
    child: CustomTextField(
      hint: l10n.passwordHint,
      prefixIcon: AppAssets.passIcon,
      isPassword: true,
    ),
  );

  buildForgetPasswordText(BuildContext context) => Container(
    width: double.infinity,
    child: Text(
      l10n.forgetPassword,
      textAlign: TextAlign.end,
      style: Theme.of(context).textTheme.labelMedium!.copyWith(
        fontStyle: FontStyle.italic,
        decoration: TextDecoration.underline,
      ),
    ),
  );

  buildLoginButton() => CustomButton(text: l10n.loginButton, onClick: () {});

  buildSignUpText() => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(l10n.dontHaveAccount, style: Theme.of(context).textTheme.labelSmall),
      Text(
        l10n.createAccount,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
          fontStyle: FontStyle.italic,
          decoration: TextDecoration.underline,
        ),
      ),
    ],
  );

  buildOrRow() => Row(
    children: [
      Expanded(child: Divider(indent: 24, endIndent: 24)),
      Text(l10n.orText, style: Theme.of(context).textTheme.labelMedium),
      Expanded(child: Divider(indent: 24, endIndent: 24)),
    ],
  );

  buildGoogleLogin() => CustomButton(
    image: Image.asset(AppAssets.googleIcon, width: 24, height: 24),
    text: l10n.loginWithGoogle,
    onClick: () {},
    // backgroundcolor: Theme.of(context).brightness == Brightness.dark
    //     ? AppColors
    //           .darkPurple // اللون في الـ dark mode
    //     : AppColors.white,
    backgroundcolor: AppColors.white,
    textColor: AppColors.purple,
  );

  late LanguageProvider languageProvider;
  late ThemeProvider themeProvider;

  buildLanguageToggle() => AnimatedToggleSwitch<String>.dual(
    current: languageProvider.currentLocale,
    iconBuilder: (language) =>
        Image.asset(language == "ar" ? AppAssets.egIcon : AppAssets.usIcon),
    first: "ar",
    second: "en",
    onChanged: (language) {
      languageProvider.changeLanguage(language);
      setState(() {});
    },
  );

  buildThemeToggle() => AnimatedToggleSwitch<ThemeMode>.dual(
    current: themeProvider.mode,
    iconBuilder: (mode) =>
        Icon(mode == ThemeMode.dark ? Icons.dark_mode : Icons.light_mode),
    first: ThemeMode.light,
    second: ThemeMode.dark,
    onChanged: (mode) {
      themeProvider.changeMode(mode);
      setState(() {});
    },
  );

  // buildLanguageToggle() => Container(
  //   width: MediaQuery.of(context).size.width * 0.3,
  //   child: AnimatedToggleSwitch<int>.rolling(
  //     current: selectedIndex,
  //     values: [0, 1],
  //     onChanged: (i) => setState(() => selectedIndex = i),
  //     iconBuilder: (value, isSelected) =>
  //         Image.asset(flags[value], width: 27, height: 27, fit: BoxFit.contain),
  //     style: ToggleStyle(
  //       backgroundColor: Colors.transparent, // خلفية التوجّل
  //       indicatorColor: Colors.deepPurple, // لون الزر المتحرك
  //       borderRadius: BorderRadius.circular(32),
  //       indicatorBorder: Border.all(
  //         color: Colors.deepPurple,
  //         width: 3,
  //       ), // بوردر الزر المتحرك
  //       borderColor: Colors.deepPurple, // لون البوردر الخارجي
  //       // borderWidth: 2, // سُمك البوردر
  //     ),
  //     height: 48,
  //     spacing: 4,
  //   ),
  // );
}
