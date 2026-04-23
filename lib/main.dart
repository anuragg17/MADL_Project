// SAME IMPORTS
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDLh0rI4IMM-JOmqw9taBEDYB9II9Qp1GE",
      appId: "1:628542406061:web:05b69b216df353f28ef524",
      messagingSenderId: "628542406061",
      projectId: "anurag1lifegym",
      authDomain: "anurag1lifegym.firebaseapp.com",
      storageBucket: "anurag1lifegym.firebasestorage.app",
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GymHomePage(),
    );
  }
}

////////////////////////////////////////////////////////////
/// HOME PAGE
////////////////////////////////////////////////////////////

class GymHomePage extends StatelessWidget {
  const GymHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("1Life Gym"),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 0, 228, 216), Color(0xFF1a1a1a)],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.fitness_center, size: 100, color: Colors.orange),
              const SizedBox(height: 20),
              const Text("1Life Gym",
                  style: TextStyle(fontSize: 36, color: Colors.orange)),
              const SizedBox(height: 40),

              _btn("Register", Colors.green, () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const RegisterScreen()));
              }),

              _btn("Login", Colors.blue, () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const LoginScreen()));
              }),
            ],
          ),
        ),
      ),
    );
  }
}

////////////////////////////////////////////////////////////
/// REGISTER + LOGIN
////////////////////////////////////////////////////////////

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final email = TextEditingController();
    final password = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Register")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _input("Email", email),
            _input("Password", password, true),

            _btn("Register", Colors.green, () async {
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
                email: email.text,
                password: password.text,
              );
              Navigator.pop(context);
            }),
          ],
        ),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final email = TextEditingController();
    final password = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _input("Email", email),
            _input("Password", password, true),

            _btn("Login", Colors.redAccent, () async {
              await FirebaseAuth.instance.signInWithEmailAndPassword(
                email: email.text,
                password: password.text,
              );

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const Dashboard()),
              );
            }),
          ],
        ),
      ),
    );
  }
}

////////////////////////////////////////////////////////////
/// DASHBOARD (UPDATED)
////////////////////////////////////////////////////////////

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            /// Welcome
            Text(
              "Welcome ${user?.email}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            /// CONTACT DETAILS (UPDATED)
            const Card(
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  children: [
                    Text(
                      "Contact 1Life Gym",
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text("📞 1717179999"),
                    Text("📧 1lifegym@gmail.com"),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            /// DOUBLE TAP BMI BUTTON (FIXED)
            GestureDetector(
              onDoubleTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const BMIScreen()),
                );
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    "BMI Calculator",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            _btn("Logout", Colors.red, () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pop(context);
            }),
          ],
        ),
      ),
    );
  }
}

////////////////////////////////////////////////////////////
/// BMI SCREEN
////////////////////////////////////////////////////////////

class BMIScreen extends StatefulWidget {
  const BMIScreen({super.key});

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  final h = TextEditingController();
  final w = TextEditingController();
  double? bmi;

  void calc() async {
    double height = double.parse(h.text);
    double weight = double.parse(w.text);

    double result = weight / ((height / 100) * (height / 100));

    setState(() => bmi = result);

    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("bmi_records")
        .add({
      "bmi": result,
      "height": height,
      "weight": weight,
      "time": DateTime.now(),
    });
  }

  String status(double bmi) {
    if (bmi < 18.5) return "Underweight";
    if (bmi < 25) return "Normal";
    if (bmi < 30) return "Overweight";
    return "Obese";
  }

  Color color(double bmi) {
    if (bmi < 18.5) return Colors.blue;
    if (bmi < 25) return Colors.green;
    if (bmi < 30) return Colors.orange;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("BMI Tracker")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            _input("Height (cm)", h),
            _input("Weight (kg)", w),

            _btn("Calculate BMI", Colors.green, calc),

            if (bmi != null)
              Container(
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Text("BMI: ${bmi!.toStringAsFixed(2)}",
                        style: const TextStyle(color: Colors.white)),
                    Text(status(bmi!),
                        style: TextStyle(color: color(bmi!))),
                  ],
                ),
              ),

            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("users")
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .collection("bmi_records")
                    .orderBy("time", descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const CircularProgressIndicator();
                  }

                  final data = snapshot.data!.docs;

                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (_, i) {
                      final d = data[i];
                      return ListTile(
                        title: Text("BMI: ${d['bmi']}"),
                        subtitle:
                            Text("H:${d['height']}  W:${d['weight']}"),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

////////////////////////////////////////////////////////////
/// COMMON UI
////////////////////////////////////////////////////////////

Widget _input(String label, TextEditingController c, [bool hide = false]) {
  return Padding(
    padding: const EdgeInsets.all(5),
    child: TextField(
      controller: c,
      obscureText: hide,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: const Color.fromARGB(255, 1, 255, 221),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    ),
  );
}

Widget _btn(String text, Color color, VoidCallback f) {
  return Padding(
    padding: const EdgeInsets.all(5),
    child: SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: color),
        onPressed: f,
        child: Text(text),
      ),
    ),
  );
}