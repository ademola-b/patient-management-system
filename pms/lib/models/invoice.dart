// import 'package:generate_pdf_invoice_example/model/customer.dart';
import 'package:pms/models/drug_prescription_response.dart';
import 'package:pms/models/patient_list_response.dart';
// import 'package:generate_pdf_invoice_example/model/supplier.dart';

class Invoice {
  final InvoiceInfo info;
  // final PatientListResponse supplier;
  final PatientListResponse customer;
  final List<DrugPrescriptionResponse> items;

  const Invoice({
    required this.info,
    // required this.supplier,
    required this.customer,
    required this.items,
  });
}

class InvoiceInfo {
  final String description;
  final String number;
  final DateTime date;
  final DateTime dueDate;

  const InvoiceInfo({
    required this.description,
    required this.number,
    required this.date,
    required this.dueDate,
  });
}

class InvoiceItem {
  final String description;
  final DateTime date;
  final int quantity;
  final double vat;
  final double unitPrice;

  const InvoiceItem({
    required this.description,
    required this.date,
    required this.quantity,
    required this.vat,
    required this.unitPrice,
  });
}