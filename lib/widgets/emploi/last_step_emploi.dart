import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recrutement/Riverpods/statemanager3e.dart';
import 'package:accordion/accordion.dart';
import 'package:recrutement/Riverpods/statemanager1e.dart';
import 'package:recrutement/Riverpods/statemanager2e.dart';

class FinalEmploi extends ConsumerWidget {
  const FinalEmploi({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(FinalEmploiProvider);
    final forming = ref.watch(Emploi1StateProvider);
    final forming2 = ref.watch(Step2eProvider);
    final FinalEmploiNotifier = ref.read(FinalEmploiProvider.notifier);
    final fileState = ref.watch(fileProvider);

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
              const SizedBox(height: 20),
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
                      " * Par quel métier êtes vous intéressé ?",
                      style: TextStyle(fontSize: 20),
                    ),
                    const Divider(color: Color.fromRGBO(0, 117, 201, 1)),
                    Accordion(
                      paddingListTop: 0,
                      paddingListBottom: 0,
                      maxOpenSections: 1,
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
                                              FinalEmploiNotifier.updateChoice,
                                        ),
                                        RadioListTile(
                                          title: const Text("Data"),
                                          value: "Data",
                                          groupValue: state.selectedChoice,
                                          onChanged:
                                              FinalEmploiNotifier.updateChoice,
                                        ),
                                        RadioListTile(
                                          title: const Text("Infrastructure"),
                                          value: "Infrastructure",
                                          groupValue: state.selectedChoice,
                                          onChanged:
                                              FinalEmploiNotifier.updateChoice,
                                        ),
                                        RadioListTile(
                                          title: const Text("Sécurité IT"),
                                          value: "Sécurité IT",
                                          groupValue: state.selectedChoice,
                                          onChanged:
                                              FinalEmploiNotifier.updateChoice,
                                        ),
                                        RadioListTile(
                                          title:
                                              const Text("Systèmes et réseaux"),
                                          value: "Système et réseaux",
                                          groupValue: state.selectedChoice,
                                          onChanged:
                                              FinalEmploiNotifier.updateChoice,
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
                                              "Compatbilité générale"),
                                          value: "Compatbilité générale",
                                          groupValue: state.selectedChoice,
                                          onChanged:
                                              FinalEmploiNotifier.updateChoice,
                                        ),
                                        RadioListTile(
                                          title: const Text(
                                              "Comptabilité technique"),
                                          value: "Comptabilité technique",
                                          groupValue: state.selectedChoice,
                                          onChanged:
                                              FinalEmploiNotifier.updateChoice,
                                        ),
                                        RadioListTile(
                                          title: const Text("Réassurance"),
                                          value: "réassurance",
                                          groupValue: state.selectedChoice,
                                          onChanged:
                                              FinalEmploiNotifier.updateChoice,
                                        ),
                                        RadioListTile(
                                          title: const Text("Recouvrement"),
                                          value: "recouvrement",
                                          groupValue: state.selectedChoice,
                                          onChanged:
                                              FinalEmploiNotifier.updateChoice,
                                        ),
                                        RadioListTile(
                                          title: const Text("Contrôle gestion"),
                                          value: "contrôle gestion",
                                          groupValue: state.selectedChoice,
                                          onChanged:
                                              FinalEmploiNotifier.updateChoice,
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
                                          value: "Développement RH",
                                          groupValue: state.selectedChoice,
                                          onChanged:
                                              FinalEmploiNotifier.updateChoice,
                                        ),
                                        RadioListTile(
                                          title: const Text(
                                              "Communication interne"),
                                          value: "Communication interne",
                                          groupValue: state.selectedChoice,
                                          onChanged:
                                              FinalEmploiNotifier.updateChoice,
                                        ),
                                        RadioListTile(
                                          title: const Text("Moyens généraux"),
                                          value: "Moyens généraux",
                                          groupValue: state.selectedChoice,
                                          onChanged:
                                              FinalEmploiNotifier.updateChoice,
                                        ),
                                        RadioListTile(
                                          title: const Text("Achats"),
                                          value: "achat",
                                          groupValue: state.selectedChoice,
                                          onChanged:
                                              FinalEmploiNotifier.updateChoice,
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
                                              FinalEmploiNotifier.updateChoice,
                                        ),
                                        RadioListTile(
                                          title: const Text("Stratégie"),
                                          value: "Stratégie",
                                          groupValue: state.selectedChoice,
                                          onChanged:
                                              FinalEmploiNotifier.updateChoice,
                                        ),
                                        RadioListTile(
                                          title: const Text("E-commerce"),
                                          value: "e-commerce",
                                          groupValue: state.selectedChoice,
                                          onChanged:
                                              FinalEmploiNotifier.updateChoice,
                                        ),
                                        RadioListTile(
                                          title: const Text("Service client"),
                                          value: "service client",
                                          groupValue: state.selectedChoice,
                                          onChanged:
                                              FinalEmploiNotifier.updateChoice,
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
                                headerBackgroundColorOpened:
                                    const Color.fromRGBO(130, 84, 116, 1),
                                headerPadding: const EdgeInsets.symmetric(
                                    vertical: 7, horizontal: 15),
                                children: [
                                  AccordionSection(
                                    isOpen: false,
                                    header: const Text(
                                        "Juridique, conformité et contôle",
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
                                              FinalEmploiNotifier.updateChoice,
                                        ),
                                        RadioListTile(
                                          title: const Text("Conformité"),
                                          value: "conformité",
                                          groupValue: state.selectedChoice,
                                          onChanged:
                                              FinalEmploiNotifier.updateChoice,
                                        ),
                                        RadioListTile(
                                          title: const Text("Contentieux"),
                                          value: "contentieux",
                                          groupValue: state.selectedChoice,
                                          onChanged:
                                              FinalEmploiNotifier.updateChoice,
                                        ),
                                        RadioListTile(
                                          title:
                                              const Text("Inspection générale"),
                                          value: "inspection générale",
                                          groupValue: state.selectedChoice,
                                          onChanged:
                                              FinalEmploiNotifier.updateChoice,
                                        ),
                                        RadioListTile(
                                          title: const Text("Contrôle interne"),
                                          value: "Contrôle interne",
                                          groupValue: state.selectedChoice,
                                          onChanged:
                                              FinalEmploiNotifier.updateChoice,
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
                                onChanged: FinalEmploiNotifier.updateChoice,
                              ),
                              RadioListTile(
                                title: const Text("Santé"),
                                value: "Santé",
                                groupValue: state.selectedChoice,
                                onChanged: FinalEmploiNotifier.updateChoice,
                              ),
                              RadioListTile(
                                title: const Text("Vie / Bancassurance"),
                                value: "Bancassurance",
                                groupValue: state.selectedChoice,
                                onChanged: FinalEmploiNotifier.updateChoice,
                              ),
                              RadioListTile(
                                title: const Text("Corporate"),
                                value: "Corporate",
                                groupValue: state.selectedChoice,
                                onChanged: FinalEmploiNotifier.updateChoice,
                              ),
                              RadioListTile(
                                title: const Text(
                                    "Animations commerciales et réseau de distributions"),
                                value: "Animationsréseaux",
                                groupValue: state.selectedChoice,
                                onChanged: FinalEmploiNotifier.updateChoice,
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
                child: Column(
                  children: [
                    const Text(
                      " Sur quel région êtes-vous mobile? *",
                      style: TextStyle(fontSize: 20),
                    ),
                    const Divider(color: Color.fromRGBO(0, 117, 201, 1)),
                    Accordion(
                      paddingListTop: 0,
                      paddingListBottom: 0,
                      maxOpenSections: 1,
                      headerBackgroundColorOpened:
                          const Color.fromRGBO(130, 84, 116, 1),
                      headerPadding: const EdgeInsets.symmetric(
                          vertical: 7, horizontal: 15),
                      children: [
                        AccordionSection(
                          isOpen: false,
                          leftIcon: const ImageIcon(
                            AssetImage('assets/icons/mapping.png'),
                            color: Colors.white,
                          ),
                          headerBackgroundColor:
                              const Color.fromRGBO(0, 117, 201, 1),
                          headerBackgroundColorOpened:
                              const Color.fromRGBO(130, 84, 116, 1),
                          header: const Text("Regions",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                              textAlign: TextAlign.center),
                          content: Column(
                            children: [
                              CheckboxListTile(
                                value: state.reg1,
                                onChanged: (bool? value) {
                                  FinalEmploiNotifier.updatereg(
                                      value ?? false, 1);
                                },
                                title: const Text("Casablanca-Settat"),
                                subtitle: const Text(
                                    "Casablanca; Mohammadia; El Jadida; Nouaceur; Médiouna; Benslimane; Berrechid; Settat; Sidi Bennour"),
                              ),
                              const Divider(
                                  color: Color.fromRGBO(0, 117, 201, 1)),
                              CheckboxListTile(
                                value: state.reg2,
                                onChanged: (bool? value) {
                                  FinalEmploiNotifier.updatereg(
                                      value ?? false, 2);
                                },
                                title: const Text("Rabat-Salé-Kénitra"),
                                subtitle: const Text(
                                    "Rabat; Salé; Skhirate-Témara; Kénitra; Khémisset; Sidi Kacem; Sidi Slimane"),
                              ),
                              const Divider(
                                  color: Color.fromRGBO(0, 117, 201, 1)),
                              CheckboxListTile(
                                value: state.reg3,
                                onChanged: (bool? value) {
                                  FinalEmploiNotifier.updatereg(
                                      value ?? false, 3);
                                },
                                title: const Text("L'oriental"),
                                subtitle: const Text(
                                    "Oujda-Angad; Nador; Driouch; Jerada; Berkan; Taourirt; Guercif; Figuig"),
                              ),
                              const Divider(
                                  color: Color.fromRGBO(0, 117, 201, 1)),
                              CheckboxListTile(
                                value: state.reg4,
                                onChanged: (bool? value) {
                                  FinalEmploiNotifier.updatereg(
                                      value ?? false, 4);
                                },
                                title: const Text("Marrakech-Safi"),
                                subtitle: const Text(
                                    "Marrakech; Chichaoua; Al Haouz; Kelâa des Sraghna; Essaouira; Rehamna; Safi; Youssoufia"),
                              ),
                              const Divider(
                                  color: Color.fromRGBO(0, 117, 201, 1)),
                              CheckboxListTile(
                                value: state.reg5,
                                onChanged: (bool? value) {
                                  FinalEmploiNotifier.updatereg(
                                      value ?? false, 5);
                                },
                                title: const Text("Drâa-Tafilalet"),
                                subtitle: const Text(
                                    "Errachidia; Ouarzazate; Midelt; Tinghir; Zagora"),
                              ),
                              const Divider(
                                  color: Color.fromRGBO(0, 117, 201, 1)),
                              CheckboxListTile(
                                value: state.reg6,
                                onChanged: (bool? value) {
                                  FinalEmploiNotifier.updatereg(
                                      value ?? false, 6);
                                },
                                title: const Text("Fès-Meknès"),
                                subtitle: const Text(
                                    "Fès; Meknès; El Hajeb; Ifrane; Moulay Yacoub; Sefrou; Boulemane; Taounate; Taza"),
                              ),
                              const Divider(
                                  color: Color.fromRGBO(0, 117, 201, 1)),
                              CheckboxListTile(
                                value: state.reg7,
                                onChanged: (bool? value) {
                                  FinalEmploiNotifier.updatereg(
                                      value ?? false, 7);
                                },
                                title: const Text("Guelmim-oued Noun"),
                                subtitle: const Text(
                                    "Guelmim; Assa-Zag; Tan-Tan; Sidi Ifni"),
                              ),
                              const Divider(
                                  color: Color.fromRGBO(0, 117, 201, 1)),
                              CheckboxListTile(
                                value: state.reg8,
                                onChanged: (bool? value) {
                                  FinalEmploiNotifier.updatereg(
                                      value ?? false, 8);
                                },
                                title: const Text("Tanger-Tétouan-Al Hoceima"),
                                subtitle: const Text(
                                    "Tanger-Assilah; M'diq-Fnideq; Tétouan; Fahs-Anjra; Larache; Al Hoceima; Chefchaouen; Ouazzane"),
                              ),
                              const Divider(
                                  color: Color.fromRGBO(0, 117, 201, 1)),
                              CheckboxListTile(
                                value: state.reg9,
                                onChanged: (bool? value) {
                                  FinalEmploiNotifier.updatereg(
                                      value ?? false, 9);
                                },
                                title: const Text("Souss-Massa"),
                                subtitle: const Text(
                                    "Agadir Ida-Ou-Tanane; Inezgane-Aït Melloul; Chtouka-Aït Baha; Taroudannt; Tiznit; Tata"),
                              ),
                              const Divider(
                                  color: Color.fromRGBO(0, 117, 201, 1)),
                              CheckboxListTile(
                                value: state.reg10,
                                onChanged: (bool? value) {
                                  FinalEmploiNotifier.updatereg(
                                      value ?? false, 10);
                                },
                                title: const Text("Dakhla-Oued Eddahab"),
                                subtitle: const Text("Oued Ed-Dahab; Aousserd"),
                              ),
                              const Divider(
                                  color: Color.fromRGBO(0, 117, 201, 1)),
                              CheckboxListTile(
                                value: state.reg11,
                                onChanged: (bool? value) {
                                  FinalEmploiNotifier.updatereg(
                                      value ?? false, 11);
                                },
                                title: const Text("Beni Mellal-Khénifra"),
                                subtitle: const Text(
                                    "Béni Mellal; Azilal; Fquih Ben Salah; Khénifra; Khouribga"),
                              ),
                              const Divider(
                                  color: Color.fromRGBO(0, 117, 201, 1)),
                              CheckboxListTile(
                                value: state.reg12,
                                onChanged: (bool? value) {
                                  FinalEmploiNotifier.updatereg(
                                      value ?? false, 12);
                                },
                                title: const Text("Laâyoune-Sakia Al Hamra"),
                                subtitle: const Text(
                                    "Laâyoune; Boujdour; Tarfaya; Es-Semara"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Divider(color: Color.fromRGBO(0, 117, 201, 1)),
                    CheckboxListTile(
                      value: state.national,
                      onChanged: (bool? value) {
                        FinalEmploiNotifier.updateNational(value ?? false);
                      },
                      title: const Text("National"),
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
                    " *Téléchargez votre Curriculum Vitae",
                    style: TextStyle(fontSize: 20),
                  ),
                  const Divider(color: Color.fromRGBO(0, 117, 201, 1)),
                  const SizedBox(height: 20),
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
              ElevatedButton(
                onPressed: () {
                  if (state.selectedChoice != null &&
                      forming2.experience != null) {
                    /* generatePDF(
                      name: forming.name,
                      surname: forming.surname,
                      email: forming.email,
                      phoneNumber: forming.phoneNumber,
                      experience: forming2.experience ?? '',
                      fourchette: forming2.fourchette,
                      pretention: forming2.pretention,
                      preavis: forming2.preavis,
                      selectedchoice: state.selectedChoice ?? '',
                      region: state.national || state.reg1,
                    );*/
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
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
