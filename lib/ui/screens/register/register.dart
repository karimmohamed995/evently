import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/ui/providers/language_provider.dart';
import 'package:evently/ui/providers/theme_provider.dart';
import 'package:evently/ui/utilities/app_assets.dart';
import 'package:evently/ui/utilities/app_colors.dart';
import 'package:evently/ui/utilities/app_routes.dart';
import 'package:evently/ui/utilities/dialog_utils.dart';
import 'package:evently/ui/widgets/custom_button.dart';
import 'package:evently/ui/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _LoginState();
}

class _LoginState extends State<Register> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();

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
      appBar: AppBar(
        title: Text("Register"),
        iconTheme: IconThemeData(color: AppColors.purple),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 24),
              buildAppLogo(context),
              SizedBox(height: 24),
              buildNameTextField(),
              SizedBox(height: 16),
              buildEmailTextField(),
              SizedBox(height: 16),
              buildPasswordTextField(),
              SizedBox(height: 16),
              buildRetypePasswordTextField(),
              SizedBox(height: 16),
              buildForgetPasswordText(context),
              SizedBox(height: 24),
              buildRegisterButton(),
              SizedBox(height: 24),
              buildSignUpText(),
              SizedBox(height: 24),
              buildOrRow(),
              SizedBox(height: 24),
              buildGoogleLogin(),
              SizedBox(height: 24),
              buildLanguageToggle(),
              // SizedBox(height: 24),
              // buildThemeToggle(),
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

  buildNameTextField() => Container(
    child: CustomTextField(
      hint: l10n.nameHint,
      prefixIcon: AppAssets.userr,
      controller: userNameController,
    ),
  );

  buildEmailTextField() => Container(
    child: CustomTextField(
      hint: l10n.emailHint,
      prefixIcon: AppAssets.mailIcon,
      controller: emailController,
    ),
  );

  buildPasswordTextField() => Container(
    child: CustomTextField(
      hint: l10n.passwordHint,
      prefixIcon: AppAssets.passIcon,
      isPassword: true,
      controller: passwordController,
    ),
  );
  buildRetypePasswordTextField() => Container(
    child: CustomTextField(
      hint: l10n.rePassword,
      prefixIcon: AppAssets.passIcon,
      isPassword: true,
      controller: rePasswordController,
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

  buildRegisterButton() => CustomButton(
    text: l10n.createAccountt,
    onClick: () async {
      showLoading(context);
      await Future.delayed(Duration(seconds: 2));

      // showLoading(context);
      try {
        var userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
              email: emailController.text,
              password: passwordController.text,
            );
        Navigator.pop(context); // hide loading
        Navigator.push(context, AppRoutes.home);
      } on FirebaseAuthException catch (e) {
        var message = "email or password wrong";
        if (e.code == "weak-password") {
          message = "password is weak";
        } else if (e.code == "email-already-in-use") {
          message = "account already exist ";
        }
        Navigator.pop(context);
        showMessage(context, content: message, posBtnTitle: "Ok");
      }
      // showMessage(
      //   context,
      //   title: "title",
      //   content: "Content",
      //   posBtnTitle: "ok",
      // );
    },
  );

  buildSignUpText() => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        l10n.alreadyHaveAccount,
        style: Theme.of(context).textTheme.labelSmall,
      ),
      InkWell(
        onTap: () {
          Navigator.push(context, AppRoutes.register);
        },
        child: Text(
          l10n.loginButton,
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
            fontStyle: FontStyle.italic,
            decoration: TextDecoration.underline,
          ),
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
    onClick: () {
      //show loading
      //  Register
      //if success go home
      //else show error
    },
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
}
