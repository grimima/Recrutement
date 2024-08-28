import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recrutement/Riverpods/statemanager1s.dart';
import 'package:recrutement/Riverpods/statemanager2s.dart';
import 'package:recrutement/Riverpods/statemanager3s.dart';
import 'package:accordion/accordion.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FinalStage extends ConsumerWidget {
  const FinalStage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(finalStageProvider);
    final finalStageNotifier = ref.read(finalStageProvider.notifier);
    final forming1 = ref.watch(Step2sProvider);
    final forming = ref.watch(stageStateProvider);
    final fileState = ref.watch(fileProvider);

    final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

    return Scaffold(
        body: SingleChildScrollView(
            child: Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
        const SizedBox(height: 20),
        FormBuilder(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(16.0),
                padding: const EdgeInsets.all(0),
                width: 800,
                decoration: BoxDecoration(
                  border:
                      Border.all(color: const Color.fromRGBO(0, 117, 201, 1)),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  children: [
                    const Text(
                      " Par quel métier êtes vous intéressé ? *",
                      style: TextStyle(fontSize: 20),
                    ),
                    const Divider(color: Color.fromRGBO(0, 117, 201, 1)),
                    Accordion(
                      paddingListTop: 0,
                      paddingListBottom: 0,
                      maxOpenSections: 1,
                      headerBorderColor: Colors.white,
                      headerBackgroundColorOpened:
                          const Color.fromRGBO(130, 84, 116, 1),
                      headerPadding: const EdgeInsets.symmetric(
                          vertical: 7, horizontal: 15),
                      children: [
                        AccordionSection(
                          isOpen: false,
                          leftIcon: const Icon(Icons.apartment_sharp,
                              color: Colors.white),
                          headerBackgroundColor:
                              const Color.fromRGBO(0, 117, 201, 1),
                          headerBackgroundColorOpened:
                              const Color.fromRGBO(130, 84, 116, 1),
                          header: const Text('Métiers de support',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                              textAlign: TextAlign.center),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Accordion(
                                paddingListTop: 0,
                                paddingListBottom: 0,
                                maxOpenSections: 1,
                                headerBorderColor: Colors.white,
                                headerBackgroundColorOpened:
                                    const Color.fromRGBO(130, 84, 116, 1),
                                headerPadding: const EdgeInsets.symmetric(
                                    vertical: 7, horizontal: 15),
                                children: [
                                  AccordionSection(
                                    isOpen: false,
                                    header: const Text("Solution factory",
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.white),
                                        textAlign: TextAlign.center),
                                    headerBackgroundColor:
                                        const Color.fromRGBO(0, 117, 201, 1),
                                    headerBackgroundColorOpened:
                                        const Color.fromRGBO(130, 84, 116, 1),
                                    content: Column(
                                      children: [
                                        RadioListTile(
                                          title: const Text(
                                              "Développement web/mobile/design"),
                                          value:
                                              "Développement web/mobile/design",
                                          groupValue: state.selectedChoice,
                                          onChanged:
                                              finalStageNotifier.updateChoice,
                                        ),
                                        RadioListTile(
                                          title: const Text("Data"),
                                          value: "Data",
                                          groupValue: state.selectedChoice,
                                          onChanged:
                                              finalStageNotifier.updateChoice,
                                        ),
                                        RadioListTile(
                                          title: const Text("Infrastructure"),
                                          value: "Infrastructure",
                                          groupValue: state.selectedChoice,
                                          onChanged:
                                              finalStageNotifier.updateChoice,
                                        ),
                                        RadioListTile(
                                          title: const Text("Sécurité IT"),
                                          value: "Sécurité IT",
                                          groupValue: state.selectedChoice,
                                          onChanged:
                                              finalStageNotifier.updateChoice,
                                        ),
                                        RadioListTile(
                                          title:
                                              const Text("Système et réseaux"),
                                          value: "Système et réseaux",
                                          groupValue: state.selectedChoice,
                                          onChanged:
                                              finalStageNotifier.updateChoice,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Accordion(
                                paddingListTop: 0,
                                paddingListBottom: 0,
                                maxOpenSections: 1,
                                headerBorderColor: Colors.white,
                                headerBackgroundColorOpened:
                                    const Color.fromRGBO(130, 84, 116, 1),
                                headerPadding: const EdgeInsets.symmetric(
                                    vertical: 7, horizontal: 15),
                                children: [
                                  AccordionSection(
                                    isOpen: false,
                                    header: const Text("Finance",
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.white),
                                        textAlign: TextAlign.center),
                                    headerBackgroundColor:
                                        const Color.fromRGBO(0, 117, 201, 1),
                                    headerBackgroundColorOpened:
                                        const Color.fromRGBO(130, 84, 116, 1),
                                    content: Column(
                                      children: [
                                        RadioListTile(
                                          title: const Text(
                                              "Comptabilité générale"),
                                          value: "Comptabilité générale",
                                          groupValue: state.selectedChoice,
                                          onChanged:
                                              finalStageNotifier.updateChoice,
                                        ),
                                        RadioListTile(
                                          title: const Text(
                                              "Comptabilité technique"),
                                          value: "Comptabilité technique",
                                          groupValue: state.selectedChoice,
                                          onChanged:
                                              finalStageNotifier.updateChoice,
                                        ),
                                        RadioListTile(
                                          title: const Text("Réassurance"),
                                          value: "réassurance",
                                          groupValue: state.selectedChoice,
                                          onChanged:
                                              finalStageNotifier.updateChoice,
                                        ),
                                        RadioListTile(
                                          title: const Text("Recouvrement"),
                                          value: "recouvrement",
                                          groupValue: state.selectedChoice,
                                          onChanged:
                                              finalStageNotifier.updateChoice,
                                        ),
                                        RadioListTile(
                                          title: const Text("Contrôle gestion"),
                                          value: "contrôle gestion",
                                          groupValue: state.selectedChoice,
                                          onChanged:
                                              finalStageNotifier.updateChoice,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Accordion(
                                paddingListTop: 0,
                                paddingListBottom: 0,
                                maxOpenSections: 1,
                                headerBorderColor: Colors.white,
                                headerBackgroundColorOpened:
                                    const Color.fromRGBO(130, 84, 116, 1),
                                headerPadding: const EdgeInsets.symmetric(
                                    vertical: 7, horizontal: 15),
                                children: [
                                  AccordionSection(
                                    isOpen: false,
                                    header: const Text(
                                        "RH achats et moyens généraux",
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.white),
                                        textAlign: TextAlign.center),
                                    headerBackgroundColor:
                                        const Color.fromRGBO(0, 117, 201, 1),
                                    headerBackgroundColorOpened:
                                        const Color.fromRGBO(130, 84, 116, 1),
                                    content: Column(
                                      children: [
                                        RadioListTile(
                                          title: const Text("Développement RH"),
                                          value: "Developpement RH",
                                          groupValue: state.selectedChoice,
                                          onChanged:
                                              finalStageNotifier.updateChoice,
                                        ),
                                        RadioListTile(
                                          title: const Text(
                                              "Communication interne"),
                                          value: "Communication interne",
                                          groupValue: state.selectedChoice,
                                          onChanged:
                                              finalStageNotifier.updateChoice,
                                        ),
                                        RadioListTile(
                                          title: const Text("Moyens généraux"),
                                          value: "Moyens généraux",
                                          groupValue: state.selectedChoice,
                                          onChanged:
                                              finalStageNotifier.updateChoice,
                                        ),
                                        RadioListTile(
                                          title: const Text("Achats"),
                                          value: "achat",
                                          groupValue: state.selectedChoice,
                                          onChanged:
                                              finalStageNotifier.updateChoice,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Accordion(
                                paddingListTop: 0,
                                paddingListBottom: 0,
                                maxOpenSections: 1,
                                headerBorderColor: Colors.white,
                                headerBackgroundColorOpened:
                                    const Color.fromRGBO(130, 84, 116, 1),
                                headerPadding: const EdgeInsets.symmetric(
                                    vertical: 7, horizontal: 15),
                                children: [
                                  AccordionSection(
                                    isOpen: false,
                                    header: const Text(
                                        "Marketing et communication externe",
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.white),
                                        textAlign: TextAlign.center),
                                    headerBackgroundColor:
                                        const Color.fromRGBO(0, 117, 201, 1),
                                    headerBackgroundColorOpened:
                                        const Color.fromRGBO(130, 84, 116, 1),
                                    content: Column(
                                      children: [
                                        RadioListTile(
                                          title: const Text("Marketing"),
                                          value: "Marketing",
                                          groupValue: state.selectedChoice,
                                          onChanged:
                                              finalStageNotifier.updateChoice,
                                        ),
                                        RadioListTile(
                                          title: const Text("Stratégie"),
                                          value: "Stratégie",
                                          groupValue: state.selectedChoice,
                                          onChanged:
                                              finalStageNotifier.updateChoice,
                                        ),
                                        RadioListTile(
                                          title: const Text("E-commerce"),
                                          value: "e-commerce",
                                          groupValue: state.selectedChoice,
                                          onChanged:
                                              finalStageNotifier.updateChoice,
                                        ),
                                        RadioListTile(
                                          title: const Text("Service client"),
                                          value: "service client",
                                          groupValue: state.selectedChoice,
                                          onChanged:
                                              finalStageNotifier.updateChoice,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Accordion(
                                paddingListTop: 0,
                                paddingListBottom: 0,
                                maxOpenSections: 1,
                                headerBorderColor: Colors.white,
                                headerBackgroundColorOpened:
                                    const Color.fromRGBO(130, 84, 116, 1),
                                headerPadding: const EdgeInsets.symmetric(
                                    vertical: 7, horizontal: 15),
                                children: [
                                  AccordionSection(
                                    isOpen: false,
                                    header: const Text(
                                        "Juridique, conformité et contrôle",
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.white),
                                        textAlign: TextAlign.center),
                                    headerBackgroundColor:
                                        const Color.fromRGBO(0, 117, 201, 1),
                                    headerBackgroundColorOpened:
                                        const Color.fromRGBO(130, 84, 116, 1),
                                    content: Column(
                                      children: [
                                        RadioListTile(
                                          title:
                                              const Text("Conseil juridique"),
                                          value: "conseil juridique",
                                          groupValue: state.selectedChoice,
                                          onChanged:
                                              finalStageNotifier.updateChoice,
                                        ),
                                        RadioListTile(
                                          title: const Text("Conformité"),
                                          value: "conformité",
                                          groupValue: state.selectedChoice,
                                          onChanged:
                                              finalStageNotifier.updateChoice,
                                        ),
                                        RadioListTile(
                                          title: const Text("Contentieux"),
                                          value: "contentieux",
                                          groupValue: state.selectedChoice,
                                          onChanged:
                                              finalStageNotifier.updateChoice,
                                        ),
                                        RadioListTile(
                                          title:
                                              const Text("Inspection générale"),
                                          value: "inspection générale",
                                          groupValue: state.selectedChoice,
                                          onChanged:
                                              finalStageNotifier.updateChoice,
                                        ),
                                        RadioListTile(
                                          title: const Text("Contrôle interne"),
                                          value: "Contrôle interne",
                                          groupValue: state.selectedChoice,
                                          onChanged:
                                              finalStageNotifier.updateChoice,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          contentHorizontalPadding: 20,
                          contentBorderColor:
                              const Color.fromRGBO(0, 117, 201, 1),
                        ),
                      ],
                    ),
                    Accordion(
                      paddingListTop: 0,
                      paddingListBottom: 0,
                      maxOpenSections: 1,
                      headerBorderColor: Colors.white,
                      headerBackgroundColorOpened:
                          const Color.fromRGBO(130, 84, 116, 1),
                      headerPadding: const EdgeInsets.symmetric(
                          vertical: 7, horizontal: 15),
                      children: [
                        AccordionSection(
                          isOpen: false,
                          leftIcon: const Icon(Icons.business_center_rounded,
                              color: Colors.white),
                          headerBackgroundColor:
                              const Color.fromRGBO(0, 117, 201, 1),
                          headerBackgroundColorOpened:
                              const Color.fromRGBO(130, 84, 116, 1),
                          header: const Text("Métiers d'Assurance",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                              textAlign: TextAlign.center),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RadioListTile(
                                title: const Text("Automobile"),
                                value: "Automobile",
                                groupValue: state.selectedChoice,
                                onChanged: finalStageNotifier.updateChoice,
                              ),
                              RadioListTile(
                                title: const Text("Santé"),
                                value: "Santé",
                                groupValue: state.selectedChoice,
                                onChanged: finalStageNotifier.updateChoice,
                              ),
                              RadioListTile(
                                title: const Text("Vie - Bancassurance"),
                                value: " Vie - Bancassurance",
                                groupValue: state.selectedChoice,
                                onChanged: finalStageNotifier.updateChoice,
                              ),
                              RadioListTile(
                                title: const Text("Corporate"),
                                value: "Corporate",
                                groupValue: state.selectedChoice,
                                onChanged: finalStageNotifier.updateChoice,
                              ),
                              RadioListTile(
                                title: const Text(
                                    "Animations commerciales et réseau de distributions "),
                                value: "Animationsréseaux",
                                groupValue: state.selectedChoice,
                                onChanged: finalStageNotifier.updateChoice,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(16.0),
                padding: const EdgeInsets.all(16.0),
                width: 800,
                decoration: BoxDecoration(
                  border:
                      Border.all(color: const Color.fromRGBO(0, 117, 201, 1)),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(children: [
                  const Text(
                    " Téléchargez votre Curriculum Vitae *",
                    style: TextStyle(fontSize: 20),
                  ),
                  const Divider(color: Color.fromRGBO(0, 117, 201, 1)),
                  RichText(
                      text: const TextSpan(
                    text:
                        'Format accepté : PDF \t \t \tTaille maximale : 250 Ko',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  )),
                  const SizedBox(height: 20),
                  if (fileState.error != null)
                    Text(fileState.error!,
                        style: const TextStyle(color: Colors.red)),
                  ElevatedButton(
                    onPressed: () =>
                        ref.read(fileProvider.notifier).pickPdfFile(),
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        const Color.fromRGBO(0, 117, 201, 1),
                      ),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.file_upload,
                          color: Colors.white,
                        ),
                        SizedBox(
                            width: 8), // Spacing between the icon and the text
                        Text(
                          'Téléchargez votre CV',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  if (fileState.file != null)
                    Text('File: ${fileState.file!.name}'),
                ]),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  ref.read(fileProvider.notifier).uploadPdfFile();
                  if (forming1.annee != null &&
                      forming1.convention != null &&
                      forming1.typestage != null &&
                      forming1.duree != null) {
                  } else {
                    // Optionally, show a message or do nothing
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: const Text(
                            'Veuillez compléter le formulaire avant la submission',
                            style: TextStyle(
                                color: Color.fromRGBO(0, 117, 201, 1)),
                            textAlign: TextAlign.center,
                          ),
                          backgroundColor: Colors.white,
                          behavior: SnackBarBehavior.floating,
                          margin: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height - 50,
                            left: 10,
                            right: 10,
                          ),
                          elevation: 100,
                          dismissDirection: DismissDirection.none),
                    );
                  }
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    const Color.fromRGBO(0, 117, 201, 1),
                  ),
                ),
                child: const Text(
                  'Confirmer',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ]),
    )));
  }
}
