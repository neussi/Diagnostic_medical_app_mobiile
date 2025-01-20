import 'package:app/utils/config.dart';
import 'package:flutter/material.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

enum FilterStatus { prochain, accompli, annuler }

class _AppointmentPageState extends State<AppointmentPage> {
  FilterStatus status = FilterStatus.prochain; // initialisation ouaih !
  Alignment _alignment = Alignment.centerLeft;
  List<dynamic> schedules = [
    {
      "doctor_name": "Richard Manuel",
      "doctor_profile": "assets/doctor_2.jpg",
      "category": "Dentist",
      "status": FilterStatus.prochain,
    },
    {
      "doctor_name": "Manuel Kenne",
      "doctor_profile": "assets/doctor_2.jpg",
      "category": "Cardiologue",
      "status": FilterStatus.accompli,
    },
    {
      "doctor_name": "Aime Manuel",
      "doctor_profile": "assets/doctor_2.jpg",
      "category": "Dentist",
      "status": FilterStatus.accompli,
    },
    {
      "doctor_name": "Manuel Aime",
      "doctor_profile": "assets/doctor_2.jpg",
      "category": "Dermatologue",
      "status": FilterStatus.annuler,
    },
  ];
  @override
  Widget build(BuildContext context) {
    List<dynamic> filteredSchedules = schedules.where((var schedule) {
      // switch (schedule['status']) {
      //   case 'Bientot':
      //     schedule['status'] = FilterStatus.prochain;
      //     break;
      //   case 'Terminé':
      //     schedule['status'] = FilterStatus.accompli;
      //     break;
      //   case 'Annuler':
      //     schedule['status'] = FilterStatus.annuler;
      //     break;
      // }
      return schedule['status'] == status;
    }).toList();
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const Text(
            'Heure du Rendez-vous',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Config.spaceSmall,
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (FilterStatus filterStatus in FilterStatus.values)
                      Expanded(
                          child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (filterStatus == FilterStatus.prochain) {
                              status = FilterStatus.prochain;
                              _alignment = Alignment.centerLeft;
                            } else if (filterStatus == FilterStatus.accompli) {
                              status = FilterStatus.accompli;
                              _alignment = Alignment.center;
                            } else if (filterStatus == FilterStatus.annuler) {
                              status = FilterStatus.annuler;
                              _alignment = Alignment.centerRight;
                            }
                          });
                        },
                        child: Center(
                          child: Text(filterStatus.name),
                        ),
                      )),
                  ],
                ),
              ),
              AnimatedAlign(
                alignment: _alignment,
                duration: const Duration(milliseconds: 200),
                child: Container(
                  width: 110,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Config.primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      status.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          Config.spaceSmall,
          Expanded(
            child: ListView.builder(
              itemCount: filteredSchedules.length,
              itemBuilder: ((context, index) {
                var schedule = filteredSchedules[index];
                bool isLastElement = filteredSchedules.length + 1 == index;
                return Card(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: !isLastElement
                      ? const EdgeInsets.only(bottom: 20)
                      : EdgeInsets.zero,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage(schedule['doctor_profile']),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  schedule['doctor_name'],
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  schedule['category'],
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),

                        // scheldule
                        const ScheduleCard(),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {},
                                child: const Text(
                                  'Annuler',
                                  style: TextStyle(color: Config.primaryColor),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: Config.primaryColor,
                                ),
                                onPressed: () {},
                                child: const Text(
                                  'Reprogrammer',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          )
        ],
      ),
    ));
  }
}

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const Icon(
            Icons.calendar_today,
            color: Config.primaryColor,
            size: 15,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            'Lundi, 20/01/2025',
            style: const TextStyle(color: Config.primaryColor),
          ),
          const SizedBox(
            width: 20,
          ),
          const Icon(
            Icons.access_alarm,
            color: Config.primaryColor,
            size: 17,
          ),
          const SizedBox(
            width: 5,
          ),
          Flexible(
              child: Text(
            '6:00 AM',
            style: TextStyle(color: Config.primaryColor),
          ))
        ],
      ),
    );
  }
}
