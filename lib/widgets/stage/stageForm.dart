import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recrutement/widgets/stage/first_step_stage.dart';
import 'package:recrutement/widgets/stage/deux_etape_stage.dart';
import 'package:recrutement/widgets/stage/last_step_stage.dart';

class Stageo extends ConsumerStatefulWidget {
  const Stageo({super.key});

  @override
  _StageoState createState() => _StageoState();
}

class _StageoState extends ConsumerState<Stageo>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_tabController.index < _tabController.length - 1) {
      _tabController.animateTo(_tabController.index + 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Pour un stage'),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 500,
                  child: TabBar(
                    isScrollable: true,
                    controller: _tabController,
                    indicatorColor: const Color.fromRGBO(130, 84, 116, 1),
                    labelColor: const Color.fromRGBO(130, 84, 116, 1),
                    unselectedLabelColor: Colors.blue,
                    labelStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    unselectedLabelStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    tabs: const [
                      Tab(
                        text: 'Identification',
                        icon: ImageIcon(
                          AssetImage('assets/icons/minlogo.png'),
                          size: 24,
                        ),
                      ),
                      Tab(
                        text: 'A propos du stage',
                        icon: ImageIcon(
                          AssetImage('assets/icons/minlogo.png'),
                          size: 24,
                        ),
                      ),
                      Tab(
                        text: 'A votre CV',
                        icon: ImageIcon(
                          AssetImage('assets/icons/minlogo.png'),
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            Step1s(nextPage: _nextPage),
            Step2s(nextPage: _nextPage),
            const FinalStage(),
          ],
        ),
      ),
    );
  }
}
