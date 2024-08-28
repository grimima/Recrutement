/*import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recrutement/Riverpods/statemanager.dart';

class Step33 extends ConsumerWidget {
  const Step33({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final step33State = ref.watch(step33Provider);
    final step33Notifier = ref.read(step33Provider.notifier);
    return Scaffold(
        body: SingleChildScrollView(
            child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(16.0),
            padding: const EdgeInsets.all(16.0),
            width: 800,
            decoration: BoxDecoration(
              border: Border.all(color: const Color.fromRGBO(0, 117, 201, 1)),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              children: [
                const Text(
                  "Quel métier peut vous intéresser ?",
                  style: TextStyle(fontSize: 20),
                ),
                const Divider(color: Color.fromRGBO(0, 117, 201, 1)),
                RadioListTile(
                  title: const Text("Métiers de support"),
                  value: "Support",
                  groupValue: step33State.support,
                  onChanged: (value) {
                    step33Notifier.updateSupport(value);
                  },
                ),
                if (step33State.support == "Support")
                  Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Column(
                        children: [
                          RadioListTile(
                            title: const Text("Digital solutions"),
                            value: "IT",
                            groupValue: supportlist,
                            onChanged: (value) {
                              setState(() {
                                supportlist = value.toString();
                              });
                            },
                          ),
                          if (supportlist == "IT")
                            Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: Column(
                                  children: [
                                    RadioListTile(
                                      title: const Text("Développement"),
                                      value: "Dev",
                                      groupValue: itlist,
                                      onChanged: (value) {
                                        setState(() {
                                          itlist = value.toString();
                                        });
                                      },
                                    ),
                                    RadioListTile(
                                      title: const Text("Data"),
                                      value: "Data",
                                      groupValue: itlist,
                                      onChanged: (value) {
                                        setState(() {
                                          itlist = value.toString();
                                        });
                                      },
                                    ),
                                    RadioListTile(
                                      title: const Text("Infrastructure"),
                                      value: "Infrastructure",
                                      groupValue: itlist,
                                      onChanged: (value) {
                                        setState(() {
                                          itlist = value.toString();
                                        });
                                      },
                                    ),
                                    RadioListTile(
                                      title: const Text("Sécurité"),
                                      value: "Sécurité",
                                      groupValue: itlist,
                                      onChanged: (value) {
                                        setState(() {
                                          itlist = value.toString();
                                        });
                                      },
                                    ),
                                    RadioListTile(
                                      title: const Text("Système et réseaux"),
                                      value: "Sys&réseau",
                                      groupValue: itlist,
                                      onChanged: (value) {
                                        setState(() {
                                          itlist = value.toString();
                                        });
                                      },
                                    ),
                                    RadioListTile(
                                      title: const Text("Gestion de projet"),
                                      value: "Gestion de projet",
                                      groupValue: itlist,
                                      onChanged: (value) {
                                        setState(() {
                                          itlist = value.toString();
                                        });
                                      },
                                    ),
                                  ],
                                )),
                          RadioListTile(
                            title: const Text("Finance"),
                            value: "Finance",
                            groupValue: supportlist,
                            onChanged: (value) {
                              setState(() {
                                supportlist = value.toString();
                              });
                            },
                          ),
                          if (supportlist == "Finance")
                            Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: Column(
                                  children: [
                                    RadioListTile(
                                      title:
                                          const Text("Comptabilité générale"),
                                      value: "Compta générale",
                                      groupValue: financelist,
                                      onChanged: (value) {
                                        setState(() {
                                          financelist = value.toString();
                                        });
                                      },
                                    ),
                                    RadioListTile(
                                      title:
                                          const Text("Comptabilité technique"),
                                      value: "Compta technique",
                                      groupValue: financelist,
                                      onChanged: (value) {
                                        setState(() {
                                          financelist = value.toString();
                                        });
                                      },
                                    ),
                                    RadioListTile(
                                      title: const Text("Réassurance"),
                                      value: "réassurance",
                                      groupValue: financelist,
                                      onChanged: (value) {
                                        setState(() {
                                          financelist = value.toString();
                                        });
                                      },
                                    ),
                                    RadioListTile(
                                      title: const Text("Recouvrement"),
                                      value: "Recouvrement",
                                      groupValue: financelist,
                                      onChanged: (value) {
                                        setState(() {
                                          financelist = value.toString();
                                        });
                                      },
                                    ),
                                    RadioListTile(
                                      title: const Text("Contrôle gestion"),
                                      value: "Contrôle gestion",
                                      groupValue: financelist,
                                      onChanged: (value) {
                                        setState(() {
                                          financelist = value.toString();
                                        });
                                      },
                                    ),
                                    RadioListTile(
                                      title:
                                          const Text("Gestion projet finance"),
                                      value: "Gestion de projet",
                                      groupValue: financelist,
                                      onChanged: (value) {
                                        setState(() {
                                          financelist = value.toString();
                                        });
                                      },
                                    ),
                                  ],
                                )),
                          RadioListTile(
                            title: const Text("RH achats et moyens généraux"),
                            value: "HR",
                            groupValue: supportlist,
                            onChanged: (value) {
                              setState(() {
                                supportlist = value.toString();
                              });
                            },
                          ),
                          if (supportlist == "HR")
                            Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: Column(
                                  children: [
                                    RadioListTile(
                                      title: const Text("Développement humain"),
                                      value: "Dev humain",
                                      groupValue: rhlist,
                                      onChanged: (value) {
                                        setState(() {
                                          rhlist = value.toString();
                                        });
                                      },
                                    ),
                                    RadioListTile(
                                      title:
                                          const Text("Communication interne"),
                                      value: "Com interne",
                                      groupValue: rhlist,
                                      onChanged: (value) {
                                        setState(() {
                                          rhlist = value.toString();
                                        });
                                      },
                                    ),
                                    RadioListTile(
                                      title: const Text("Moyens généraux"),
                                      value: "moy généraux",
                                      groupValue: rhlist,
                                      onChanged: (value) {
                                        setState(() {
                                          rhlist = value.toString();
                                        });
                                      },
                                    ),
                                    RadioListTile(
                                      title: const Text("Achats"),
                                      value: "achat",
                                      groupValue: rhlist,
                                      onChanged: (value) {
                                        setState(() {
                                          rhlist = value.toString();
                                        });
                                      },
                                    ),
                                  ],
                                )),
                          RadioListTile(
                            title: const Text("Marketing"),
                            value: "Marketing",
                            groupValue: supportlist,
                            onChanged: (value) {
                              setState(() {
                                supportlist = value.toString();
                              });
                            },
                          ),
                          if (supportlist == "Marketing")
                            Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: Column(
                                  children: [
                                    RadioListTile(
                                      title: const Text("Market digital"),
                                      value: "Market Digital",
                                      groupValue: marketinglist,
                                      onChanged: (value) {
                                        setState(() {
                                          marketinglist = value.toString();
                                        });
                                      },
                                    ),
                                    RadioListTile(
                                      title: const Text("Stratégie"),
                                      value: "Stratégie",
                                      groupValue: marketinglist,
                                      onChanged: (value) {
                                        setState(() {
                                          marketinglist = value.toString();
                                        });
                                      },
                                    ),
                                    RadioListTile(
                                      title: const Text("Marketing product"),
                                      value: "marketing product",
                                      groupValue: marketinglist,
                                      onChanged: (value) {
                                        setState(() {
                                          marketinglist = value.toString();
                                        });
                                      },
                                    ),
                                    RadioListTile(
                                      title: const Text("E-commerce"),
                                      value: "e-commerce",
                                      groupValue: marketinglist,
                                      onChanged: (value) {
                                        setState(() {
                                          marketinglist = value.toString();
                                        });
                                      },
                                    ),
                                    RadioListTile(
                                      title:
                                          const Text("Qualité service client"),
                                      value: "qualité service client",
                                      groupValue: marketinglist,
                                      onChanged: (value) {
                                        setState(() {
                                          marketinglist = value.toString();
                                        });
                                      },
                                    ),
                                  ],
                                )),
                          RadioListTile(
                            title: const Text("Juridique"),
                            value: "Juridique",
                            groupValue: supportlist,
                            onChanged: (value) {
                              setState(() {
                                supportlist = value.toString();
                              });
                            },
                          ),
                          if (supportlist == "Juridique")
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Column(
                                children: [
                                  RadioListTile(
                                    title: const Text("Conseil juridique"),
                                    value: "Conseil juridique",
                                    groupValue: juridiquelist,
                                    onChanged: (value) {
                                      setState(() {
                                        juridiquelist = value.toString();
                                      });
                                    },
                                  ),
                                  RadioListTile(
                                    title: const Text("Conformité"),
                                    value: "Conformité",
                                    groupValue: juridiquelist,
                                    onChanged: (value) {
                                      setState(() {
                                        juridiquelist = value.toString();
                                      });
                                    },
                                  ),
                                  RadioListTile(
                                    title: const Text("Contentieux"),
                                    value: "contentieux",
                                    groupValue: juridiquelist,
                                    onChanged: (value) {
                                      setState(() {
                                        juridiquelist = value.toString();
                                      });
                                    },
                                  ),
                                  RadioListTile(
                                    title: const Text("Inspection générale"),
                                    value: "inspection générale",
                                    groupValue: juridiquelist,
                                    onChanged: (value) {
                                      setState(() {
                                        juridiquelist = value.toString();
                                      });
                                    },
                                  ),
                                  RadioListTile(
                                    title: const Text("Contrôle interne"),
                                    value: "Contrôle interne",
                                    groupValue: juridiquelist,
                                    onChanged: (value) {
                                      setState(() {
                                        juridiquelist = value.toString();
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                        ],
                      )),
                RadioListTile(
                  title: const Text("Métiers d'assurance"),
                  value: "Assurance",
                  groupValue: support,
                  onChanged: (value) {
                    setState(() {
                      support = value.toString();
                    });
                  },
                ),
                if (support == "Assurance")
                  Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Column(
                        children: [
                          RadioListTile(
                            title: const Text("Automobile"),
                            value: "Automobile",
                            groupValue: assurancelist,
                            onChanged: (value) {
                              setState(() {
                                assurancelist = value.toString();
                              });
                            },
                          ),
                          RadioListTile(
                            title: const Text("Santé"),
                            value: "Santé",
                            groupValue: assurancelist,
                            onChanged: (value) {
                              setState(() {
                                assurancelist = value.toString();
                              });
                            },
                          ),
                          RadioListTile(
                            title: const Text("Vie Bancassurance"),
                            value: "Bancassurance",
                            groupValue: assurancelist,
                            onChanged: (value) {
                              setState(() {
                                assurancelist = value.toString();
                              });
                            },
                          ),
                          RadioListTile(
                            title: const Text("Corporate"),
                            value: "Corporate",
                            groupValue: assurancelist,
                            onChanged: (value) {
                              setState(() {
                                assurancelist = value.toString();
                              });
                            },
                          ),
                          RadioListTile(
                            title: const Text(
                                "Animations commerciales et réseaux"),
                            value: "Animationsréseaux",
                            groupValue: assurancelist,
                            onChanged: (value) {
                              setState(() {
                                assurancelist = value.toString();
                              });
                            },
                          ),
                        ],
                      ))
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(16.0),
            padding: const EdgeInsets.all(16.0),
            width: 800,
            decoration: BoxDecoration(
              border: Border.all(color: const Color.fromRGBO(0, 117, 201, 1)),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              children: [
                const Text(
                  "Sur quel région êtes-vous mobile?",
                  style: TextStyle(fontSize: 20),
                ),
                const Divider(color: Color.fromRGBO(0, 117, 201, 1)),
                CheckboxListTile(
                    value: region8,
                    onChanged: (bool? value) {
                      setState(() {
                        region8 = true;
                      });
                    },
                    title: const Text("Casablanca-Settat"),
                    subtitle: const Text(
                        "Casablanca; Mohammadia; El Jadida; Nouaceur; Médiouna; Benslimane; Berrechid; Settat; Sidi Bennour")),
                const Divider(color: Color.fromRGBO(0, 117, 201, 1)),
                CheckboxListTile(
                    value: region11,
                    onChanged: (bool? value) {
                      setState(() {
                        region11 = true;
                      });
                    },
                    title: const Text("Rabat-Salé-Kénitra"),
                    subtitle: const Text(
                        "Rabat; Salé; Skhirate-Témara; Kénitra; Khémisset; Sidi Kacem; Sidi Slimane")),
                const Divider(color: Color.fromRGBO(0, 117, 201, 1)),
                CheckboxListTile(
                    value: region1,
                    onChanged: (bool? value) {
                      setState(() {
                        region1 = value ?? false;
                      });
                    },
                    title: const Text("L'oriental"),
                    subtitle: const Text(
                        "Oujda-Angad; Nador; Driouch; Jerada; Berkan; Taourirt; Guercif; Figuig")),
                const Divider(color: Color.fromRGBO(0, 117, 201, 1)),
                CheckboxListTile(
                    value: region2,
                    onChanged: (bool? value) {
                      setState(() {
                        region2 = value ?? false;
                      });
                    },
                    title: const Text("Marrakech-Safi"),
                    subtitle: const Text(
                        "Marrakech; Chichaoua; Al Haouz; Kelâa des Sraghna; Essaouira; Rehamna; Safi; Youssoufia")),
                const Divider(color: Color.fromRGBO(0, 117, 201, 1)),
                CheckboxListTile(
                    value: region3,
                    onChanged: (bool? value) {
                      setState(() {
                        region3 = value ?? false;
                      });
                    },
                    title: const Text("Drâa-Tafilalet"),
                    subtitle: const Text(
                        "Errachidia; Ouarzazate; Midelt; Tinghir; Zagora")),
                const Divider(color: Color.fromRGBO(0, 117, 201, 1)),
                CheckboxListTile(
                    value: region4,
                    onChanged: (bool? value) {
                      setState(() {
                        region4 = value ?? false;
                      });
                    },
                    title: const Text("Fès-Meknès"),
                    subtitle: const Text(
                        "Fès; Meknès; El Hajeb; Ifrane; Moulay Yacoub; Sefrou; Boulemane; Taounate; Taza")),
                const Divider(color: Color.fromRGBO(0, 117, 201, 1)),
                CheckboxListTile(
                    value: region5,
                    onChanged: (bool? value) {
                      setState(() {
                        region5 = value ?? false;
                      });
                    },
                    title: const Text("Guelmim-oued Noun"),
                    subtitle:
                        const Text("Guelmim; Assa-Zag; Tan-Tan; Sidi Ifni")),
                const Divider(color: Color.fromRGBO(0, 117, 201, 1)),
                CheckboxListTile(
                    value: region6,
                    onChanged: (bool? value) {
                      setState(() {
                        region6 = value ?? false;
                      });
                    },
                    title: const Text("Tanger-Tétouan-Al Hoceima"),
                    subtitle: const Text(
                        "Tanger-Assilah ; M'diq-Fnideq; Tétouan; Fahs-Anjra; Larache; Al Hoceima; Chefchaouen; Ouazzane")),
                const Divider(color: Color.fromRGBO(0, 117, 201, 1)),
                CheckboxListTile(
                    value: region7,
                    onChanged: (bool? value) {
                      setState(() {
                        region7 = value ?? false;
                      });
                    },
                    title: const Text("Souss-Massa"),
                    subtitle: const Text(
                        "Agadir Ida-Ou-Tanane; Inezgane-Aït Melloul ; Chtouka-Aït Baha; Taroudannt; Tiznit; Tata")),
                const Divider(color: Color.fromRGBO(0, 117, 201, 1)),
                CheckboxListTile(
                    value: region9,
                    onChanged: (bool? value) {
                      setState(() {
                        region9 = value ?? false;
                      });
                    },
                    title: const Text("Dakhla-Oued Eddahab"),
                    subtitle: const Text("Oued Ed-Dahab; Aousserd")),
                const Divider(color: Color.fromRGBO(0, 117, 201, 1)),
                CheckboxListTile(
                    value: region10,
                    onChanged: (bool? value) {
                      setState(() {
                        region10 = value ?? false;
                      });
                    },
                    title: const Text("Beni Mellal-Khénifra"),
                    subtitle: const Text(
                        " Béni Mellal; Azilal; Fquih Ben Salah; Khénifra; Khouribga")),
                const Divider(color: Color.fromRGBO(0, 117, 201, 1)),
                CheckboxListTile(
                    value: region12,
                    onChanged: (bool? value) {
                      setState(() {
                        region12 = value ?? false;
                      });
                    },
                    title: const Text("Laâyoune-Sakia Al Hamra"),
                    subtitle:
                        const Text("Laâyoune; Boujdour; Tarfaya; Es-Semara")),
                const Divider(color: Color.fromRGBO(0, 117, 201, 1)),
                CheckboxListTile(
                  value: national,
                  onChanged: (bool? value) {
                    setState(() {
                      national = value ?? false;
                      region1 = value ?? false;
                      region2 = value ?? false;
                      region3 = value ?? false;
                      region4 = value ?? false;
                      region5 = value ?? false;
                      region6 = value ?? false;
                      region7 = value ?? false;
                      region8 = value ?? false;
                      region9 = value ?? false;
                      region10 = value ?? false;
                      region11 = value ?? false;
                      region12 = value ?? false;
                    });
                  },
                  title: const Text("National"),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
            onPressed: _pickPdfFile,
            style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                  const Color.fromRGBO(0, 117, 201, 1),
                ),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        15.0), // Adjust this value for roundness
                  ),
                )),
            child: const Text(
              'Déposer votre cv',
              style: TextStyle(color: Colors.white, fontSize: 25.0),
            ),
          ),
          if (_file != null) ...[
            Text('Picked file: ${_file!.files.single.name}'),
            ElevatedButton(
              onPressed: uploadPdfFile,
              child: const Text(
                'Confirmer',
                style: TextStyle(color: Color.fromRGBO(0, 117, 201, 1)),
              ),
            ),
          ],
          if (_error != null) ...[
            Text(
              _error!,
              style: const TextStyle(color: Colors.red),
            ),
          ],
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    )));
  }
}
*/