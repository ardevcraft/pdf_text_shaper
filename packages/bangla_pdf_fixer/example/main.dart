import 'dart:io';

import 'package:bangla_pdf_fixer/bangla_pdf_fixer.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

Future<void> main(List<String> args) async {
  if (args.isEmpty) {
    stderr.writeln('Usage: dart run example/main.dart /path/to/NotoSansBengali-Regular.ttf');
    exitCode = 64;
    return;
  }

  final fontBytes = await File(args.first).readAsBytes();
  final font = ShapedFont.fromBytes(fontBytes, name: 'Bangla/Bengali example');

  try {
    final document = pw.Document();
    document.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (_) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            BanglaHeader(
              'Bangla/Bengali PDF shaping',
              font: font,
              fontSize: 24,
            ),
            pw.SizedBox(height: 16),
            BanglaParagraph(
              'আমি বাংলায় লিখছি।',
              font: font,
              fontSize: 16,
            ),
            pw.SizedBox(height: 12),
            BanglaText(
              'বাংলাদেশ শিক্ষার্থী রাষ্ট্র প্রজ্ঞাপন ক্ষুদ্র দায়িত্ব পরীক্ষা',
              font: font,
              fontSize: 18,
            ),
          ],
        ),
      ),
    );

    await File('bangla_pdf_fixer_example.pdf').writeAsBytes(await document.save());
  } finally {
    font.dispose();
  }
}
