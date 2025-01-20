import 'package:app/components/appointment_card.dart';
import 'package:app/components/doctor_card.dart';
import 'package:app/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Pour la list des spécialité que nous utiliserons plus bas
  List<Map<String, dynamic>> medCat = [
    {
      "icon": FontAwesomeIcons.userDoctor,
      "category": "General",
    },
    {
      "icon": FontAwesomeIcons.heartPulse,
      "category": "Cardiologue",
    },
    {
      "icon": FontAwesomeIcons.hand,
      "category": "Dermatologue",
    },
    {
      "icon": FontAwesomeIcons.teeth,
      "category": "Dentiste",
    },
    {
      "icon": FontAwesomeIcons.eye,
      "category": "Opticien",
    },
    {
      "icon": FontAwesomeIcons.personPregnant,
      "category": "Gynécologue",
    },
    {
      "icon": FontAwesomeIcons.bottleDroplet,
      "category": "Chirugien",
    },
  ];
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Text(
                    'Manuel',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(
                          'assets/profile1.jpg'), // tu vois que c'est l'image
                    ),
                  )
                ],
              ),
              Config.spaceSmall,

              //Liste des catégories ou spécialités ou...
              const Text(
                'Spécialités',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Config.spaceSmall,

              //Affichons ces spécialités
              SizedBox(
                height: Config.heightSize * 0.05,
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List<Widget>.generate(medCat.length, (index) {
                      return Card(
                        margin: const EdgeInsets.only(right: 20),
                        color: Config.primaryColor,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              FaIcon(
                                medCat[index]['icon'],
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                medCat[index]['category'],
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    })),
              ),
              Config.spaceSmall,
              const Text(
                'Rendez-vous du jour',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Config.spaceSmall,
              // créons à présent l'affichage du rendez-vous
              AppointmentCard(),
              Config.spaceSmall,
              const Text(
                'Recommandation des médecins',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Config.spaceSmall,

              // Liste des medecins recommandés
              Column(
                children: List.generate(10, (index) {
                  return const DoctorCard(
                    route: 'doc_details',
                  );
                }),
              )
            ],
          ),
        )),
      ),
    );
  }
}
