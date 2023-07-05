import 'dart:io';

import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';

import '../model/customerModel.dart';
import '../model/invoiceModel.dart';
import '../model/supplierModel.dart';
import '../networking.dart/pdfInvoiceApi.dart';
import '../networking.dart/pdf_api.dart';
import '../utils/appText.dart';


class PdfPages extends StatefulWidget {
  @override
  _PdfPagesState createState() => _PdfPagesState();
}

class _PdfPagesState extends State<PdfPages> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: AppText(
                                  text:"invoice page"
                                      
                                ),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(32),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TitleWidget(
                  icon: Icons.picture_as_pdf,
                  text: 'Generate Invoice',
                ),
                const SizedBox(height: 48),
                ButtonWidget(
                  text: 'Invoice PDF',
                  onClicked: () async {
                    final date = DateTime.now();
                    final dueDate = date.add(Duration(days: 7));

                    final invoice = Invoice(
                      supplier: Supplier(
                        name: 'Sarah Field',
                        address: 'Sarah Street 9, Beijing, China',
                        paymentInfo: 'arun',
                      ),
                      customer: Customer(
                        name: 'Apple Inc.',
                        address: 'Apple Street, Cupertino, CA 95014',
                      ),
                      info: InvoiceInfo(
                        date: date,
                        dueDate: dueDate,
                        description: 'My description...',
                        number: "9"
                        // '${DateTime.now().year}-9999',
                      ),
                      items: [
                        InvoiceItem(
                          description: 'Coffee',
                          date: DateTime.now(),
                          quantity: 3,
                          vat: 0.19,
                          unitPrice: 5.99,
                        ),
                        // InvoiceItem(
                        //   description: 'Water',
                        //   date: DateTime.now(),
                        //   quantity: 8,
                        //   vat: 0.19,
                        //   unitPrice: 0.99,
                        // ),
                        // InvoiceItem(
                        //   description: 'Orange',
                        //   date: DateTime.now(),
                        //   quantity: 3,
                        //   vat: 0.19,
                        //   unitPrice: 2.99,
                        // ),
                        // InvoiceItem(
                        //   description: 'Apple',
                        //   date: DateTime.now(),
                        //   quantity: 8,
                        //   vat: 0.19,
                        //   unitPrice: 3.99,
                        // ),
                        // InvoiceItem(
                        //   description: 'Mango',
                        //   date: DateTime.now(),
                        //   quantity: 1,
                        //   vat: 0.19,
                        //   unitPrice: 1.59,
                        // ),
                        // InvoiceItem(
                        //   description: 'Blue Berries',
                        //   date: DateTime.now(),
                        //   quantity: 5,
                        //   vat: 0.19,
                        //   unitPrice: 0.99,
                        // ),
                        // InvoiceItem(
                        //   description: 'Lemon',
                        //   date: DateTime.now(),
                        //   quantity: 4,
                        //   vat: 0.19,
                        //   unitPrice: 1.29,
                        // ),
                      ],
                    );

                    final pdfFile = await PdfInvoiceApi.generate(invoice);
                    
                    await OpenFile.open(pdfFile.path);
                  //  await PdfApi.openFile(pdfFile);
                  },
                ),
              ],
            ),
          ),
        ),
      );
}








class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(40),
        ),
        child: FittedBox(
          child: Text(
            text,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        onPressed: onClicked,
      );
}



class TitleWidget extends StatelessWidget {
  final IconData icon;
  final String text;

  const TitleWidget({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Icon(icon, size: 100, color: Colors.white),
          const SizedBox(height: 16),
          Text(
            text,
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      );
}

// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:orangeeye/utils/appText.dart';

// class PdfInvoice extends StatefulWidget {
//   const PdfInvoice({super.key});

//   @override
//   State<PdfInvoice> createState() => _PdfInvoiceState();
// }

// class _PdfInvoiceState extends State<PdfInvoice> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           TextButton(onPressed: (){

//           }, child: AppText(text: "invoice",))
//         ],
//       ),
//     );
//   }
// }
