import 'dart:io';

import 'package:kannada_pdf_fixer/kannada_pdf_fixer.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

Future<void> main(List<String> args) async {
  if (args.isEmpty) {
    stderr.writeln(
      'Usage: dart run example/main.dart /path/to/NotoSansKannada-Regular.ttf',
    );
    exitCode = 64;
    return;
  }

  final fontBytes = await File(args.first).readAsBytes();
  final font = ShapedFont.fromBytes(fontBytes, name: 'Kannada example');

  try {
    final document = pw.Document();
    document.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (_) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            KannadaHeader('Kannada PDF shaping', font: font, fontSize: 24),
            pw.SizedBox(height: 16),
            KannadaParagraph(
              'ಕನ್ನಡ: ನಾನು ಕನ್ನಡದಲ್ಲಿ ಬರೆಯುತ್ತಿದ್ದೇನೆ.',
              font: font,
              fontSize: 16,
            ),
            pw.SizedBox(height: 12),
            KannadaText(
              'ಶಿಕ್ಷಣ ವಿದ್ಯಾರ್ಥಿ ಪರೀಕ್ಷೆ ಪ್ರಕಟಣೆ ಜವಾಬ್ದಾರಿ ಕರ್ನಾಟಕ',
              font: font,
              fontSize: 18,
            ),
          ],
        ),
      ),
    );

    await File('kannada_pdf_fixer_example.pdf')
        .writeAsBytes(await document.save());
  } finally {
    font.dispose();
  }
}
