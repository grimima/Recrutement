import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recrutement/Riverpods/statemanager1e.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Step1e extends ConsumerWidget {
  final VoidCallback nextPage;
  final Color borderColor = const Color.fromRGBO(0, 117, 201, 1);

  const Step1e({super.key, required this.nextPage});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final State = ref.read(Emploi1StateProvider);
    final Notifier = ref.watch(Emploi1StateProvider.notifier);
    final formKey = GlobalKey<FormState>();

    return Scaffold(
        body: SingleChildScrollView(
            child: Center(
      child: Form(
        key: formKey,
        child: SizedBox(
          width: 800,
          child: Column(children: [
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

            const SizedBox(height: 20), // Adjust the spacing as needed
            ConstrainedBox(
              constraints: const BoxConstraints.tightFor(width: 750),
              child: TextFormField(
                initialValue: State.name,
                onChanged: (value) {
                  Notifier.updateName(value);
                },
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                      errorText: 'Veuillez entrer votre nom')
                ]),
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
                    ),
                  ),
                  labelText: ' * Nom',
                ),
              ),
            ),
            const SizedBox(height: 30),
            ConstrainedBox(
              constraints: const BoxConstraints.tightFor(width: 750),
              child: TextFormField(
                initialValue: State.surname,
                onChanged: (value) {
                  Notifier.updateSurname(value);
                },
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                      errorText: 'Veuillez entrer votre prénom')
                ]),
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
                  labelText: ' * Prénom',
                ),
              ),
            ),
            const SizedBox(height: 30),
            ConstrainedBox(
              constraints: const BoxConstraints.tightFor(width: 750),
              child: TextFormField(
                initialValue: State.email,
                onChanged: (value) {
                  Notifier.updateEmail(value);
                },
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                      errorText: 'Veuillez entrer votre email'),
                  FormBuilderValidators.email(
                      errorText: 'Veuillez entrer un email valide'),
                ]),
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
                  labelText: ' * Email',
                ),
              ),
            ),
            const SizedBox(height: 30),
            ConstrainedBox(
              constraints: const BoxConstraints.tightFor(width: 750),
              child: TextFormField(
                initialValue: State.phoneNumber,
                onChanged: (value) {
                  Notifier.updatePhoneNumber(value);
                },
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
                  labelText: 'Numéro de téléphone',
                ),
              ),
            ),
            const SizedBox(height: 50),
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
                    " *Avez-vous un/des membre(s) de votre famille qui travaille(ent) au sein de Sanlam?",
                    style: TextStyle(fontSize: 20),
                  ),
                  const Divider(color: Color.fromRGBO(0, 117, 201, 1)),
                  FormBuilderRadioGroup<String>(
                    name: "connaissance",
                    decoration: const InputDecoration(
                      labelText: '',
                    ),
                    initialValue: State.connaissance,
                    options: ["Oui", "Non "]
                        .map((type) => FormBuilderFieldOption(
                              value: type,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                ],
              ),
            ),
            const SizedBox(height: 30),
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
                    " D'où avez-vous entendu de notre plateforme*?",
                    style: TextStyle(fontSize: 20),
                  ),
                  const Divider(color: Color.fromRGBO(0, 117, 201, 1)),
                  FormBuilderRadioGroup<String>(
                    name: "connaissance",
                    decoration: const InputDecoration(
                      labelText: '',
                    ),
                    initialValue: State.connaissance,
                    options: [
                      "Candidature spontanée",
                      "Candidature spontanée sur siège",
                      "Linkedin",
                      "Forum",
                      "Autres"
                    ]
                        .map((type) => FormBuilderFieldOption(
                              value: type,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                ],
              ),
            ),

            ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (formKey.currentState!.validate()) {
                  _postData(State.name, State.surname, State.email,
                      State.phoneNumber);
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
          ]),
        ),
      ),
    )));
  }
}
