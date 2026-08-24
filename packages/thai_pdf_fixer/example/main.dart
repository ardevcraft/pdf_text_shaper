import 'dart:io';

import 'package:thai_pdf_fixer/thai_pdf_fixer.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

Future<void> main(List<String> args) async {
  if (args.isEmpty) {
    stderr.writeln('Usage: dart run example/main.dart /path/to/NotoSansThai-Regular.ttf');
    exitCode = 64;
    return;
  }

  final fontBytes = await File(args.first).readAsBytes();
  final font = ShapedFont.fromBytes(fontBytes, name: 'Thai example');

  try {
    final document = pw.Document();
    document.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (_) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            ThaiHeader(
              'Thai PDF shaping',
              font: font,
              fontSize: 24,
            ),
            pw.SizedBox(height: 16),
            ThaiParagraph(
              'ภาษาไทย: ฉันกำลังเขียนภาษาไทยอยู่',
              font: font,
              fontSize: 16,
            ),
            pw.SizedBox(height: 12),
            ThaiText(
              'สวัสดีชาวโลก การศึกษา นักเรียน การสอบ ประกาศ',
              font: font,
              fontSize: 18,
            ),
          ],
        ),
      ),
    );

    await File('thai_pdf_fixer_example.pdf').writeAsBytes(await document.save());
  } finally {
    font.dispose();
  }
}
