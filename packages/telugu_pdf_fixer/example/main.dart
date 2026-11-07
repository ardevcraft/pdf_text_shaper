import 'dart:io';

import 'package:telugu_pdf_fixer/telugu_pdf_fixer.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

Future<void> main(List<String> args) async {
  if (args.isEmpty) {
    stderr.writeln(
      'Usage: dart run example/main.dart /path/to/NotoSansTelugu-Regular.ttf',
    );
    exitCode = 64;
    return;
  }

  final fontBytes = await File(args.first).readAsBytes();
  final font = ShapedFont.fromBytes(fontBytes, name: 'Telugu example');

  try {
    final document = pw.Document();
    document.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (_) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            TeluguHeader('Telugu PDF shaping', font: font, fontSize: 24),
            pw.SizedBox(height: 16),
            TeluguParagraph(
              'తెలుగు: నేను తెలుగులో వ్రాస్తున్నాను.',
              font: font,
              fontSize: 16,
            ),
            pw.SizedBox(height: 12),
            TeluguText(
              'విద్య విద్యార్థి పరీక్ష ప్రకటన బాధ్యత తెలుగు',
              font: font,
              fontSize: 18,
            ),
          ],
        ),
      ),
    );

    await File('telugu_pdf_fixer_example.pdf')
        .writeAsBytes(await document.save());
  } finally {
    font.dispose();
  }
}
