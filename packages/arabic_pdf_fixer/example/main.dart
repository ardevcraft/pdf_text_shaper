import 'dart:io';

import 'package:arabic_pdf_fixer/arabic_pdf_fixer.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

Future<void> main(List<String> args) async {
  if (args.isEmpty) {
    stderr.writeln('Usage: dart run example/main.dart /path/to/NotoSansArabic-Regular.ttf');
    exitCode = 64;
    return;
  }

  final fontBytes = await File(args.first).readAsBytes();
  final font = ShapedFont.fromBytes(fontBytes, name: 'Arabic example');

  try {
    final document = pw.Document();
    document.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (_) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.end,
          children: [
            ArabicHeader(
              'Arabic PDF shaping',
              font: font,
              fontSize: 24,
            ),
            pw.SizedBox(height: 16),
            ArabicParagraph(
              'العربية: أنا أكتب باللغة العربية.',
              font: font,
              fontSize: 16,
            ),
            pw.SizedBox(height: 12),
            ArabicText(
              'مرحبا بالعالم التعليم الطالب الاختبار والإعلان',
              font: font,
              fontSize: 18,
            ),
          ],
        ),
      ),
    );

    await File('arabic_pdf_fixer_example.pdf').writeAsBytes(await document.save());
  } finally {
    font.dispose();
  }
}
