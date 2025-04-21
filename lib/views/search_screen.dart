// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:test_app/core/theme/app_colors.dart';
import 'package:test_app/core/utils/app_icons.dart';
import 'package:test_app/core/utils/app_sizing.dart';
import 'package:test_app/core/utils/extensions.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with WidgetsBindingObserver, SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    currentBrightness = WidgetsBinding.instance.window.platformBrightness;
    loadMapStyle(currentBrightness!);
    _animationController = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );
    _scaleAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.elasticOut,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_options.isEmpty) {
      _options = [
        {
          "title": context.texts.cosyAreas,
          "icon": AppIcons.shieldTick,
          "isSelected": true,
        },
        {
          "title": context.texts.price,
          "icon": AppIcons.emptyWalletOutline,
          "isSelected": false,
        },
        {
          "title": context.texts.infrastructure,
          "icon": AppIcons.bag,
          "isSelected": false,
        },
        {
          "title": context.texts.withoutAnyLayer,
          "icon": AppIcons.layer,
          "isSelected": false,
        },
      ];

      _selectedOption = _options.firstWhere((e) => e['isSelected']);
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _animationController.dispose();
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    final newBrightness = WidgetsBinding.instance.window.platformBrightness;
    if (newBrightness != currentBrightness) {
      currentBrightness = newBrightness;
      loadMapStyle(newBrightness);
    }
  }

  final Completer<GoogleMapController> googleMapController = Completer();
  String mapStyle = '';
  Brightness? currentBrightness;

  CameraPosition initialCameraPosition = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  CameraPosition kLake = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(37.43296265331129, -122.08832357078792),
    tilt: 59.440717697143555,
    zoom: 19.151926040649414,
  );

  Future<void> goToTheLake() async {
    final GoogleMapController controller = await googleMapController.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(kLake));
  }

  Future<void> loadMapStyle(Brightness brightness) async {
    final stylePath =
        brightness == Brightness.dark
            ? 'assets/map_styles/dark_map_style.json'
            : 'assets/map_styles/light_map_style.json';

    mapStyle = await rootBundle.loadString(stylePath);
    final controller = await googleMapController.future;
    controller.setMapStyle(mapStyle);
    setState(() {});
  }

  var optionsIsVisible = false;
  var withoutAnyLayers = false;

  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  List<Map<String, dynamic>> _options = [];

  Map<String, dynamic> _selectedOption = {};

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: (controller) async {
              googleMapController.complete(controller);
            },
            style: mapStyle,
            onTap: (position) {
              setState(() {
                optionsIsVisible = false;
                _animationController.reverse(from: 1);
              });
            },
            initialCameraPosition: initialCameraPosition,
            padding: EdgeInsets.only(bottom: 80),
            zoomControlsEnabled: false,
            myLocationEnabled: true,
          ),
          mapItem(
            context,
            top: 140,
            left: 80,
            text: "10,3 mn P",
            withoutAnyLayers: withoutAnyLayers,
          ),
          mapItem(
            context,
            top: 200,
            left: 120,
            text: "10,3 mn P",
            withoutAnyLayers: withoutAnyLayers,
          ),
          mapItem(
            context,
            top: 320,
            left: 60,
            text: "10,3 mn P",
            withoutAnyLayers: withoutAnyLayers,
          ),
          mapItem(
            context,
            top: 240,
            right: 60,
            text: "10,3 mn P",
            withoutAnyLayers: withoutAnyLayers,
          ),
          mapItem(
            context,
            top: 360,
            right: 60,
            text: "10,3 mn P",
            withoutAnyLayers: withoutAnyLayers,
          ),
          mapItem(
            context,
            top: 450,
            right: 100,
            text: "6,95 mn P",
            withoutAnyLayers: withoutAnyLayers,
          ),
          AnimatedPositioned(
            top: 60,
            left: (context.width - 200) / 4,
            duration: Duration(milliseconds: 300),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 10,
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  padding: EdgeInsets.all(Insets.med),
                  decoration: BoxDecoration(
                    color: AppColors.lightBackgroundColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    spacing: Insets.med,
                    children: [
                      SvgPicture.asset(
                        AppIcons.searchNormalOutline,
                        colorFilter: ColorFilter.mode(
                          AppColors.gray[500]!,
                          BlendMode.srcIn,
                        ),
                        height: 18,
                        width: 18,
                      ),
                      Text(
                        textAlign: TextAlign.start,
                        "Saint Petersburg",
                        style: context.textStyle.bodyLgMedium.copyWith(
                          color: AppColors.gray[500]!,
                          fontSize: 14,
                        ),
                      ),
                      60.toWidth,
                    ],
                  ),
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  padding: EdgeInsets.all(Insets.med),
                  decoration: BoxDecoration(
                    color: AppColors.lightBackgroundColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      AppIcons.candleOutline,
                      colorFilter: ColorFilter.mode(
                        AppColors.gray[500]!,
                        BlendMode.srcIn,
                      ),
                      height: 18,
                      width: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            bottom: context.height * .22,
            left: 40,
            child: InkWell(
              onTap: () {
                setState(() {
                  optionsIsVisible = !optionsIsVisible;
                  if (optionsIsVisible) {
                    _animationController.forward(from: 0);
                  }
                });
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Opacity(
                    opacity: .6,
                    child: Container(
                      height: 45,
                      width: 45,
                      padding: EdgeInsets.all(Insets.sm),
                      decoration: BoxDecoration(
                        color:
                            isDarkMode
                                ? AppColors.gray[200]
                                : AppColors.gray[850],
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  SvgPicture.asset(
                    _selectedOption["icon"] as String,
                    colorFilter: ColorFilter.mode(
                      AppColors.lightBackgroundColor,
                      BlendMode.srcIn,
                    ),
                    height: 18,
                    width: 18,
                  ),
                ],
              ).elasticIn(
                duration: const Duration(milliseconds: 1000),
                curve: Curves.easeInOut,
              ),
            ),
          ),
          optionsIsVisible
              ? AnimatedPositioned(
                bottom: context.height * .22,
                left: 40,
                duration: Duration(milliseconds: 200),
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  alignment: Alignment.bottomLeft,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 800),
                    padding: EdgeInsets.symmetric(
                      horizontal: Insets.med,
                      vertical: Insets.med,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.lightBackgroundColor,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(_options.length, (index) {
                        final option = _options[index];
                        return InkWell(
                          onTap: () {
                            setState(() {
                              optionsIsVisible = false;
                              for (var i = 0; i < _options.length; i++) {
                                _options[i]["isSelected"] = i == index;
                                if (i == index) {
                                  _selectedOption = _options[i];
                                  withoutAnyLayers = i == _options.length - 1;
                                }
                              }
                            });
                            _animationController.reverse(from: 1);
                            debugPrint("withoutAnyLayers: $withoutAnyLayers");
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  option["icon"],
                                  colorFilter: ColorFilter.mode(
                                    option["isSelected"]
                                        ? context.colorScheme.primary
                                        : AppColors.gray[500]!,
                                    BlendMode.srcIn,
                                  ),
                                  height: 18,
                                  width: 18,
                                ),
                                SizedBox(width: Insets.med),
                                Text(
                                  option["title"],
                                  style: context.textStyle.bodyLgMedium
                                      .copyWith(
                                        color:
                                            option["isSelected"]
                                                ? context.colorScheme.primary
                                                : AppColors.gray[500]!,
                                        fontSize: 14,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              )
              : SizedBox(),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            bottom: context.height * .152,
            left: 40,
            child: InkWell(
              onTap: goToTheLake,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Opacity(
                    opacity: .6,
                    child: Container(
                      height: 45,
                      width: 45,
                      padding: EdgeInsets.all(Insets.sm),
                      decoration: BoxDecoration(
                        color:
                            isDarkMode
                                ? AppColors.gray[200]
                                : AppColors.gray[850],
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Transform.rotate(
                    angle: pi / 4,
                    child: SvgPicture.asset(
                      AppIcons.directUp,
                      colorFilter: ColorFilter.mode(
                        AppColors.lightBackgroundColor,
                        BlendMode.srcIn,
                      ),
                      height: 18,
                      width: 18,
                    ),
                  ),
                ],
              ).elasticIn(
                duration: const Duration(milliseconds: 1000),
                curve: Curves.easeInOut,
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            bottom: context.height * .152,
            right: 20,
            child: InkWell(
              onTap: () {},
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Opacity(
                    opacity: .6,
                    child: Container(
                      height: 50,
                      constraints: BoxConstraints(minWidth: context.width * .5),
                      padding: EdgeInsets.all(Insets.sm),
                      decoration: BoxDecoration(
                        color:
                            isDarkMode
                                ? AppColors.gray[200]
                                : AppColors.gray[850],
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    spacing: 10,
                    children: [
                      SvgPicture.asset(
                        AppIcons.textAlignLeft,
                        colorFilter: ColorFilter.mode(
                          AppColors.lightBackgroundColor,
                          BlendMode.srcIn,
                        ),
                        height: 18,
                        width: 18,
                      ),
                      Text(
                        context.texts.listOfVariants,
                        style: context.textStyle.bodyLgMedium.copyWith(
                          color: AppColors.lightBackgroundColor,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ).elasticIn(
                duration: const Duration(milliseconds: 1000),
                curve: Curves.easeInOut,
              ),
            ),
          ),
        ],
      ),
    );
  }

  mapItem(
    BuildContext context, {
    required String text,
    required double top,
    double? right,
    double? left,
    required bool withoutAnyLayers,
  }) {
    return AnimatedPositioned(
      top: top,
      right: right,
      left: left,
      duration: Duration(milliseconds: 800),
      child: AnimatedContainer(
        constraints: BoxConstraints(
          maxWidth: withoutAnyLayers ? context.width * .13 : context.width * .2,
        ),
        duration: Duration(milliseconds: 800),
        padding: EdgeInsets.symmetric(
          horizontal: Insets.sm,
          vertical: Insets.med,
        ),
        decoration: BoxDecoration(
          color: context.colorScheme.primary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(12),
          ),
        ),
        child:
            withoutAnyLayers
                ? Expanded(
                  child: SvgPicture.asset(
                    AppIcons.building,
                    colorFilter: ColorFilter.mode(
                      AppColors.lightBackgroundColor,
                      BlendMode.srcIn,
                    ),
                    height: 18,
                    width: 18,
                  ).fadeIn(
                    duration: const Duration(milliseconds: 1000),
                    curve: Curves.easeInOut,
                  ),
                )
                : Expanded(
                  child: Text(
                    text,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,

                    style: context.textStyle.bodyLgMedium.copyWith(
                      color: AppColors.lightBackgroundColor,
                      fontSize: 12,
                    ),
                  ).fadeIn(
                    duration: const Duration(milliseconds: 1000),
                    curve: Curves.easeInOut,
                  ),
                ),
      ).elasticIn(
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeInOut,
      ),
    );
  }
}
