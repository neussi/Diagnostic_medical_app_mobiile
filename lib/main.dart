import 'package:app/main_layout.dart';
import 'package:app/screens/auth_page.dart';
import 'package:app/screens/booking_page.dart';
import 'package:app/screens/doctor_details.dart';
import 'package:app/screens/success_booked.dart';
import 'package:flutter/material.dart'; // Importation des widgets Material Design
import 'package:app/utils/config.dart';

// Point d'entrée de l'application Flutter
void main() {
  runApp(
      const MyApp()); // Lancement de l'application en passant le widget racine
}

// Définition du widget racine de l'application
class MyApp extends StatelessWidget {
  // Utilisation d'un constructeur constant pour optimiser les performances
  const MyApp({super.key});

  //pour le navigateur
  static final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    // ici, nous définissons le thème de l'app ashouèèè
    return MaterialApp(
      navigatorKey: navigatorKey,
      // Suppression du bandeau "debug" dans le coin de l'application
      debugShowCheckedModeBanner: false,

      // Définition du titre de l'application
      title: 'App Médicale',

      // Application d'un thème visuel
      theme: ThemeData(
        // prédéfinir le design d'entrée
        inputDecorationTheme: InputDecorationTheme(
          focusColor: Config.primaryColor,
          border: Config.outlinedBorder,
          focusedBorder: Config.focusBorder,
          errorBorder: Config.errorBorder,
          enabledBorder: Config.outlinedBorder,
          floatingLabelStyle: TextStyle(color: Config.primaryColor),
          prefixIconColor: Colors.black38,
        ),
        scaffoldBackgroundColor: Colors.white,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Config.primaryColor,
          selectedItemColor: Colors.white,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          unselectedItemColor: Colors.grey.shade700,
          elevation: 10,
          type: BottomNavigationBarType.fixed,
        ),
        useMaterial3: true, // Activation des composants Material 3
      ),

      initialRoute: '/',
      routes: {
        //Nous initialisons ici les differents chemin de page de notre app
        // c'est à dire pour l'authentification (inscription,connexion)
        '/': (context) => const AuthPage(),

        //ici c'est pour la page principale après authentification
        'main': (context) => const MainLayout(),
        //
        'doc_details': (context) => const DoctorDetails(),
        'booking_page': (context) => const BookingPage(),
        'success_booking': (context) => const AppointmentBooked(),
      },
    );
  }
}
