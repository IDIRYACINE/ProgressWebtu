import 'package:flutter/material.dart';
import 'package:progresswebtu/constants/measures.dart';
import 'package:progresswebtu/widgets/appbars.dart';
import 'package:progresswebtu/widgets/labels.dart';
import 'logic.dart';


class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  final crossAxisCount = 2;

  final HomeViewLogic logic = const HomeViewLogic();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: MainAppBar(onSettingsPressed: logic.onSettingsPressed,),
      body: Padding(
        padding: const EdgeInsets.all(AppMeasures.bodyPaddingsMeduim),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child : Padding(
                padding: EdgeInsets.only(bottom: AppMeasures.bodyPaddingsMeduim,top: AppMeasures.bodyPaddingsMeduim),
                child: ProgresBannerLabel()),
            ),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: AppMeasures.gridCrossAxisSpacing,
                  mainAxisSpacing: AppMeasures.gridCrossAxisSpacing,
                  crossAxisCount: crossAxisCount),
              delegate: SliverChildBuilderDelegate(logic.gridItemBuilder,
                  childCount: logic.routes.length),
            ),
          ],
        ),
      ),
    );
  }
}
