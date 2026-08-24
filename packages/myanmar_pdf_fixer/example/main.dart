import 'dart:io';

import 'package:myanmar_pdf_fixer/myanmar_pdf_fixer.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

Future<void> main(List<String> args) async {
  if (args.isEmpty) {
    stderr.writeln('Usage: dart run example/main.dart /path/to/NotoSansMyanmar-Regular.ttf');
    exitCode = 64;
    return;
  }

  final fontBytes = await File(args.first).readAsBytes();
  final font = ShapedFont.fromBytes(fontBytes, name: 'Myanmar/Burmese example');

  try {
    final document = pw.Document();
    document.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (_) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            MyanmarHeader(
              'Myanmar/Burmese PDF shaping',
              font: font,
              fontSize: 24,
            ),
            pw.SizedBox(height: 16),
            MyanmarParagraph(
              'မြန်မာ: ကျွန်ုပ် မြန်မာဘာသာဖြင့် ရေးသားနေပါသည်။',
              font: font,
              fontSize: 16,
            ),
            pw.SizedBox(height: 12),
            MyanmarText(
              'မင်္ဂလာပါ ကမ္ဘာကြီး ပညာရေး ကျောင်းသား စာမေးပွဲ ကြေညာချက်',
              font: font,
              fontSize: 18,
            ),
          ],
        ),
      ),
    );

    await File('myanmar_pdf_fixer_example.pdf').writeAsBytes(await document.save());
  } finally {
    font.dispose();
  }
}
