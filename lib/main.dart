import 'package:alerto24/home/auth/pages/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:alerto24/home/tiktok_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'home/auth/pages/home_page.dart';
import 'package:alerto24/home/auth/firebase_auth_methods.dart';
// import 'package:flutter_facebook_sdk/flutter_facebook_sdk.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  if (kIsWeb) {
    FacebookAuth.i.webInitialize(
      appId: "1129634001214960", // Replace with your app id
      cookie: true,
      xfbml: true,
      version: "v12.0",
    );
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FirebaseAuthMethods>(
          create: (_) => FirebaseAuthMethods(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<FirebaseAuthMethods>().authState,
          initialData: null,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Firebase Auth Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const AuthWrapper(),
        routes: {
          RegisterPage.routeName: (context) => const RegisterPage(),
          HomePage.routeName: (context) => const HomePage(),
        },
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    if (firebaseUser != null) {
      return const TiktokPage();
    }
    return const HomePage();
  }
}

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(const MyApp());
// }

  // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Alerto24 Flutter',
//       theme: ThemeData.light(),
//       // initialRoute: "/",
//       // getPages: [GetPage(name: "/", page: () => TiktokPage())],
//       // home: TiktokPage(),
//       // home: const HomePage(),
//       initialRoute: "/",
//       getPages: [GetPage(name: "/", page: () => HomePage())],
//       home: HomePage(),
//     );
//   }
// }