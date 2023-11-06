import 'package:flutter/material.dart';
import 'package:country_flags/country_flags.dart';
import 'package:world_time/services/world_time.dart';

class LocationWidget extends StatelessWidget {
  WorldTime worldTime;

  LocationWidget({super.key,  required this.worldTime});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 16),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          child: Row(
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: CountryFlag.fromCountryCode(
                  worldTime.flag,
                  height: 40,
                  width: 60,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                  worldTime.location,
                  style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
