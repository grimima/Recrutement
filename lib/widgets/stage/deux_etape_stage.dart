import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:recrutement/Riverpods/statemanager2s.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';

class Step2s extends ConsumerWidget {
  final VoidCallback nextPage;

  const Step2s({super.key, required this.nextPage});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formState = ref.watch(Step2sProvider);
    final formNotifier = ref.read(Step2sProvider.notifier);
    final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
              FormBuilder(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: 60),
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
                            " * En quelle année êtes-vous?",
                            style: TextStyle(fontSize: 20),
                          ),
                          const Divider(color: Color.fromRGBO(0, 117, 201, 1)),
                          FormBuilderRadioGroup<String>(
                            name: "annee",
                            decoration: const InputDecoration(
                              labelText: '',
                            ),
                            initialValue: formState.annee,
                            onChanged: (value) {
                              formNotifier.updateAnnee(value);
                            },
                            options: [
                              "1ère année",
                              "2ème année",
                              "3ème année",
                              "4ème année",
                              "5ème année"
                            ]
                                .map((annee) => FormBuilderFieldOption(
                                      value: annee,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                            " * Quel est le type de votre stage ?",
                            style: TextStyle(fontSize: 20),
                          ),
                          const Divider(color: Color.fromRGBO(0, 117, 201, 1)),
                          FormBuilderRadioGroup<String>(
                            name: "convention",
                            decoration: const InputDecoration(
                              labelText: '',
                            ),
                            initialValue: formState.convention,
                            onChanged: (value) {
                              formNotifier.updateConvention(value);
                            },
                            options: ["Non Conventioné", "Conventioné"]
                                .map((type) => FormBuilderFieldOption(
                                      value: type,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(child: Text(type)),
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
                          if (formState.convention == "Conventioné")
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: FormBuilderRadioGroup<String>(
                                name: "typestage",
                                decoration: const InputDecoration(
                                  labelText: '',
                                ),
                                initialValue: formState.typestage,
                                onChanged: (value) {
                                  formNotifier.updateTypestage(value);
                                },
                                options: ["PFE", "Apprentissage", "Observation"]
                                    .map((type) => FormBuilderFieldOption(
                                          value: type,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Expanded(child: Text(type)),
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
                            ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(16.0),
                      padding: const EdgeInsets.all(16.0),
                      width: 800,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromRGBO(0, 117, 201, 1)),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Column(
                        children: [
                          const Text(
                            " *Pour quand vous prévoyez votre stage?",
                            style: TextStyle(fontSize: 20),
                          ),
                          const Divider(color: Color.fromRGBO(0, 117, 201, 1)),
                          Card(
                            margin: const EdgeInsets.all(8.0),
                            elevation: 5.0,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              side: BorderSide(
                                color: Color.fromRGBO(0, 117, 201, 1),
                                width: 2.0,
                              ),
                            ),
                            child: FormBuilderDateTimePicker(
                              name: 'calendar',
                              inputType: InputType.date,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Sélectionner une date',
                                contentPadding: EdgeInsets.all(16.0),
                              ),
                              format: DateFormat("yyyy-MM-dd"),
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime.utc(2026),
                              locale: const Locale('fr', 'FR'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50),
                    ElevatedButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (formKey.currentState!.validate()) {
                          // If the form is valid, proceed to the next page
                          nextPage();
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                          const Color.fromRGBO(0, 117, 201, 1),
                        ),
                      ),
                      child: const Text(
                        'Suivant',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
