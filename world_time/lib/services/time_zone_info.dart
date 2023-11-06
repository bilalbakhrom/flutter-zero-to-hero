

class TimeZoneInfo {
  String abbreviation;
  String clientIp;
  String dateTimeString;
  String offset;
  int dayOfWeek;
  int dayOfYear;
  bool dst;

  DateTime now() {
    var datetime = DateTime.parse(dateTimeString);
    var hours = int.parse(offset.substring(1, 3));
    datetime.add(Duration(hours: hours));

    return datetime;
  }

  TimeZoneInfo({
    required this.abbreviation,
    required this.clientIp,
    required this.dateTimeString,
    required this.offset,
    required this.dayOfWeek,
    required this.dayOfYear,
    required this.dst
  });

  factory TimeZoneInfo.fromJson(Map<String, dynamic> json) {
    return TimeZoneInfo(
        abbreviation: json['abbreviation'],
        clientIp: json['client_ip'],
        dateTimeString: json['datetime'],
        offset: json['utc_offset'],
        dayOfWeek: json['day_of_week'],
        dayOfYear: json['day_of_year'],
        dst: json['dst']
    );
  }
}