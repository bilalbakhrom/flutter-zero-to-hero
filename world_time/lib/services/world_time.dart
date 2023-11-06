import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:world_time/services/time_zone_info.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String flag;
  String uri;

  late String time;
  late bool isDaytime;

  var host = 'worldtimeapi.org';

  String get path {
    return 'api/timezone/$uri';
  }

    WorldTime({
      required this.location,
      required this.flag,
      required this.uri
    });

    Future<void> getTime() async {
      try {
        var url = Uri.http(host, path);
        var response = await http.get(url);
        Map<String, dynamic> data = jsonDecode(response.body);
        var now = TimeZoneInfo.fromJson(data).now;
        isDaytime = now.hour > 6 && now.hour < 20;
        time = DateFormat.jm().format(now);
      } catch(e) {
        print('caught error: $e');
        time = 'Could not get time data';
      }
  }
}