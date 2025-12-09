import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:iiken/auth/auth_get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    url: "https://akjfncvbtquzesbuuqbr.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFramZuY3ZidHF1emVzYnV1cWJyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjE4MDg2MDMsImV4cCI6MjA3NzM4NDYwM30.O2_89-rvFD7ht73EDjYfLJbEvP0yLJ7IgV6zktgFL40",
  );
  runApp(DevicePreview(enabled: true, builder: (context) => MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: AuthGate());
  }
}
