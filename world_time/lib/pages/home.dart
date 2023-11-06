import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String, dynamic> data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isEmpty
        ? ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>
        : data;
    bool isDaytime = data['isDaytime'];
    String backgroundImage = isDaytime ? 'daytime.jpg' : 'nighttime.jpg';

    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/$backgroundImage'),
                  fit: BoxFit.cover)),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton.icon(
                    onPressed: () async {
                      dynamic results =
                          await Navigator.pushNamed(context, '/location');

                      if (results != null) {
                        setState(() {
                          data = {
                            'time': results['time'],
                            'location': results['location'],
                            'isDaytime': results['isDaytime'],
                            'flat': results['flag'],
                          };
                        });
                      }
                    },
                    icon: Icon(Icons.edit_location,
                        color: (isDaytime ? Colors.black : Colors.white)),
                    label: Text('Edit Location',
                        style: TextStyle(
                            color: isDaytime ? Colors.black : Colors.white)),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data['location'],
                        style: TextStyle(
                          color: isDaytime ? Colors.black : Colors.white,
                          fontSize: 28,
                          letterSpacing: 2,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    data['time'],
                    style: TextStyle(
                        color: isDaytime ? Colors.black : Colors.white,
                        fontSize: 66),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
