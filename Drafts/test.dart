import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

class MyForm extends StatelessWidget {
  const MyForm({super.key});

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      child: Container(
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
              " *Pour quand vous prévoyez votre stage?",
              style: TextStyle(fontSize: 20),
            ),
            const Divider(color: Color.fromRGBO(0, 117, 201, 1)),
            Card(
              margin: const EdgeInsets.all(8.0),
              elevation: 5.0,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                side: BorderSide(
                  color: Color.fromRGBO(0, 117, 201, 1),
                  width: 2.0,
                ),
              ),
              child: FormBuilderDateTimePicker(
                name: 'calendar',
                inputType: InputType.date,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Select Date',
                  contentPadding: EdgeInsets.all(16.0),
                ),
                format: DateFormat("yyyy-MM-dd"),
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime.utc(2026),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
