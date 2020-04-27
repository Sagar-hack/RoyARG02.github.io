import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:portfolio_source/providers/common_parameters.dart';
import 'package:portfolio_source/providers/theme_provider.dart';

import 'package:portfolio_source/sections/section_index.dart';

import 'package:portfolio_source/ui/themes.dart';
import 'package:portfolio_source/widgets/app_bar.dart';

const Duration _appBarCollapseDuration = Duration(milliseconds: 70);

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AppTheme>(
          create: (_) => AppTheme(),
        )
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anurag Roy',
      themeMode: Provider.of<AppTheme>(context).appThemeMode,
      theme: buildLightTheme(),
      darkTheme: buildDarkTheme(),
      home: Setup(),
    );
  }
}

class Setup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<CommonParameters>.value(
      value: CommonParameters(context),
      updateShouldNotify:
          (CommonParameters oldParameters, CommonParameters newParameters) =>
              false,
      child: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    // listener functions here
  }

  void _scrollAnimate({double animateTo}) async {
    await _scrollController.animateTo(
      animateTo,
      duration: _appBarCollapseDuration,
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    final double appBarExpandedHeight =
        Provider.of<CommonParameters>(context).appBarExpandedHeight;
    return Scaffold(
      body: NotificationListener<ScrollUpdateNotification>(
        onNotification: (scrollNotification) {
          // print('${scrollNotification.metrics.pixels}');
          if (scrollNotification.scrollDelta > 0.0) {
            //forward
            if (scrollNotification.metrics.pixels <
                (appBarExpandedHeight - kToolbarHeight)) {
              //TODO: Cancel intent the first time user tries to scroll
              Future.delayed(
                Duration.zero,
                () => _scrollAnimate(
                    animateTo: appBarExpandedHeight - kToolbarHeight),
              );
            }
          } else if (scrollNotification.scrollDelta < 0.0) {
            //reverse
            if (scrollNotification.metrics.pixels <
                (appBarExpandedHeight - kToolbarHeight)) {
              Future.delayed(
                Duration.zero,
                () => _scrollAnimate(animateTo: 0.0),
              );
            }
          }
          return true;
        },
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            PortfolioAppBar(),
            SliverList(
              delegate: SliverChildListDelegate.fixed(
                [
                  Intro(),
                  Intro(), //! Mock display
                  BlogsIntro(),
                  TalksIntro(),
                  ProjectsIntro(),
                  Footer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
