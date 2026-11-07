import 'dart:io';

import 'package:khmer_pdf_fixer/khmer_pdf_fixer.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

Future<void> main(List<String> args) async {
  if (args.isEmpty) {
    stderr.writeln(
      'Usage: dart run example/main.dart /path/to/NotoSansKhmer-Regular.ttf',
    );
    exitCode = 64;
    return;
  }

  final fontBytes = await File(args.first).readAsBytes();
  final font = ShapedFont.fromBytes(fontBytes, name: 'Khmer example');

  try {
    final document = pw.Document();
    document.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (_) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            KhmerHeader('Khmer PDF shaping', font: font, fontSize: 24),
            pw.SizedBox(height: 16),
            KhmerParagraph(
              'ខ្មែរ: ខ្ញុំកំពុងសរសេរជាភាសាខ្មែរ។',
              font: font,
              fontSize: 16,
            ),
            pw.SizedBox(height: 12),
            KhmerText(
              'សួស្តីពិភពលោក ការអប់រំ សិស្ស ការប្រឡង សេចក្តីជូនដំណឹង',
              font: font,
              fontSize: 18,
            ),
          ],
        ),
      ),
    );

    await File('khmer_pdf_fixer_example.pdf')
        .writeAsBytes(await document.save());
  } finally {
    font.dispose();
  }
}
