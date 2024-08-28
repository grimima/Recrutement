import 'package:flutter/material.dart';
import 'package:recrutement/widgets/terms.dart';
import 'package:recrutement/widgets/demarage.dart';

class MyMobileBody extends StatefulWidget {
  const MyMobileBody({super.key});

  @override
  _MyMobileBodyState createState() => _MyMobileBodyState();
}

class _MyMobileBodyState extends State<MyMobileBody> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 117, 201, 1),
      body: Stack(
        children: [
          // Background image with opacity and blur
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
          ), // Content
          SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 0.0),
                    child: Image.asset(
                      'assets/BlancLogo.png',
                      height: 150,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(
                      'Bienvenue sur notre plateforme de candidature',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      padding: const EdgeInsets.all(40),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        "Vous êtes à la recherche d'une opportunité de stage ou d'emploi? \n \n Sanlam Maroc vous propose des perspectives de développement professionnel pour votre carrière et des stages pour développer vos compétences dans un environnement dynamique. \n\n Déposer votre candidature dès maintenant pour nous rejoindre ! ",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 50.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_isChecked) {
                          // Handle button press and navigate
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Demarage(),
                            ),
                          );
                        } else {
                          // Optionally, show a message or do nothing
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: const Text(
                                  'Veuillez accepter nos termes et nos conditions!',
                                  style: TextStyle(
                                      color: Color.fromRGBO(0, 117, 201, 1)),
                                  textAlign: TextAlign.center,
                                ),
                                backgroundColor: Colors.white,
                                behavior: SnackBarBehavior.floating,
                                margin: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).size.height - 50,
                                  left: 10,
                                  right: 10,
                                ),
                                elevation: 100,
                                dismissDirection: DismissDirection.none),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _isChecked
                            ? //Button color when checked
                            Colors.white
                            : const Color.fromARGB(255, 230, 218, 216),
                        foregroundColor: _isChecked
                            ? const Color.fromRGBO(
                                0, 117, 201, 1) // Text color when checked
                            : const Color.fromRGBO(0, 117, 201, 1).withOpacity(
                                0.5), // Lighter text color when not checked
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15),
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      child: const Text('Démarrer'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: _isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              _isChecked = value ?? false;
                            });
                          },
                          activeColor: Colors.white,
                          checkColor: const Color.fromRGBO(0, 117, 201, 1),
                          side: const BorderSide(color: Colors.white, width: 2),
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const TermsAndConditionsPage(),
                                ),
                              );
                            },
                            child: RichText(
                              text: const TextSpan(
                                text:
                                    'J\'accorde mon consentement aux termes et aux conditions',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Color.fromARGB(
                                      255, 150, 193, 241), // Underline color
                                ),
                              ),
                            )),
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
