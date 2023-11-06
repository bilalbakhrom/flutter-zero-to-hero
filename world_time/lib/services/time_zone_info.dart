

class TimeZoneInfo {
  String abbreviation;
  String clientIp;
  DateTime datetime;
  String offset;
  int dayOfWeek;
  int dayOfYear;
  bool dst;

  DateTime get now {
    var copyOfDatetime = datetime;
    var hours = int.parse(offset.substring(1, 3));
    copyOfDatetime.add(Duration(hours: hours));

    return copyOfDatetime;
  }

  TimeZoneInfo({
    required this.abbreviation,
    required this.clientIp,
    required this.datetime,
    required this.offset,
    required this.dayOfWeek,
    required this.dayOfYear,
    required this.dst
  });

  factory TimeZoneInfo.fromJson(Map<String, dynamic> json) {
    return TimeZoneInfo(
        abbreviation: json['abbreviation'],
        clientIp: json['client_ip'],
        datetime: DateTime.parse(json['datetime']),
        offset: json['utc_offset'],
        dayOfWeek: json['day_of_week'],
        dayOfYear: json['day_of_year'],
        dst: json['dst']
    );
  }
}