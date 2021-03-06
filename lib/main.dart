import 'package:flutter/material.dart';
import 'package:flutterweb/screens/aboutPage.dart';
import 'package:flutterweb/screens/blogPage.dart';
import 'package:flutterweb/screens/faqPage.dart';
import 'package:flutterweb/screens/homePage.dart';
import 'package:flutterweb/screens/how_its_workpage.dart';
import 'package:flutterweb/screens/investPage.dart';
import 'package:flutterweb/screens/loginPage.dart';
import 'package:flutterweb/screens/profilePage.dart';
import 'package:flutterweb/screens/signupPage.dart';
import 'package:flutterweb/screens/terms&condPage.dart';
import 'package:flutterweb/utils/constant.dart';
import 'package:flutterweb/utils/preference.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_strategy/url_strategy.dart';

import 'model/route.dart';
void main() {
  //for removing # from url
  setPathUrlStrategy();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  Widget? view;
  MyApp() {
    Map<String, Widget> InnerRoutes = {
      'home': HomePage(),
      'howItsWorks': HowItsWorksPage(),
      'about' : AboutPage(),
      'blog' : BlogPage(),
      'faq' : FAQPage(),
      'profile' : ProfilePage(),
      'termspolicy': TermsConditionsPage(),
      'investhypnoseed' : InvestHypnoseedPage(),
      'signup' : SignUpPage(),
      'login' : LoginPage(),
    };
    view = InnerRoutes[Get.parameters['myapp']];

  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, child) => ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(context, child!),
      minWidth: 450,
      maxWidth: 1600,
      defaultScale: true,
      breakpoints: [
        ResponsiveBreakpoint.resize(450, name: MOBILE),
        ResponsiveBreakpoint.autoScale(800, name: TABLET),
        ResponsiveBreakpoint.autoScale(1000, name: TABLET),
        ResponsiveBreakpoint.resize(1600, name: DESKTOP),
        ResponsiveBreakpoint.autoScale(2460, name: "4K"),
      ],
      ),
      title: 'Website',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/home',
      onGenerateRoute: (RouteSettings settings) {
        return Routes.fadeThrough(settings, (context) {
          switch (settings.name) {
            case '/home':
              return const HomePage();
            case '/about':
              return const AboutPage();
            case '/investhypnoseed':
              return const InvestHypnoseedPage();
            default:
              return const SizedBox.shrink();
          }
        });
      },
      getPages: [
        GetPage(name: '/:page_name', page: () => MasterPage())
      ],

    );
  }
}

class MasterPage extends StatelessWidget {
  Widget? view;
  MasterPage() {
    Map<String, Widget> InnerRoutes = {
      'home' : HomePage(),
      'howItsWorks' : HowItsWorksPage(),
      'about' : AboutPage(),
      'blog' : BlogPage(),
      'termspolicy': TermsConditionsPage(),
      'investhypnoseed' : InvestHypnoseedPage(),
      'faq' : FAQPage(),
      'signup' : SignUpPage(),
      'login' : LoginPage(),
      'profile' : ProfilePage()
    };
    view = InnerRoutes[Get.parameters['page_name']];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: view,
    );
  }
}



