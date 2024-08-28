import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recrutement/Riverpods/statemanager2e.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Step2e extends ConsumerWidget {
  final VoidCallback nextPage;
  final borderColor = const Color.fromRGBO(0, 117, 201, 1);

  const Step2e({super.key, required this.nextPage});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formState = ref.watch(Step2eProvider);
    final formNotifier = ref.read(Step2eProvider.notifier);
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 40),
              RichText(
                text: const TextSpan(
                  text: 'Les champs ',
                  style: TextStyle(color: Colors.black), // Normal text style
                  children: <TextSpan>[
                    TextSpan(
                      text: '(*)',
                      style: TextStyle(color: Colors.red), // Asterisk style
                    ),
                    TextSpan(
                      text: ' sont obligatoires',
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 800,
                child: Column(children: [
                  const SizedBox(height: 30),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: borderColor,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: borderColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: borderColor,
                          width: 2.0,
                        ),
                      ),
                      labelText: 'Quel est votre poste actuel ?',
                    ),
                  ),
                ]),
              ),
              const SizedBox(height: 20),
              Container(
                width: 800,
                margin: const EdgeInsets.all(16.0),
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromRGBO(0, 117, 201, 1),
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  children: [
                    const Text(
                      " * Quelle est votre niveau d'études",
                      style: TextStyle(fontSize: 20),
                    ),
                    const Divider(color: Color.fromRGBO(0, 117, 201, 1)),
                    FormBuilderRadioGroup<String>(
                      name: "niveauDetud",
                      decoration: const InputDecoration(
                        labelText: '',
                      ),
                      initialValue: formState.niveauDetud,
                      onChanged: (value) {
                        formNotifier.updateNiveaudetud(value);
                      },
                      options: [
                        "Niveau Bac",
                        "Bac +1",
                        "Bac +2",
                        "Bac +3",
                        "Bac +4",
                        "Bac +5",
                        "au delà Bac +5"
                      ]
                          .map((annee) => FormBuilderFieldOption(
                                value: annee,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(child: Text(annee)),
                                      ],
                                    ),
                                  ],
                                ),
                              ))
                          .toList(growable: false),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                            errorText: 'Ce champ est requis'),
                      ]),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: 800,
                margin: const EdgeInsets.all(16.0),
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromRGBO(0, 117, 201, 1),
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  children: [
                    const Text(
                      " * Combien d'expérience avez vous?",
                      style: TextStyle(fontSize: 20),
                    ),
                    const Divider(color: Color.fromRGBO(0, 117, 201, 1)),
                    FormBuilderRadioGroup<String>(
                      name: "duree",
                      decoration: const InputDecoration(
                        labelText: '',
                      ),
                      initialValue: formState.experience,
                      onChanged: (value) {
                        formNotifier.updateExperience(value);
                      },
                      options: ["0 - 2 ans", "2 - 4 ans", "6 - 8 ans", "+8 ans"]
                          .map((duree) => FormBuilderFieldOption(
                                value: duree,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(child: Text(duree)),
                                      ],
                                    ),
                                  ],
                                ),
                              ))
                          .toList(growable: false),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                            errorText: 'Ce champ est requis'),
                      ]),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: 800,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border:
                      Border.all(color: const Color.fromRGBO(0, 117, 201, 1)),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  children: [
                    const Text(
                      "Quelle est votre fourchette salariale actuelle?",
                      style: TextStyle(fontSize: 20),
                    ),
                    const Divider(color: Color.fromRGBO(0, 117, 201, 1)),
                    RadioListTile(
                      title: const Text("< 6.000 MAD"),
                      value: "moins de 6.000 MAD",
                      groupValue: formState.fourchette,
                      onChanged: (value) {
                        formNotifier.updateFourchette(value);
                      },
                    ),
                    RadioListTile(
                      title: const Text("entre 6.000 MAD et 8.000 MAD"),
                      value: "entre 6k et 8k",
                      groupValue: formState.fourchette,
                      onChanged: (value) {
                        formNotifier.updateFourchette(value);
                      },
                    ),
                    RadioListTile(
                      title: const Text("entre 8.000 MAD et 12.000 MAD"),
                      value: "entre 8k et 12k",
                      groupValue: formState.fourchette,
                      onChanged: (value) {
                        formNotifier.updateFourchette(value);
                      },
                    ),
                    RadioListTile(
                      title: const Text("entre 12.000 MAD et 16.000 MAD"),
                      value: "entre 12k et 16k",
                      groupValue: formState.fourchette,
                      onChanged: (value) {
                        formNotifier.updateFourchette(value);
                      },
                    ),
                    RadioListTile(
                      title: const Text("entre 16.000 MAD et 20.000 MAD"),
                      value: "entre 16k et 20k",
                      groupValue: formState.fourchette,
                      onChanged: (value) {
                        formNotifier.updateFourchette(value);
                      },
                    ),
                    RadioListTile(
                      title: const Text("+20.000 MAD"),
                      value: "+20k",
                      groupValue: formState.fourchette,
                      onChanged: (value) {
                        formNotifier.updateFourchette(value);
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: 800,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border:
                      Border.all(color: const Color.fromRGBO(0, 117, 201, 1)),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  children: [
                    const Text(
                      "Quelles sont vos prétentions salariale ?",
                      style: TextStyle(fontSize: 20),
                    ),
                    const Divider(color: Color.fromRGBO(0, 117, 201, 1)),
                    RadioListTile(
                      title: const Text("< 6.000 MAD"),
                      value: "moins de 6000",
                      groupValue: formState.pretention,
                      onChanged: (value) {
                        formNotifier.updatePretention(value);
                      },
                    ),
                    RadioListTile(
                      title: const Text("entre 6.000 MAD et 8.000 MAD"),
                      value: "entre 6k et 8k",
                      groupValue: formState.pretention,
                      onChanged: (value) {
                        formNotifier.updatePretention(value);
                      },
                    ),
                    RadioListTile(
                      title: const Text("entre 8.000 MAD et 12.000 MAD"),
                      value: "entre 8k et 12k",
                      groupValue: formState.pretention,
                      onChanged: (value) {
                        formNotifier.updatePretention(value);
                      },
                    ),
                    RadioListTile(
                      title: const Text("entre 12.000 MAD et 16.000 MAD"),
                      value: "entre 12k et 16k",
                      groupValue: formState.pretention,
                      onChanged: (value) {
                        formNotifier.updatePretention(value);
                      },
                    ),
                    RadioListTile(
                      title: const Text("entre 16.000 MAD et 20.000 MAD"),
                      value: "entre 16k et 20k",
                      groupValue: formState.pretention,
                      onChanged: (value) {
                        formNotifier.updatePretention(value);
                      },
                    ),
                    RadioListTile(
                      title: const Text("+20.000 MAD"),
                      value: "+20k",
                      groupValue: formState.pretention,
                      onChanged: (value) {
                        formNotifier.updatePretention(value);
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: 800,
                decoration: BoxDecoration(
                  border:
                      Border.all(color: const Color.fromRGBO(0, 117, 201, 1)),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  children: [
                    const Text(
                      "Quand seriez-vous disponible?",
                      style: TextStyle(fontSize: 20),
                    ),
                    const Divider(color: Color.fromRGBO(0, 117, 201, 1)),
                    RadioListTile(
                      title: const Text("immédiatement - 15 jours "),
                      value: "immédiatementt - 15 jours",
                      groupValue: formState.preavis,
                      onChanged: (value) {
                        formNotifier.updatePreavis(value);
                      },
                    ),
                    RadioListTile(
                      title: const Text("15 jours - 1 mois"),
                      value: "15 jours - 1 mois",
                      groupValue: formState.preavis,
                      onChanged: (value) {
                        formNotifier.updatePreavis(value);
                      },
                    ),
                    RadioListTile(
                      title: const Text("1 mois - 2 mois"),
                      value: "1 mois - 2 mois",
                      groupValue: formState.preavis,
                      onChanged: (value) {
                        formNotifier.updatePreavis(value);
                      },
                    ),
                    RadioListTile(
                      title: const Text("2 mois - 3 mois"),
                      value: "2 mois - 3 mois",
                      groupValue: formState.preavis,
                      onChanged: (value) {
                        formNotifier.updatePreavis(value);
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: nextPage,
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                        const Color.fromRGBO(0, 117, 201, 1)),
                  ),
                  child: const Text('Suivant',
                      style: TextStyle(color: Colors.white))),
            ],
          ),
        ),
      ),
    );
  }
}
