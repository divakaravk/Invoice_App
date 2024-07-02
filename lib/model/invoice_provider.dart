// ignore_for_file: prefer_final_fields, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'invoice_model.dart';

class InvoiceProvider with ChangeNotifier {
  List<Invoice> _unloadedInvoices = [];
  List<Invoice> _loadedInvoices = [];

  List<Invoice> get unloadedInvoices => _unloadedInvoices;
  List<Invoice> get loadedInvoices => _loadedInvoices;

  void addInvoice(Invoice invoice) {
    _unloadedInvoices.add(invoice);
    notifyListeners();
  }

  void loadInvoice(String invoiceNo) {
    Invoice? invoice = _unloadedInvoices.firstWhere(
      (inv) => inv.invoiceNo == invoiceNo,
    );

    if (invoice != null) {
      _unloadedInvoices.remove(invoice);
      _loadedInvoices.add(invoice);
      notifyListeners();
    }
  }
}
