import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/ui/utilities/app_assets.dart';
import 'package:evently/ui/utilities/app_colors.dart';
import 'package:evently/ui/widgets/custom_button.dart';
import 'package:evently/ui/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late AppLocalizations l10n;
  // bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
              buildLanguageToggle(),
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

  buildForgetPasswordText(BuildContext context) => Text(
    l10n.forgetPassword,
    textAlign: TextAlign.end,
    style: Theme.of(context).textTheme.labelMedium!.copyWith(
      fontStyle: FontStyle.italic,
      decoration: TextDecoration.underline,
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
    backgroundcolor: AppColors.white,

    textColor: AppColors.purple,
  );

  buildLanguageToggle() => Container();
}
