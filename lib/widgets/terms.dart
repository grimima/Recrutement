import 'package:flutter/material.dart';

class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Termes et Conditions'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Text(
            "Conformèment à la loi 09-08 relative à la protection des personnes physiques à l'égard du traitement des données à caractère personnel : \n\n en accédant à la plateforme de candidature et en remplissant vos informations personnelles notamment votre nom, prénom , mail électronique, votre métier actuel, vos années d'expérience et toutes autres informations mentionnées sur votre curriculum vitae, vous accorderiez au destinataire ces informations : l'équipe des Ressources Humaines de Sanlam Maroc a exclusivement le droit de collecter, enregistrer, conserver, consulter, utiliser et/ ou effacer vos informations dans le cadre de son exercice du métier de recrutement des employeurs et des stagiaires au service de la compagnie.\n\n A cet effet, la plateforme est dédiée pour collecter les curriculums vitaes sous leur forme électronique ainsi que les informations nécessaires pour traiter la candidature en question. Cependant, les élements relevants d'une nature économique et sociale sont facultatifs à remplir.\n\nIl conviendrait de noter que la conservation de ses informations durera 1 an. Aussi,toutes les mesures nécessaires pour protéger vos informations personnelles sont prises.\n\nToute personne ayant soumis ses informations personnelles a le droit de rectifier ou de supprimer ses informations en demandant au destinataire primaire adressé au courriel suivant : recrutement@sanlam.ma ou adresse physique sur siège : 216, Boulevard Zrektouni 20000.",
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
