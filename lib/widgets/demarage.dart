import 'package:flutter/material.dart';
import 'package:recrutement/widgets/emploi/emploiForm.dart';
import 'package:recrutement/widgets/stage/stageForm.dart';

class Demarage extends StatelessWidget {
  const Demarage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(0, 117, 201, 1),
                  Color.fromRGBO(0, 24, 77, 1)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/icons/Logonew.png',
                          height: 50,
                          width: 50,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'Que recherchez vous ?',
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 100.0),
                        SizedBox(
                          width: 200,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Stageo()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor:
                                  const Color.fromRGBO(0, 117, 201, 1.0),
                              backgroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 16.0),
                              textStyle: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            child: const Text('STAGE'),
                          ),
                        ),
                        const SizedBox(
                          width: 100,
                          height: 50.0,
                        ), // Space between buttons
                        SizedBox(
                          width: 200,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Emploif()),
                              );
                              // Navigate to the appropriate page for "Emploi"
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor:
                                  const Color.fromRGBO(0, 117, 201, 1.0),
                              backgroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 16.0),
                              textStyle: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            child: const Text('EMPLOI'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
