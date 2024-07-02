// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, unused_import

import 'package:flutter/material.dart';
import 'package:invoice_task/model/invoice_provider.dart';
import 'package:invoice_task/pages/loaded_task.dart';
import 'package:invoice_task/pages/unloaded_task.dart';
import 'package:provider/provider.dart';

class DispatchedScreen extends StatefulWidget {
  final String? taskName;
  final String? batchNo;
  final String? invoiceNo;

  DispatchedScreen({this.taskName, this.batchNo, this.invoiceNo});

  @override
  _DispatchedScreenState createState() => _DispatchedScreenState();
}

class _DispatchedScreenState extends State<DispatchedScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Dispatched Screen',
            style: TextStyle(color: Colors.white),
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                  text:
                      'Unloaded (${Provider.of<InvoiceProvider>(context).unloadedInvoices.length})'),
              Tab(
                  text:
                      'Loaded (${Provider.of<InvoiceProvider>(context).loadedInvoices.length})'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            UnloadedTab(searchController: searchController),
            LoadedTab(),
          ],
        ),
      ),
    );
  }
}
