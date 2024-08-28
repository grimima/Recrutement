import 'package:flutter_riverpod/flutter_riverpod.dart';

class Step2eState {
  final String? experience;
  final String? pretention;
  final String? fourchette;
  final String? preavis;
  final String? niveauDetud;

  Step2eState({
    this.experience,
    this.pretention,
    this.fourchette,
    this.preavis,
    this.niveauDetud,
  });

  Step2eState copyWith({
    String? experience,
    String? pretention,
    String? fourchette,
    String? preavis,
    String? niveauDetud,
  }) {
    return Step2eState(
      experience: experience ?? this.experience,
      pretention: pretention ?? this.pretention,
      fourchette: fourchette ?? this.fourchette,
      preavis: preavis ?? this.preavis,
      niveauDetud: niveauDetud ?? this.niveauDetud,
    );
  }
}

class Step2eNotifier extends StateNotifier<Step2eState> {
  Step2eNotifier() : super(Step2eState());

  void updateExperience(String? value) {
    state = state.copyWith(experience: value);
  }

  void updatePretention(String? value) {
    state = state.copyWith(pretention: value);
  }

  void updateFourchette(String? value) {
    state = state.copyWith(fourchette: value);
  }

  void updatePreavis(String? value) {
    state = state.copyWith(preavis: value);
  }

  void updateNiveaudetud(String? value) {
    state = state.copyWith(niveauDetud: value);
  }
}

final Step2eProvider = StateNotifierProvider<Step2eNotifier, Step2eState>(
  (ref) => Step2eNotifier(),
);
