import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:covidstats/config/palette.dart';
import 'package:covidstats/config/styles.dart';
import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
import '../data/data.dart';

class StatsScreen extends StatefulWidget {
  @override
  _StatsScreenState createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.primaryColor,
      appBar: CustomAppBar(),
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: [
          _buildHeader(),
          _buildRegionTabBar(),
          _buildStatsTabBar(),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            sliver: SliverToBoxAdapter(
              child: StatsGrid(),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            sliver: SliverToBoxAdapter(
              child: CovidBarChart(covidCases: covidBDADailyNewCases),
            ),
          ),
        ],
      ),
    );
  }
}

SliverPadding _buildHeader() {
  return SliverPadding(
    padding: const EdgeInsets.all(20),
    sliver: SliverToBoxAdapter(
      child: Text(
        'Statistics',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

SliverToBoxAdapter _buildRegionTabBar() {
  return SliverToBoxAdapter(
    child: DefaultTabController(
      length: 2,
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 25,
        ),
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.circular(25),
        ),
        child: TabBar(
          indicator: BubbleTabIndicator(
            tabBarIndicatorSize: TabBarIndicatorSize.tab,
            indicatorHeight: 40,
            indicatorColor: Colors.white,
          ),
          labelStyle: Styles.tabTextStyle,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.white,
          tabs: [
            Text('My Country'),
            Text('Global'),
          ],
          onTap: (index) {},
        ),
      ),
    ),
  );
}

SliverPadding _buildStatsTabBar() {
  return SliverPadding(
    padding: const EdgeInsets.all(20),
    sliver: SliverToBoxAdapter(
      child: DefaultTabController(
        length: 3,
        child: TabBar(
          indicatorColor: Colors.transparent,
          tabs: [
            Text('Total'),
            Text('Today'),
            Text('Yestarday'),
          ],
        ),
      ),
    ),
  );
}
