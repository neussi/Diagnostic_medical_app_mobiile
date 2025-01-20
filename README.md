

# Diagnostic Medical App - Mobile (Flutter)

Ce projet est une application mobile développée avec **Flutter** pour la documentation des soins médicaux. L'application permet de gérer les utilisateurs, les patients, les structures sanitaires et les médecins, tout en intégrant un moteur d'aide au diagnostic via une messagerie interne. L'interface est conçue pour être intuitive, multilingue (Français et Anglais) et facile à utiliser.

---

## Fonctionnalités principales

1. **Multi-langue** : Support du Français et de l'Anglais.
2. **Gestion des utilisateurs** :
   - Création, lecture, mise à jour et suppression (CRUD) des utilisateurs et de leurs comptes.
3. **Gestion des patients** :
   - CRUD sur les patients.
4. **Gestion des structures sanitaires** :
   - CRUD sur les structures sanitaires.
5. **Gestion des médecins** :
   - CRUD sur les médecins.
6. **Documentation des soins** :
   - Aide à la création et à la gestion des dossiers médicaux.
7. **Dashboard** :
   - Tableau de bord pour visualiser les données clés.
8. **Intégration du moteur d'inférence** :
   - Communication avec le moteur d'aide au diagnostic via une messagerie intégrée.

---

## Technologies utilisées

- **Framework** : Flutter (Obligatoire)
- **Langage** : Dart
- **Gestion d'état** : Provider ou Riverpod (au choix)
- **Navigation** : Flutter Navigator ou GoRouter
- **API** : RESTful API pour communiquer avec le backend (sans détail sur Spring Boot ici)
- **Base de données locale** : SQLite ou Hive (pour le stockage local)
- **Internationalisation** : Packages `flutter_localizations` et `intl` pour le multi-langue.

---

## Prérequis

Avant de commencer, assurez-vous d'avoir les outils suivants installés :

1. **Flutter SDK** : [Guide d'installation de Flutter](https://flutter.dev/docs/get-started/install)
2. **IDE** :
   - Android Studio (recommandé) ou Visual Studio Code avec les extensions Flutter et Dart.
3. **Émulateur ou appareil physique** :
   - Configurez un émulateur Android/iOS ou utilisez un appareil physique pour tester l'application.
4. **Git** : [Guide d'installation de Git](https://git-scm.com/book/fr/v2/D%C3%A9marrage-rapide-Installation-de-Git)

---

## Installation

1. **Cloner le dépôt**

   Ouvrez un terminal et exécutez la commande suivante pour cloner le projet :

   ```bash
   git clone https://github.com/neussi/Diagnostic_medical_app_mobiile.git
   cd Diagnostic_medical_app_mobiile
   ```

2. **Configurer Flutter**

   Assurez-vous que Flutter est correctement installé en exécutant :

   ```bash
   flutter doctor
   ```

   Résolvez tous les problèmes signalés (comme les SDK manquants ou les outils non configurés).

3. **Installer les dépendances**

   Exécutez la commande suivante pour installer toutes les dépendances du projet :

   ```bash
   flutter pub get
   ```

4. **Configurer les variables d'environnement**

   Créez un fichier `.env` à la racine du projet et ajoutez les variables nécessaires, comme l'URL de l'API :

   ```
   API_URL=http://votre-url-api.com
   ```

   Utilisez le package `flutter_dotenv` pour charger ces variables dans l'application.

5. **Lancer l'application**

   Connectez un émulateur ou un appareil physique, puis exécutez :

   ```bash
   flutter run
   ```

---

## Structure du projet

Voici l'organisation du projet Flutter :

```
lib/
│
├── main.dart                // Point d'entrée de l'application
│
├── models/                  // Modèles de données (utilisateurs, patients, médecins, etc.)
│   ├── user_model.dart
│   ├── patient_model.dart
│   └── doctor_model.dart
│
├── services/                // Services pour la communication avec l'API
│   ├── api_service.dart
│   └── inference_service.dart
│
├── screens/                 // Écrans de l'application
│   ├── login_screen.dart
│   ├── patient_list_screen.dart
│   ├── doctor_list_screen.dart
│   └── dashboard_screen.dart
│
├── widgets/                 // Composants réutilisables
│   ├── custom_app_bar.dart
│   ├── patient_card.dart
│   └── doctor_card.dart
│
├── utils/                   // Utilitaires et helpers
│   ├── constants.dart       // Constantes globales (couleurs, styles, etc.)
│   ├── helpers.dart         // Fonctions utilitaires
│   └── localization.dart    // Gestion de l'internationalisation
│
├── assets/                  // Ressources statiques (images, polices, etc.)
│   ├── images/
│   └── fonts/
│
└── test/                    // Tests unitaires et d'intégration
    ├── unit/
    └── integration/
```

---

## Configuration de l'interface utilisateur

### Internationalisation (i18n)

L'application supporte le Français et l'Anglais. Pour ajouter une nouvelle langue :

1. Ajoutez les fichiers de traduction dans le dossier `assets/lang/` (par exemple, `fr.json` et `en.json`).
2. Utilisez le package `flutter_localizations` pour charger les traductions.
3. Implémentez un sélecteur de langue dans l'interface utilisateur.

### Thème et styles

Le thème de l'application est configuré dans `lib/utils/constants.dart`. Vous pouvez personnaliser les couleurs, les polices et les styles globaux ici.

---

## Communication avec le moteur d'inférence

Le moteur d'inférence est intégré via une messagerie interne. Pour communiquer avec le moteur :

1. Utilisez un service dédié (`inference_service.dart`) pour envoyer et recevoir des messages.
2. Implémentez une interface utilisateur conviviale pour afficher les résultats du diagnostic.

---

## Tests

L'application inclut des tests unitaires et d'intégration pour garantir la qualité du code. Pour exécuter les tests :

```bash
flutter test
```

---

## Contribution

Les contributions sont les bienvenues ! Pour contribuer au projet :

1. Forkez le dépôt.
2. Créez une nouvelle branche (`git checkout -b feature/NouvelleFonctionnalité`).
3. Committez vos changements (`git commit -m 'Ajouter une nouvelle fonctionnalité'`).
4. Pushez vers la branche (`git push origin feature/NouvelleFonctionnalité`).
5. Ouvrez une Pull Request.

---

```

### Points clés :
- Ce `README` se concentre uniquement sur la partie **Flutter**.
- Il détaille l'installation, la structure du projet, les fonctionnalités et les technologies utilisées.
- Il est prêt à être utilisé pour votre projet mobile.