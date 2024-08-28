import 'package:flutter_riverpod/flutter_riverpod.dart';

// Define a data class to hold the state
class Emploi1State {
  final String name;
  final String surname;
  final String email;
  final String phoneNumber;
  final String? connaissance;

  Emploi1State({
    this.name = '',
    this.surname = '',
    this.email = '',
    this.phoneNumber = '',
    this.connaissance = '',
  });

  // Create a copyWith method to update the state
  Emploi1State copyWith({
    String? name,
    String? surname,
    String? email,
    String? phoneNumber,
    String? connaissance,
  }) {
    return Emploi1State(
      name: name ?? this.name,
      surname: surname ?? this.surname,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      connaissance: connaissance ?? this.connaissance,
    );
  }
}

// Create the notifier class that manages the state
class Emploi1StateNotifier extends StateNotifier<Emploi1State> {
  Emploi1StateNotifier() : super(Emploi1State());

  // Method to update the name
  void updateName(String newName) {
    state = state.copyWith(name: newName);
  }

  // Method to update the surname
  void updateSurname(String newSurname) {
    state = state.copyWith(surname: newSurname);
  }

  // Method to update the email
  void updateEmail(String newEmail) {
    state = state.copyWith(email: newEmail);
  }

  // Method to update the phone number
  void updatePhoneNumber(String newPhoneNumber) {
    state = state.copyWith(phoneNumber: newPhoneNumber);
  }

  void updateConnaissance(String newConnaissance) {
    state = state.copyWith(connaissance: newConnaissance);
  }
}

// Define the provider for the state
final Emploi1StateProvider =
    StateNotifierProvider<Emploi1StateNotifier, Emploi1State>(
  (ref) => Emploi1StateNotifier(),
);
