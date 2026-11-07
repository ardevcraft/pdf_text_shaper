import 'dart:io';

import 'package:tamil_pdf_fixer/tamil_pdf_fixer.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

Future<void> main(List<String> args) async {
  if (args.isEmpty) {
    stderr.writeln(
      'Usage: dart run example/main.dart /path/to/NotoSansTamil-Regular.ttf',
    );
    exitCode = 64;
    return;
  }

  final fontBytes = await File(args.first).readAsBytes();
  final font = ShapedFont.fromBytes(fontBytes, name: 'Tamil example');

  try {
    final document = pw.Document();
    document.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (_) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            TamilHeader('Tamil PDF shaping', font: font, fontSize: 24),
            pw.SizedBox(height: 16),
            TamilParagraph(
              'தமிழ்: நான் தமிழில் எழுதுகிறேன்.',
              font: font,
              fontSize: 16,
            ),
            pw.SizedBox(height: 12),
            TamilText(
              'வணக்கம் உலகம் கல்வி மாணவர் தேர்வு அறிவிப்பு',
              font: font,
              fontSize: 18,
            ),
          ],
        ),
      ),
    );

    await File('tamil_pdf_fixer_example.pdf')
        .writeAsBytes(await document.save());
  } finally {
    font.dispose();
  }
}
