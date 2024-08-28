import 'dart:convert';
import 'dart:html' as html;
import 'package:pdf/widgets.dart' as pw;

Future<void> generateAndDownloadStgPDF({
  required String name,
  required String surname,
  required String email,
  required String phoneNumber,
  required String annee,
  required String convention,
  required String typestage,
  required String duree,
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
              pw.Text(' \n\t \t Nom:\n\n\n'),
              pw.Text(name),
            ]),
            pw.TableRow(children: [
              pw.Text(' \n\t\tPrénom:\n\n\n'),
              pw.Text(surname),
            ]),
            pw.TableRow(children: [
              pw.Text(' \n\t\t Email:\n\n\n'),
              pw.Text(email),
            ]),
            pw.TableRow(children: [
              pw.Text('\n\t\tTéléphone:\n\n\n'),
              pw.Text(phoneNumber),
            ]),
            pw.TableRow(children: [
              pw.Text('\n \t\tAnnée d\'étude :\n\n\n'),
              pw.Text(annee),
            ]),
            pw.TableRow(children: [
              pw.Text('\n\t\tConventioné ou pas  :\n\n'),
              pw.Text(convention),
            ]),
            pw.TableRow(children: [
              pw.Text('\n\t\tSi conventioné, quel type de stage  : \n\n\n'),
              pw.Text(typestage),
            ]),
            pw.TableRow(children: [
              pw.Text('\n\t\tMétier sélectionné :\n\n\n'),
              pw.Text(selectedchoice),
            ]),
            pw.TableRow(children: [
              pw.Text('\n\t\tMobilité sur région:\n\n\n'),
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
