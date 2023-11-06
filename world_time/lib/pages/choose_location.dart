import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:world_time/pages/location.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(uri: 'Europe/London', location: 'London', flag: 'GB'),
    WorldTime(uri: 'Europe/Berlin', location: 'Athens', flag: 'GR'),
    WorldTime(uri: 'Africa/Cairo', location: 'Cairo', flag: 'EG'),
    WorldTime(uri: 'Africa/Tunis', location: 'Tunis', flag: 'MA'),
    WorldTime(uri: 'America/Chicago', location: 'Chicago', flag: 'US'),
    WorldTime(uri: 'America/New_York', location: 'New York', flag: 'US'),
    WorldTime(uri: 'Asia/Seoul', location: 'Seoul', flag: 'KR'),
    WorldTime(uri: 'Asia/Tashkent', location: 'Tashkent', flag: 'UZ'),
  ];

  void updateTime(int index) async {
    var worldTime = locations[index];
    await worldTime.getTime();

    if (context.mounted) {
      Navigator.pop(context, {
        'location': worldTime.location,
        'flag': worldTime.flag,
        'time': worldTime.time,
        'isDaytime': worldTime.isDaytime
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text(
          'Choose a Location',
          style: TextStyle(
              // color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                updateTime(index);
              },
              child: LocationWidget(worldTime: locations[index]),
            );
          }),
    );
  }
}
