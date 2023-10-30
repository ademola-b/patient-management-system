String baseUrl = 'http://192.168.213.182:8000';

Uri loginUrl = Uri.parse("$baseUrl/api/accounts/login/");
Uri userUrl = Uri.parse("$baseUrl/api/accounts/user/");
Uri patientListUrl = Uri.parse("$baseUrl/api/patient/");

Uri patientDetailUrl(String id) {
  return Uri.parse("$baseUrl/api/patient/$id/");
}
