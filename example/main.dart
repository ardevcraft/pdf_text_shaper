import 'dart:io';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf_text_shaper/pdf_text_shaper.dart';

Future<void> main(List<String> args) async {
  if (args.isEmpty) {
    stderr.writeln(
      'Usage: dart run example/main.dart /path/to/a/Unicode-font.ttf',
    );
    exitCode = 64;
    return;
  }

  final fontBytes = await File(args.first).readAsBytes();
  final font = ShapedFont.fromBytes(fontBytes, name: 'Example font');

  try {
    final document = pw.Document();
    document.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              ShapedText(
                'বাংলা: আমি বাংলায় লিখছি।',
                style: ShapedTextStyle(font: font, fontSize: 20),
              ),
              pw.SizedBox(height: 12),
              ShapedText(
                'বাংলাদেশ শিক্ষার্থী রাষ্ট্র প্রজ্ঞাপন ক্ষুদ্র দায়িত্ব পরীক্ষা',
                style: ShapedTextStyle(font: font, fontSize: 20),
              ),
            ],
          );
        },
      ),
    );
    // document.addPage(
    //   pw.Page(
    //     pageFormat: PdfPageFormat.a4,
    //     build: (context) {
    //       return pw.Column(
    //         crossAxisAlignment: pw.CrossAxisAlignment.start,
    //         children: [
    //           ShapedText(
    //             'বাংলা: আমি বাংলায় লিখছি।',
    //             style: ShapedTextStyle(font: font, fontSize: 20),
    //           ),
    //           pw.SizedBox(height: 12),
    //           ShapedText(
    //             'हिन्दी: क्षत्रिय नियुक्ति प्राधिकारी हिंदी',
    //             style: ShapedTextStyle(font: font, fontSize: 20),
    //           ),
    //           pw.SizedBox(height: 12),
    //           ShapedText(
    //             'தமிழ்: வணக்கம் உலகம்',
    //             style: ShapedTextStyle(font: font, fontSize: 20),
    //           ),
    //           pw.SizedBox(height: 12),
    //           ShapedText(
    //             'العربية: مرحبا بالعالم',
    //             style: ShapedTextStyle(
    //               font: font,
    //               fontSize: 20,
    //               direction: AnyPdfTextDirection.rightToLeft,
    //               align: AnyPdfTextAlign.end,
    //             ),
    //           ),
    //         ],
    //       );
    //     },
    //   ),
    // );

    await File('any_pdf_fixer_example.pdf').writeAsBytes(await document.save());
  } finally {
    font.dispose();
  }
}
