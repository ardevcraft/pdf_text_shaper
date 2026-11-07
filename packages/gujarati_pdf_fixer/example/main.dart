import 'dart:io';

import 'package:gujarati_pdf_fixer/gujarati_pdf_fixer.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

Future<void> main(List<String> args) async {
  if (args.isEmpty) {
    stderr.writeln(
      'Usage: dart run example/main.dart /path/to/NotoSansGujarati-Regular.ttf',
    );
    exitCode = 64;
    return;
  }

  final fontBytes = await File(args.first).readAsBytes();
  final font = ShapedFont.fromBytes(fontBytes, name: 'Gujarati example');

  try {
    final document = pw.Document();
    document.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (_) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            GujaratiHeader('Gujarati PDF shaping', font: font, fontSize: 24),
            pw.SizedBox(height: 16),
            GujaratiParagraph(
              'ગુજરાતી: હું ગુજરાતીમાં લખું છું.',
              font: font,
              fontSize: 16,
            ),
            pw.SizedBox(height: 12),
            GujaratiText(
              'શિક્ષણ વિદ્યાર્થી પરીક્ષા સૂચના જવાબદારી ગુજરાત',
              font: font,
              fontSize: 18,
            ),
          ],
        ),
      ),
    );

    await File('gujarati_pdf_fixer_example.pdf')
        .writeAsBytes(await document.save());
  } finally {
    font.dispose();
  }
}
