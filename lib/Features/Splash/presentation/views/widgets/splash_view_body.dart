import 'package:bookly/Core/app_router.dart';
import 'package:bookly/Features/Splash/presentation/views/widgets/slide_text.dart';
import 'package:bookly/Features/home/presentation/views/home_view.dart';
import 'package:bookly/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplshViewBody extends StatefulWidget {
  const SplshViewBody({super.key});

  @override
  State<SplshViewBody> createState() => _SplshViewBodyState();
}

class _SplshViewBodyState extends State<SplshViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(kLogo),
          const SizedBox(
            height: 22,
          ),
          SlidingText(slidingAnimation: slidingAnimation),
        ],
      ),
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 2), () {
      // Get.to(() => const HomePage(),
      //     transition: Transition.fade, duration: kTranstionDuration);
      GoRouter.of(context).push(AppRouter.kHomePage);
    });
  }
}
