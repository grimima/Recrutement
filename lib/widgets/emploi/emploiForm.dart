import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recrutement/widgets/emploi/first_step_emploi.dart';
import 'package:recrutement/widgets/emploi/deux_etape_emploi.dart';
import 'package:recrutement/widgets/emploi/last_step_emploi.dart';

class Emploif extends ConsumerStatefulWidget {
  const Emploif({super.key});

  @override
  _EmploifState createState() => _EmploifState();
}

class _EmploifState extends ConsumerState<Emploif>
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
          title: const Text('Pour un emploi'),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48.0), // Height of TabBar
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
                          AssetImage(
                              'assets/icons/minlogo.png'), // Ensure the correct path and extension
                          size: 24,
                        ),
                      ),
                      Tab(
                        text: 'Votre expérience',
                        icon: ImageIcon(
                          AssetImage(
                              'assets/icons/minlogo.png'), // Ensure the correct path and extension
                          size: 24,
                        ),
                      ),
                      Tab(
                        text: 'A votre CV',
                        icon: ImageIcon(
                          AssetImage(
                              'assets/icons/minlogo.png'), // Ensure the correct path and extension
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
            Step1e(nextPage: _nextPage),
            Step2e(
              nextPage: _nextPage,
            ),
            const FinalEmploi(),
          ],
        ),
      ),
    );
  }
}
