class Helpers {

  Helpers._privateConstructor();

  static final Helpers instance = Helpers._privateConstructor();

  String convertMapToQueryString(Map<String, String> map) {
      String query = "?";
      map.forEach((key, value) {
        query += "$key=$value&";
      });
  }

}