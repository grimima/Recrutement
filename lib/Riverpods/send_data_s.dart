import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recrutement/Riverpods/statemanager1s.dart';
import 'package:recrutement/Riverpods/statemanager2s.dart';
import 'package:recrutement/Riverpods/statemanager3s.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

@JsonSerializable()
class DataStage {
  final String nom;
  final String prenom;
  final String email;
  final String numTel;
  final String annee;
  final String convention;
  final String typestage;
  final String selectedChoice;

  DataStage(
      {this.nom = 'empty',
      this.prenom = 'empty',
      this.email = 'empty',
      this.numTel = 'empty',
      this.annee = 'empty',
      this.convention = "empty",
      this.typestage = "empty",
      this.selectedChoice = "noSelectedChoice"});

  //factory DataStage.fromJson(Map<String, String> json) => _$DataStage(json);
  //Map<String, dynamic> toJson() => _$DataStage(this);
}

Future<http.Response> fetchCV(http.Client client) async {
  return client.post(Uri.parse('https://localhost:3000'));
}

Future<void> _postData(
    String name, String surname, String email, String phoneNumber) async {
  try {
    final response = await http.post(
      Uri.parse('https://localhost:3000'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'name': name,
        'prénom': surname,
        'email': email,
        'numéroTel': phoneNumber,
        // Add any other data you want to send in the body
      }),
    );

    if (response.statusCode == 201) {
      print("Successful");
      print(_postData(name, surname, email, phoneNumber));
      // Successful POST request, handle the response here
    } else {
      // If the server returns an error response, throw an exception
      throw Exception('Failed to post data');
    }
  } catch (e) {
    print("error !!");
  }
}
