// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:invoice_task/model/invoice_provider.dart';
import 'package:provider/provider.dart';

class LoadedTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<InvoiceProvider>(
      builder: (context, provider, child) {
        return ListView.builder(
          itemCount: provider.loadedInvoices.length,
          itemBuilder: (context, index) {
            final invoice = provider.loadedInvoices[index];
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15)),
                padding: const EdgeInsets.all(10),
                child: ListTile(
                  title: Text(
                    invoice.taskName,
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                  subtitle: Text(
                    'Invoice No: ${invoice.invoiceNo} | Batch No: ${invoice.batchNo}',
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
