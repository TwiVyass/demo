import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:demo/Provider/provider.dart';
import 'package:demo/start_screen.dart';
import 'organization_registration_screen.dart';
import 'patient_registration_screen.dart';
import 'doctor_diagnosis_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => RegistrationProvider(),
      child: const MaterialApp(
        home: StartScreen(),
      ),
    ),
  );
}

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Start Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrganizationRegistrationScreen()),
                );
              },
              child: const Text('Organization Registration'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PatientRegistrationScreen(organizationData: {},)),
                );
              },
              child: const Text('Patient Registration'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DoctorDiagnosisScreen()),
                );
              },
              child: const Text('Doctor Diagnosis'),
            ),
          ],
        ),
      ),
    );
  }
}
