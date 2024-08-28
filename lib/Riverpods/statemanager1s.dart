import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

// Define a data class to hold the state
class StageState {
  final String name;
  final String surname;
  final String email;
  final String phoneNumber;

  StageState({
    this.name = '',
    this.surname = '',
    this.email = '',
    this.phoneNumber = '',
  });

  // Create a copyWith method to update the state
  StageState copyWith({
    String? name,
    String? surname,
    String? email,
    String? phoneNumber,
  }) {
    return StageState(
      name: name ?? this.name,
      surname: surname ?? this.surname,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }
}

// Create the notifier class that manages the state
class StageStateNotifier extends StateNotifier<StageState> {
  StageStateNotifier() : super(StageState());

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
}

// Define the provider for the state
final stageStateProvider =
    StateNotifierProvider<StageStateNotifier, StageState>(
  (ref) => StageStateNotifier(),
);
