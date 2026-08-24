import 'dart:io';

import 'package:urdu_pdf_fixer/urdu_pdf_fixer.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

Future<void> main(List<String> args) async {
  if (args.isEmpty) {
    stderr.writeln('Usage: dart run example/main.dart /path/to/NotoNastaliqUrdu-Regular.ttf');
    exitCode = 64;
    return;
  }

  final fontBytes = await File(args.first).readAsBytes();
  final font = ShapedFont.fromBytes(fontBytes, name: 'Urdu example');

  try {
    final document = pw.Document();
    document.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (_) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.end,
          children: [
            UrduHeader(
              'Urdu PDF shaping',
              font: font,
              fontSize: 24,
            ),
            pw.SizedBox(height: 16),
            UrduParagraph(
              'اردو: میں اردو میں لکھ رہا ہوں۔',
              font: font,
              fontSize: 16,
            ),
            pw.SizedBox(height: 12),
            UrduText(
              'تعلیم طالب علم امتحان اطلاع ذمہ داری پاکستان',
              font: font,
              fontSize: 18,
            ),
          ],
        ),
      ),
    );

    await File('urdu_pdf_fixer_example.pdf').writeAsBytes(await document.save());
  } finally {
    font.dispose();
  }
}
