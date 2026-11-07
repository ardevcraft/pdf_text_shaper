import 'dart:io';

import 'package:lao_pdf_fixer/lao_pdf_fixer.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

Future<void> main(List<String> args) async {
  if (args.isEmpty) {
    stderr.writeln(
      'Usage: dart run example/main.dart /path/to/NotoSansLao-Regular.ttf',
    );
    exitCode = 64;
    return;
  }

  final fontBytes = await File(args.first).readAsBytes();
  final font = ShapedFont.fromBytes(fontBytes, name: 'Lao example');

  try {
    final document = pw.Document();
    document.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (_) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            LaoHeader('Lao PDF shaping', font: font, fontSize: 24),
            pw.SizedBox(height: 16),
            LaoParagraph(
              'ພາສາລາວ: ຂ້ອຍກຳລັງຂຽນພາສາລາວ.',
              font: font,
              fontSize: 16,
            ),
            pw.SizedBox(height: 12),
            LaoText(
              'ສະບາຍດີໂລກ ການສຶກສາ ນັກຮຽນ ການສອບເສັງ ປະກາດ',
              font: font,
              fontSize: 18,
            ),
          ],
        ),
      ),
    );

    await File('lao_pdf_fixer_example.pdf').writeAsBytes(await document.save());
  } finally {
    font.dispose();
  }
}
