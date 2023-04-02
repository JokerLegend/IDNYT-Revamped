import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idnyt_revamped/modules/login/providers/lottie_provider.dart';
import 'package:idnyt_revamped/shared/providers/auth.provider.dart';
import 'package:idnyt_revamped/shared/widgets/regular_button_widget.dart';

@RoutePage(name: "LoginPage")
class LoginPage extends HookConsumerWidget {
  LoginPage({Key? key}) : super(key: key);

  final _pageController = PageController(viewportFraction: 1, initialPage: 0);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lottieSignUpList = ref.read(lottieSignUpListProvider);
    final auth = ref.watch(authServiceProvider);

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 2,
              padding: const EdgeInsets.fromLTRB(10, 30, 10, 5),
              child: const Image(
                image: AssetImage('assets/images/IDNYTColor.png'),
              ),
            ),
            Expanded(
              child: PageView.builder(
                itemCount: lottieTitleList.length,
                physics: const AlwaysScrollableScrollPhysics(),
                pageSnapping: true,
                controller: _pageController,
                itemBuilder: (BuildContext context, int index) {
                  return lottieSignUpList[index];
                },
                onPageChanged: (value) {
                  ref.read(lottiePositionProvider.notifier).state = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: SmoothPageIndicator(
                controller: _pageController,
                count: lottieSignUpList.length,
                textDirection: TextDirection.ltr,
                effect: const ExpandingDotsEffect(),
              ),
            ),
            RegularButtonWidget(
              text: "Get Started",
              onPressed: () => auth.signInWithGoogle(),
            )
          ],
        ),
      ),
    );
  }
}
