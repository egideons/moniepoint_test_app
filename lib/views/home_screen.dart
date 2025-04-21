// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_counter/smooth_counter.dart';
import 'package:test_app/core/theme/app_colors.dart';
import 'package:test_app/core/utils/app_icons.dart';
import 'package:test_app/core/utils/app_images.dart';
import 'package:test_app/core/utils/app_sizing.dart';
import 'package:test_app/core/utils/extensions.dart';
import 'package:test_app/widgets/home_top_background_blur.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    scrollController.addListener(_scrollListener);
    _incrementCounter();
    _growContainers();

    super.initState();
  }

  //================ Controllers =================\\
  var scrollController = ScrollController();

  //================ Variables =================\\
  double _fullWidthAddressContainer = 60;
  double _halfWidthAddressContainer = 40;

  //================ Booleans =================\\
  var scrollToTopBtnVisible = false;
  var showText = false;

  //================ Scroll Listener =================//
  void _scrollListener() {
    //========= Show action button ========//
    if (scrollController.position.pixels >= 100) {
      setState(() {
        scrollToTopBtnVisible = true;
      });
    }
    //========= Hide action button ========//
    else if (scrollController.position.pixels < 100) {
      setState(() {
        scrollToTopBtnVisible = false;
      });
    }
  }

  //================ Scroll to Top =================//
  void scrollToTop() => scrollController.animateTo(
    0,
    duration: const Duration(seconds: 1),
    curve: Curves.fastOutSlowIn,
  );

  int _buyCounter = 0;
  int _rentCounter = 0;

  void _incrementCounter() async {
    await Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _buyCounter += 1034;
        _rentCounter += 2212;
      });
    });
  }

  void _growContainers() {
    Future.delayed(Duration.zero, () {
      final fullWidth = MediaQuery.of(context).size.width - 50;
      final halfWidth = MediaQuery.of(context).size.width / 2.8;

      setState(() {
        _fullWidthAddressContainer = fullWidth;
        _halfWidthAddressContainer = halfWidth;
        showText = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: context.colorScheme.surface,
      floatingActionButton:
          scrollToTopBtnVisible
              ? Padding(
                padding: EdgeInsets.only(bottom: 80),
                child: FloatingActionButton.small(
                  onPressed: scrollToTop,
                  backgroundColor: context.colorScheme.primary,
                  tooltip: "Scroll to top",
                  enableFeedback: true,
                  focusColor: context.colorScheme.primary,
                  hoverColor: context.colorScheme.primary,
                  foregroundColor: Colors.white,
                  child: const Icon(Icons.keyboard_arrow_up),
                ).fadeInUp(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                ),
              )
              : const SizedBox(),
      body: Scrollbar(
        child: CustomScrollView(
          controller: scrollController,
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          slivers: [
            SliverAppBar(
              backgroundColor: context.colorScheme.surface,
              elevation: 0,
              floating: true,
              pinned: true,
              snap: true,
              automaticallyImplyLeading: false,
              forceMaterialTransparency: true,
              actionsPadding: EdgeInsets.only(right: Insets.sm),
              toolbarHeight: SmallInsets().appBarHeight,
              title: homeAppBarTitle(context),
              centerTitle: false,
              actions: [homeAppBarProfilePic()],
            ),

            SliverToBoxAdapter(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: context.height / 1.6,
                      child: Stack(
                        children: [
                          HomeTopBackgroundBlur(),
                          AnimatedPositioned(
                            top: 20,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                            child: Container(
                              padding: EdgeInsets.all(Insets.sm),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    context.texts.hi("Gideon"),
                                    style: context.textStyle.titleLgMedium
                                        .copyWith(
                                          color: context.colorScheme.secondary,
                                          fontWeight: FontWeight.w400,
                                        ),
                                  ).fadeIn(
                                    duration: const Duration(milliseconds: 800),
                                    curve: Curves.easeIn,
                                  ),
                                  6.toHeight,
                                  Text(
                                    context.texts.letsSelectYourPerfectPlace,
                                    style: context.textStyle.titleLgMedium
                                        .copyWith(
                                          color:
                                              isDarkMode
                                                  ? AppColors.gray[400]!
                                                  : context
                                                      .colorScheme
                                                      .tertiary,
                                          fontSize: 32,
                                          fontWeight: FontWeight.w400,
                                        ),
                                  ).fadeInUp(
                                    from: 10,
                                    duration: const Duration(milliseconds: 800),
                                    curve: Curves.easeIn,
                                  ),
                                  40.toHeight,
                                  Container(
                                    padding: EdgeInsets.only(right: Insets.lg),
                                    child: Row(
                                      spacing: Insets.sm,
                                      children: [
                                        Container(
                                          constraints: BoxConstraints(
                                            maxHeight: 166,
                                            maxWidth: 166,
                                          ),
                                          padding: EdgeInsets.all(Insets.med),
                                          decoration: BoxDecoration(
                                            color: context.colorScheme.primary
                                                .withOpacity(.8),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  context.texts.buy
                                                      .toUpperCase(),
                                                  style: context
                                                      .textStyle
                                                      .titleMdMedium
                                                      .copyWith(
                                                        color:
                                                            AppColors
                                                                .lightBackgroundColor,
                                                      ),
                                                ),
                                                20.toHeight,
                                                SmoothCounter(
                                                  count: _buyCounter,
                                                  duration: Duration(
                                                    milliseconds: 4000,
                                                  ),
                                                  textStyle: context
                                                      .textStyle
                                                      .titleLgBold
                                                      .copyWith(
                                                        fontSize: 40,
                                                        color:
                                                            AppColors
                                                                .lightBackgroundColor,
                                                      ),
                                                ),

                                                Text(
                                                  context.texts.offers
                                                      .toLowerCase(),
                                                  style: context
                                                      .textStyle
                                                      .titleMdMedium
                                                      .copyWith(
                                                        color:
                                                            AppColors
                                                                .lightBackgroundColor,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ).elasticIn(
                                          duration: const Duration(
                                            milliseconds: 800,
                                          ),
                                          curve: Curves.easeIn,
                                        ),
                                        Container(
                                          constraints: BoxConstraints(
                                            maxHeight: 166,
                                            maxWidth: 166,
                                          ),
                                          padding: EdgeInsets.all(Insets.med),
                                          decoration: ShapeDecoration(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            gradient: LinearGradient(
                                              begin: Alignment.bottomRight,
                                              end: Alignment.topLeft,
                                              colors: [
                                                Color(0xFFFFFFFF),
                                                Color(0xFFFFEEDB),
                                                Color(0xFFFCEFDF),
                                                Color(0xFFFFFFFF),
                                                Color(0xFFFFFFFF),
                                              ],
                                            ),
                                          ),
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  context.texts.rent
                                                      .toUpperCase(),
                                                  style: context
                                                      .textStyle
                                                      .titleMdMedium
                                                      .copyWith(
                                                        color:
                                                            context
                                                                .colorScheme
                                                                .secondary,
                                                      ),
                                                ),
                                                20.toHeight,
                                                SmoothCounter(
                                                  count: _rentCounter,
                                                  duration: Duration(
                                                    milliseconds: 4000,
                                                  ),
                                                  textStyle: context
                                                      .textStyle
                                                      .titleLgBold
                                                      .copyWith(
                                                        fontSize: 40,
                                                        color:
                                                            context
                                                                .colorScheme
                                                                .secondary,
                                                      ),
                                                ),

                                                Text(
                                                  context.texts.offers
                                                      .toLowerCase(),
                                                  style: context
                                                      .textStyle
                                                      .titleMdMedium
                                                      .copyWith(
                                                        color:
                                                            context
                                                                .colorScheme
                                                                .secondary,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ).elasticIn(
                                    duration: const Duration(milliseconds: 800),
                                    curve: Curves.easeIn,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Transform.translate(
                      offset: const Offset(0, -50),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.only(
                          top: 10,
                          bottom: 50,
                          right: 10,
                          left: 10,
                        ),
                        decoration: BoxDecoration(
                          color: context.colorScheme.surface,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(32),
                            topRight: Radius.circular(32),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: context.width,
                              height: 200,
                              padding: EdgeInsets.all(Insets.med),
                              decoration: ShapeDecoration(
                                color: context.colorScheme.primary.withOpacity(
                                  .2,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                image: DecorationImage(
                                  image: AssetImage(AppImages.home1),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: addressContainer(
                                context,
                                text: "Gladkova St., 25",
                                containerWidth: _fullWidthAddressContainer,
                                addressContainerHeight: 60,
                                addressContainerIconHeight: 50,
                                addressContainerIconWidth: 50,
                                fontSize: 14,
                              ),
                            ),
                            10.toHeight,
                            Row(
                              spacing: Insets.sm,
                              children: [
                                Expanded(
                                  child: Container(
                                    constraints: BoxConstraints(
                                      maxWidth: context.width * 0.55,
                                      maxHeight: 400,
                                    ),
                                    padding: EdgeInsets.all(Insets.med),
                                    decoration: ShapeDecoration(
                                      color: context.colorScheme.primary
                                          .withOpacity(.2),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(32),
                                      ),
                                      image: DecorationImage(
                                        image: AssetImage(AppImages.home2),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: addressContainer(
                                      context,
                                      text: "Gubina St., 11",
                                      containerWidth:
                                          _halfWidthAddressContainer,
                                      addressContainerHeight: 40,
                                      addressContainerIconHeight: 30,
                                      addressContainerIconWidth: 30,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Container(
                                      constraints: BoxConstraints(
                                        maxWidth: context.width * 0.45,
                                        maxHeight: 196,
                                      ),
                                      padding: EdgeInsets.all(Insets.med),
                                      decoration: ShapeDecoration(
                                        color: context.colorScheme.primary
                                            .withOpacity(.2),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            32,
                                          ),
                                        ),
                                        image: DecorationImage(
                                          image: AssetImage(AppImages.home3),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      child: addressContainer(
                                        context,
                                        text: "Trefoleva St., 43",
                                        containerWidth:
                                            _halfWidthAddressContainer,
                                        addressContainerHeight: 40,
                                        addressContainerIconHeight: 30,
                                        addressContainerIconWidth: 30,
                                        fontSize: 10,
                                      ),
                                    ),
                                    14.toHeight,
                                    Container(
                                      constraints: BoxConstraints(
                                        maxWidth: context.width * 0.45,
                                        maxHeight: 196,
                                      ),
                                      padding: EdgeInsets.all(Insets.med),
                                      decoration: ShapeDecoration(
                                        color: context.colorScheme.primary
                                            .withOpacity(.2),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            32,
                                          ),
                                        ),
                                        image: DecorationImage(
                                          image: AssetImage(AppImages.home4),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      child: addressContainer(
                                        context,
                                        text: "Sedova St., 22",
                                        containerWidth:
                                            _halfWidthAddressContainer,
                                        addressContainerHeight: 40,
                                        addressContainerIconHeight: 30,
                                        addressContainerIconWidth: 30,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ).slideUp(
                      duration: const Duration(milliseconds: 1000),
                      curve: Curves.easeIn,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  addressContainer(
    BuildContext context, {
    required double containerWidth,
    required double addressContainerHeight,
    required double addressContainerIconHeight,
    required double addressContainerIconWidth,
    required double fontSize,
    required String text,
  }) {
    return Stack(
      children: [
        AnimatedPositioned(
          duration: const Duration(milliseconds: 2000),
          curve: Curves.easeIn,
          left: 5,
          bottom: 0,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 2000),
            curve: Curves.easeIn,
            width: containerWidth,
            height: addressContainerHeight,
            decoration: ShapeDecoration(
              color: Colors.white.withOpacity(0.2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(60),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
                child: Row(
                  children: [
                    Expanded(
                      child:
                          showText
                              ? Text(
                                text,
                                textAlign: TextAlign.center,
                                style: context.textStyle.bodyLgMedium.copyWith(
                                  color: AppColors.gray[900]!,
                                  fontSize: fontSize,
                                ),
                              ).fadeIn(
                                duration: const Duration(milliseconds: 2000),
                                curve: Curves.easeIn,
                              )
                              : SizedBox(),
                    ),
                    Container(
                      width: addressContainerIconWidth,
                      height: addressContainerIconHeight,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 4,
                      ),
                      decoration: const ShapeDecoration(
                        color: Colors.white,
                        shape: CircleBorder(),
                      ),
                      child: Icon(
                        Icons.chevron_right,
                        color: context.colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  homeAppBarProfilePic() {
    return AspectRatio(
      aspectRatio: 1,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(250)),
        child: Image.asset(AppImages.me, fit: BoxFit.cover).elasticIn(
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeIn,
        ),
      ),
    );
  }

  homeAppBarTitle(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Insets.med,
        vertical: Insets.med,
      ),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: context.colorScheme.surface,
        shadows: [
          BoxShadow(
            color: AppColors.gray[400]!.withOpacity(.2),
            blurRadius: 5,
            offset: Offset(2, 2),
            spreadRadius: .5,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(
            AppIcons.location,
            colorFilter: ColorFilter.mode(
              context.colorScheme.secondary,
              BlendMode.srcIn,
            ),
          ),
          Text(
            context.texts.saintPetersburg,
            style: context.textStyle.titleMdMedium.copyWith(
              color: context.colorScheme.secondary,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ).fadeIn(
        duration: const Duration(milliseconds: 1400),
        curve: Curves.easeIn,
      ),
    ).slideInLeft(
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeIn,
    );
  }
}
