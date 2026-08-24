import 'dart:io';

import 'package:hindi_pdf_fixer/hindi_pdf_fixer.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

Future<void> main(List<String> args) async {
  if (args.isEmpty) {
    stderr.writeln('Usage: dart run example/main.dart /path/to/NotoSansDevanagari-Regular.ttf');
    exitCode = 64;
    return;
  }

  final fontBytes = await File(args.first).readAsBytes();
  final font = ShapedFont.fromBytes(fontBytes, name: 'Hindi example');

  try {
    final document = pw.Document();
    document.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (_) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            HindiHeader(
              'Hindi PDF shaping',
              font: font,
              fontSize: 24,
            ),
            pw.SizedBox(height: 16),
            HindiParagraph(
              'हिन्दी: मैं हिंदी में लिख रहा हूँ।',
              font: font,
              fontSize: 16,
            ),
            pw.SizedBox(height: 12),
            HindiText(
              'क्षत्रिय नियुक्ति प्राधिकारी शिक्षा संस्कृति परीक्षा',
              font: font,
              fontSize: 18,
            ),
          ],
        ),
      ),
    );

    await File('hindi_pdf_fixer_example.pdf').writeAsBytes(await document.save());
  } finally {
    font.dispose();
  }
}
