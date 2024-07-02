// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:invoice_task/model/invoice_provider.dart';
import 'package:provider/provider.dart';

class UnloadedTab extends StatelessWidget {
  final TextEditingController searchController;

  UnloadedTab({required this.searchController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
              labelText: 'Search Invoice No',
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.blueGrey,
              )),
              suffixIcon: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
                onPressed: () {
                  final invoiceNo = searchController.text;
                  Provider.of<InvoiceProvider>(context, listen: false)
                      .loadInvoice(invoiceNo);
                  searchController.clear();
                },
                child: Text(
                  "Ok",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                )),
          ],
        ),
        Expanded(
          child: Consumer<InvoiceProvider>(
            builder: (context, provider, child) {
              return ListView.builder(
                itemCount: provider.unloadedInvoices.length,
                itemBuilder: (context, index) {
                  final invoice = provider.unloadedInvoices[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 08),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(15)),
                      child: ListTile(
                        title: Text(
                          invoice.taskName,
                          style:
                              TextStyle(fontSize: 16, color: Colors.grey[700]),
                        ),
                        subtitle: Text(
                            'Invoice No: ${invoice.invoiceNo} | Batch No: ${invoice.batchNo}',
                            style: TextStyle(
                                fontSize: 16, color: Colors.grey[700])),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
