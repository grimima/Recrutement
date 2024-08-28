import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:pdf/widgets.dart' as pw;
import 'dart:html' as html;
import 'dart:convert';

// Function to generate PDF and return bytes
Future<void> generatePDF({
  required String name,
  required String surname,
  required String email,
  required String phoneNumber,
  required String experience,
  String? fourchette,
  String? pretention,
  String? preavis,
  required String selectedchoice,
  required bool region,
}) async {
  final pdf = pw.Document();
  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Table(
          border: pw.TableBorder.all(), // Optional: Adds borders to the table
          children: [
            pw.TableRow(children: [
              pw.Text('\n \t\t Nom:\n\n\n'),
              pw.Text(name),
            ]),
            pw.TableRow(children: [
              pw.Text(' \n \t\tPrénom:\n\n\n'),
              pw.Text(surname),
            ]),
            pw.TableRow(children: [
              pw.Text(' \n \t\tEmail:\n\n\n'),
              pw.Text(email),
            ]),
            pw.TableRow(children: [
              pw.Text('\n \t\tTéléphone:\n\n\n'),
              pw.Text(phoneNumber),
            ]),
            pw.TableRow(children: [
              pw.Text('\n \t\tExpérience du candidat :\n\n\n'),
              pw.Text(experience),
            ]),
            pw.TableRow(children: [
              pw.Text(
                  '\n \t\tFourchette salariale actuelle du candidat :\n\n\n'),
              pw.Text(fourchette ?? 'not provided'),
            ]),
            pw.TableRow(children: [
              pw.Text('\n \t\tPrétention du candidat :\n\n\n'),
              pw.Text(pretention ?? 'not provided'),
            ]),
            pw.TableRow(children: [
              pw.Text('\n \t\tDurée de préavis :\n\n\n'),
              pw.Text(preavis ?? 'not provided'),
            ]),
            pw.TableRow(children: [
              pw.Text('\n \t\tMétier sélectionné :\n\n\n'),
              pw.Text(selectedchoice),
            ]),
            pw.TableRow(children: [
              pw.Text('\n \t\tMobilité sur région:\n\n\n'),
              pw.Text(region ? 'true' : 'false'),
            ]),
          ],
        );
      },
    ),
  );
  try {
    final bytes = await pdf.save();
    final base64String = base64Encode(bytes);
    const fileName = 'ficheRécap.pdf';

    // ignore: unused_local_variable
    final anchor =
        html.AnchorElement(href: 'data:application/pdf;base64,$base64String')
          ..setAttribute('download', fileName)
          ..click();
  } catch (e) {
    print('Error generating PDF: $e');
    // Optionally handle or rethrow the error if needed
  }
}

// Function to upload PDF to the Django backend
Future<void> uploadPDF(Uint8List pdfBytes) async {
  const url = 'http://127.0.0.1:8000/';

  final request = http.MultipartRequest('POST', Uri.parse(url))
    ..files.add(
        http.MultipartFile.fromBytes('file', pdfBytes, filename: 'data.pdf'));

  final response = await request.send();

  if (response.statusCode == 200) {
    print('PDF uploaded successfully');
  } else {
    print('Failed to upload PDF');
  }
}
/*
// Function to generate and upload PDF
Future<void> generateAndUploadPDF({
  required String name,
  required String surname,
  required String email,
  required String phoneNumber,
  required String experience,
  String? fourchette,
  String? pretention,
  String? preavis,
  required String selectedchoice,
  required bool region,
}) async {
  try {
    final pdfBytes = await generatePDF(
      name: name,
      surname: surname,
      email: email,
      phoneNumber: phoneNumber,
      experience: experience,
      fourchette: fourchette,
      pretention: pretention,
      preavis: preavis,
      selectedchoice: selectedchoice,
      region: region,
    );

    await uploadPDF(pdfBytes);
  } catch (e) {
    print('Error generating or uploading PDF: $e');
  }
}
*/