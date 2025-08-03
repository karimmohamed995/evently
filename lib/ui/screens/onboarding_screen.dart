import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/ui/providers/language_provider.dart';
import 'package:evently/ui/providers/theme_provider.dart';
import 'package:evently/ui/utilities/app_assets.dart';
import 'package:evently/ui/utilities/app_colors.dart';
import 'package:evently/ui/utilities/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:evently/ui/utilities/dialog_utils.dart';
// import 'package:evently/ui/widgets/custom_button.dart';
// import 'package:evently/ui/widgets/custom_text_field.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late AppLocalizations l10n;
  final PageController _controller = PageController();
  int currentIndex = 0;

  final List<Map<String, String>> onboardingData = [
    {
      'image': 'assets/images/being-creative-1.png',
      'title': 'Personalize Your Experience',
      'desc':
          'Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.',
    },
    {
      'image': 'assets/images/hot-trending.png',
      'title': 'Find Events That Inspire You',
      'desc':
          "Dive into a world of events crafted to fit your unique interests. Whether you're into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.",
    },
    {
      'image': 'assets/images/being-creative.png',
      'title': 'Effortless Event Planning',
      'desc':
          'Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.',
    },
    {
      'image': 'assets/images/being-creative-2.png',
      'title': 'Connect with Friends & Share Moments',
      'desc':
          'Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.',
    },
  ];

  void goNext() {
    if (currentIndex < onboardingData.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.push(context, AppRoutes.login);
    }
  }

  void goBack() {
    if (currentIndex > 0) {
      _controller.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    languageProvider = Provider.of(context);
    themeProvider = Provider.of(context);
    l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 50),

          // ========= Logo =========
          Image.asset('assets/images/logo2.png', height: 60),

          const SizedBox(height: 24),

          // ========= Onboarding Pages =========
          Expanded(
            flex: 7,
            child: PageView.builder(
              controller: _controller,
              itemCount: onboardingData.length,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                final data = onboardingData[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.asset(
                          data['image']!,
                          fit: BoxFit.contain,
                          width: double.infinity,
                        ),
                      ),
                      const SizedBox(height: 32),
                      Text(
                        data['title']!,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        data['desc']!,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 24),

          // ========= Extra Rows: Language & Mode =========
          if (currentIndex == 0) ...[
            Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Icon(Icons.language, color: Colors.blueAccent),
                // SizedBox(width: 8),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Language",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                Spacer(),
                buildLanguageToggle(),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SizedBox(width: 8),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Theme",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                Spacer(),
                buildThemeToggle(),
              ],
            ),
            const SizedBox(height: 16),
          ],

          // ========= Indicators & Buttons =========
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: currentIndex == 0
                ? Center(
                    child: ElevatedButton(
                      onPressed: () {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.purple,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 14,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "Let's Start",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Back Button
                      TextButton(
                        onPressed: goBack,
                        child: Text(
                          "Back",
                          style: TextStyle(
                            color: AppColors.purple,
                            fontSize: 16,
                          ),
                        ),
                      ),

                      // Indicators
                      Row(
                        children: List.generate(
                          onboardingData.length,
                          (i) => AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            width: currentIndex == i ? 24 : 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: AppColors.purple,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ),

                      // Next / Finish Button
                      ElevatedButton(
                        onPressed: goNext,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.purple,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                        ),
                        child: Text(
                          currentIndex == onboardingData.length - 1
                              ? "Finish"
                              : "Next",
                        ),
                      ),
                    ],
                  ),
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }

  late LanguageProvider languageProvider;
  late ThemeProvider themeProvider;

  buildLanguageToggle() => Padding(
    padding: const EdgeInsets.only(right: 8), // ⬅️ padding من اليمين
    child: SizedBox(
      height: 31,
      width: 80,
      child: AnimatedToggleSwitch<String>.dual(
        current: languageProvider.currentLocale,
        iconBuilder: (language) => Image.asset(
          language == "ar" ? AppAssets.egIcon : AppAssets.usIcon,
          width: 20,
          height: 20,
          fit: BoxFit.contain,
        ),
        first: "ar",
        second: "en",
        onChanged: (language) {
          languageProvider.changeLanguage(language);
          setState(() {});
        },
      ),
    ),
  );
  buildThemeToggle() => Padding(
    padding: const EdgeInsets.only(right: 8),
    child: SizedBox(
      height: 31,
      width: 80,
      child: AnimatedToggleSwitch<ThemeMode>.dual(
        current: themeProvider.mode,
        iconBuilder: (mode) =>
            Icon(mode == ThemeMode.dark ? Icons.dark_mode : Icons.light_mode),
        first: ThemeMode.light,
        second: ThemeMode.dark,
        onChanged: (mode) {
          themeProvider.changeMode(mode);
          setState(() {});
        },
      ),
    ),
  );

  // buildLanguageToggle() => SizedBox(
  //   height: 36, // ⬅️ تصغير الارتفاع
  //   width: 90, // ⬅️ تصغير العرض
  //   child: AnimatedToggleSwitch<String>.dual(
  //     borderWidth: 2,
  //     current: languageProvider.currentLocale,
  //     iconBuilder: (language) => Image.asset(
  //       language == "ar" ? AppAssets.egIcon : AppAssets.usIcon,
  //       width: 24, // ⬅️ تصغير عرض الأيقونة
  //       height: 24, // ⬅️ تصغير ارتفاع الأيقونة
  //       fit: BoxFit.contain,

  //     ),
  //     first: "ar",
  //     second: "en",
  //     onChanged: (language) {
  //       languageProvider.changeLanguage(language);
  //       setState(() {});
  //     },
  //   ),
  // );

  // buildLanguageToggle() => Container(

  //   child: AnimatedToggleSwitch<String>.dual(
  //     current: languageProvider.currentLocale,
  //     iconBuilder: (language) =>
  //         Image.asset(language == "ar" ? AppAssets.egIcon : AppAssets.usIcon),
  //     first: "ar",
  //     second: "en",
  //     onChanged: (language) {
  //       languageProvider.changeLanguage(language);
  //       setState(() {});
  //     },
  //   ),
  // );
}
