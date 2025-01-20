import 'package:app/utils/config.dart';
import 'package:flutter/material.dart';

class ConsultationPage extends StatefulWidget {
  const ConsultationPage({super.key});

  @override
  State<ConsultationPage> createState() => _ConsultationPageState();
}

class _ConsultationPageState extends State<ConsultationPage> {
  // Liste des symptômes disponibles
  final List<String> symptoms = [
    "Fièvre",
    "Maux de tête",
    "Fatigue",
    "Toux",
    "Douleurs abdominales",
    "Nausées",
    "Vertiges",
    "Douleurs musculaires",
    "Essoufflement",
    "Perte d'appétit",
  ];

  // Liste des symptômes sélectionnés par le patient
  final List<String> selectedSymptoms = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Auto-consultation"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Sélectionnez vos symptômes :",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Config.spaceSmall,
            Expanded(
              child: ListView.builder(
                itemCount: symptoms.length,
                itemBuilder: (context, index) {
                  final symptom = symptoms[index];
                  final isSelected = selectedSymptoms.contains(symptom);
                  return CheckboxListTile(
                    title: Text(symptom),
                    value: isSelected,
                    onChanged: (bool? value) {
                      setState(() {
                        if (value == true) {
                          selectedSymptoms.add(symptom);
                        } else {
                          selectedSymptoms.remove(symptom);
                        }
                      });
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (selectedSymptoms.isEmpty) {
                    // Affiche un message d'avertissement si aucun symptôme n'est sélectionné
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content:
                            Text("Veuillez sélectionner au moins un symptôme."),
                      ),
                    );
                    return;
                  }

                  // Appel au backend via une future API pour obtenir les résultats
                  _consultBackend(selectedSymptoms);
                },
                child: const Text("Consulter"),
              ),
            )
          ],
        ),
      ),
    );
  }

  // Méthode pour simuler la communication avec le backend
  void _consultBackend(List<String> symptoms) {
    // Pour cet exemple, on simule une réponse du backend
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Résultats"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("Vous souffrez probablement de : Grippe"),
              SizedBox(height: 10),
              Text(
                  "Nous vous recommandons de consulter un : Médecin généraliste"),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Fermer"),
            )
          ],
        );
      },
    );
  }
}
