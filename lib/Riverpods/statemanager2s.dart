import 'package:flutter_riverpod/flutter_riverpod.dart';

class Step2sState {
  final String? annee;
  final String? convention;
  final String? typestage;
  final String? duree;

  Step2sState({
    this.annee,
    this.convention,
    this.typestage,
    this.duree,
  });

  Step2sState copyWith({
    String? annee,
    String? convention,
    String? typestage,
    String? duree,
  }) {
    return Step2sState(
      annee: annee ?? this.annee,
      convention: convention ?? this.convention,
      typestage: typestage ?? this.typestage,
      duree: duree ?? this.duree,
    );
  }

  bool isValid() {
    return annee != null &&
        convention != null &&
        duree != null &&
        (convention != "Conventionné" || typestage != null);
  }
}

class Step2sNotifier extends StateNotifier<Step2sState> {
  Step2sNotifier() : super(Step2sState());

  void updateAnnee(String? value) {
    state = state.copyWith(annee: value);
  }

  void updateConvention(String? value) {
    state = state.copyWith(convention: value);
  }

  void updateTypestage(String? value) {
    state = state.copyWith(typestage: value);
  }

  void updateDuree(String? value) {
    state = state.copyWith(duree: value);
  }
}

final Step2sProvider = StateNotifierProvider<Step2sNotifier, Step2sState>(
  (ref) => Step2sNotifier(),
);
