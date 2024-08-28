import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recrutement/Riverpods/statemanager1s.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class Step1s extends ConsumerWidget {
  final VoidCallback nextPage;
  final Color borderColor = const Color.fromRGBO(0, 117, 201, 1);

  const Step1s({super.key, required this.nextPage});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stageState = ref.read(stageStateProvider);
    final stageNotifier = ref.watch(stageStateProvider.notifier);
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: formKey,
            child: SizedBox(
              width: 800,
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  RichText(
                    text: const TextSpan(
                      text: 'Les champs ',
                      style:
                          TextStyle(color: Colors.black), // Normal text style
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
                    constraints: const BoxConstraints.tightFor(width: 800),
                    child: TextFormField(
                      initialValue: stageState.name,
                      onChanged: (value) {
                        stageNotifier.updateName(value);
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
                            width: 2.0,
                          ),
                        ),
                        labelText: ' * Nom',
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  ConstrainedBox(
                    constraints: const BoxConstraints.tightFor(width: 800),
                    child: TextFormField(
                      initialValue: stageState.surname,
                      onChanged: (value) {
                        stageNotifier.updateSurname(value);
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
                    constraints: const BoxConstraints.tightFor(width: 800),
                    child: TextFormField(
                      initialValue: stageState.email,
                      onChanged: (value) {
                        stageNotifier.updateEmail(value);
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
                    constraints: const BoxConstraints.tightFor(width: 800),
                    child: TextFormField(
                      initialValue: stageState.phoneNumber,
                      onChanged: (value) {
                        stageNotifier.updatePhoneNumber(value);
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
