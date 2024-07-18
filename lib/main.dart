  import 'package:flutter/material.dart';
  import 'splash_screen.dart';
  import 'signtext.dart';
  import 'learnsign.dart';
  import 'voicelanguage.dart';

  void main() {
    runApp(SignLanguageApp());
  }

  class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        title: 'Sign Language App',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Roboto',
          textTheme: TextTheme(),
          appBarTheme: AppBarTheme(
            color: Colors.deepPurple,
          ),
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.deepPurple,
            textTheme: ButtonTextTheme.primary,
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      );
    }
  }

  class SignLanguageHomePage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Sign Language App',
            style: TextStyle(color: Colors.white), // App bar text color
          ),
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.deepPurple, Colors.deepPurple.withOpacity(0.8)],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Spacer(), // Push content to the center
                Container(
                  width: 350, // Adjusted width
                  child: SignLanguageBox(
                    title: 'Learn Signs',
                    icon: Icons.school_outlined,
                    color: Colors.blue[700]!,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LearnSign()),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 165, // Adjusted width for Sign to Text box
                      child: SignLanguageBox(
                        title: 'Sign to Text',
                        icon: Icons.camera_alt_outlined,
                        color: Colors.blue[500]!,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignText()),
                          );
                        },
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                      width: 165, // Adjusted width for Voice to Sign Language box
                      child: SignLanguageBox(
                        title: 'Voice to Sign',
                        icon: Icons.mic_none_outlined,
                        color: Colors.blue[500]!,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Voice_To_Sign()),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Spacer(), // Push content to the center
                Text(
                  'Powered by Intellitech Solutions',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  class SignLanguageBox extends StatelessWidget {
    final String title;
    final IconData icon;
    final Color color;
    final VoidCallback onTap;

    SignLanguageBox({
      required this.title,
      required this.icon,
      required this.color,
      required this.onTap,
    });

    @override
    Widget build(BuildContext context) {
      return Material(
        elevation: 8.0, // Add elevation for shadow
        borderRadius: BorderRadius.circular(15),
        shadowColor: Colors.black45,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            width: double.infinity, // Ensure the box takes up full width
            height: 100,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 36,
                  color: Colors.white,
                ),
                SizedBox(height: 6),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
