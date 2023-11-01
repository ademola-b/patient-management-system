String baseUrl = 'http://192.168.213.182:8000';

Uri loginUrl = Uri.parse("$baseUrl/api/accounts/login/");
Uri userUrl = Uri.parse("$baseUrl/api/accounts/user/");
Uri patientListUrl = Uri.parse("$baseUrl/api/patient/");

Uri patientDetailUrl(String id) {
  return Uri.parse("$baseUrl/api/patient/$id/");
}

Uri medicineListUrl = Uri.parse("$baseUrl/api/medicine/");

Uri medicineDetailUrl(String id) {
  return Uri.parse("$baseUrl/api/medicine/$id/");
}

Uri prescribeDrugUrl = Uri.parse("$baseUrl/api/prescription/");
// Uri drugInvoiceUrl = Uri.parse("$baseUrl/api/drug-prescription/c1bcd65b55414cfe8a3aa4d0fd743c36/");

Uri drugInvoiceUrl(String id) {
  return Uri.parse("$baseUrl/api/drug-prescription/$id/");
}

Uri visitReportUrl(String? from, String? to) {
  return Uri.parse("$baseUrl/api/visitation-report/?from=$from&to=$to");
}
