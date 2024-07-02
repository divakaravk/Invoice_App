// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:invoice_task/model/invoice_model.dart';
import 'package:invoice_task/pages/dispatched-SCreen.dart';
import 'package:invoice_task/model/invoice_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController taskNameController = TextEditingController();
  final TextEditingController batchNoController = TextEditingController();
  final TextEditingController invoiceNoController = TextEditingController();
  void _submitData() {
    final taskName = taskNameController.text;
    final batchNo = batchNoController.text;
    final invoiceNo = invoiceNoController.text;

    if (taskName.isNotEmpty && batchNo.isNotEmpty && invoiceNo.isNotEmpty) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => DispatchedScreen()));
      final invoice =
          Invoice(taskName: taskName, invoiceNo: invoiceNo, batchNo: batchNo);
      Provider.of<InvoiceProvider>(context, listen: false).addInvoice(invoice);
      taskNameController.clear();
      batchNoController.clear();
      invoiceNoController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          "Invoice App",
          style: TextStyle(color: Colors.blueGrey),
        ),
      ),
      body: Column(children: [
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0),
          child: TextField(
            controller: taskNameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              hintText: "TaskName",
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0),
          child: TextField(
            controller: invoiceNoController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              hintText: "Invoice No",
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0),
          child: TextField(
            controller: batchNoController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              hintText: "BatchNo",
            ),
          ),
        ),
        SizedBox(
          height: 35,
        ),
        ElevatedButton(
            onPressed: () => _submitData(),
            child: Text(
              "Add Invoice",
              style: TextStyle(fontSize: 18, color: Colors.white),
            )),
      ]),
    );
  }
}
