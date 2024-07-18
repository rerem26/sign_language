import 'dart:async';

import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'signtext.dart';
import 'learnsign.dart';
import 'voicelanguage.dart';

void main() {
  runApp(SignLanguageApp());
}

class SignLanguageApp extends StatelessWidget {
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

class LearnSign extends StatefulWidget {
  final int initialIndex;

  LearnSign({this.initialIndex = 0});

  @override
  _LearnSignState createState() => _LearnSignState();
}

class _LearnSignState extends State<LearnSign> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Learn Signs'),
        backgroundColor: Colors.blue[700],
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.deepPurple, Colors.deepPurple.withOpacity(0.8)],
              ),
            ),
          ),
          PageView.builder(
            controller: _pageController,
            itemCount: 26,
            itemBuilder: (context, index) {
              String letter = String.fromCharCode(65 + index); // A is 65 in ASCII
              String imagePath = 'assets/$letter.png';
              return Container(
                color: Colors.transparent,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Learn the Sign for '$letter'",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 20),
                        Image.asset(imagePath, width: 300, height: 300),
                        SizedBox(height: 20),
                        Text(
                          "Swipe left or right to learn the signs for other letters.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          Positioned(
            left: 10,
            top: MediaQuery.of(context).size.height / 2 - 80,
            child: IconButton(
              icon: Icon(Icons.arrow_left, size: 50, color: Colors.white),
              onPressed: () {
                _pageController.previousPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
            ),
          ),
          Positioned(
            right: 10,
            top: MediaQuery.of(context).size.height / 2 - 80,
            child: IconButton(
              icon: Icon(Icons.arrow_right, size: 50, color: Colors.white),
              onPressed: () {
                _pageController.nextPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[700],
        onPressed: () async {
          final List<List<int>>? selectedWordsIndexes = await showSearch<List<List<int>>?>(
            context: context,
            delegate: LetterSearchDelegate(),
          );

          if (selectedWordsIndexes != null && selectedWordsIndexes.isNotEmpty) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SignSlideshow(wordsIndexes: selectedWordsIndexes),
              ),
            );
          }
        },
        child: Icon(Icons.search),
      ),
    );
  }
}

class LetterSearchDelegate extends SearchDelegate<List<List<int>>?> {
  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.blue[700], // Set the background color of the AppBar
      ),
      textTheme: theme.textTheme.copyWith(
        titleLarge: TextStyle(
          color: Colors.white, // Set the text color for the search query to white
          fontSize: 18,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(
          color: Colors.white54, // Set the hint text color to white with some transparency
        ),
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear, color: Colors.white), // Set the icon color to white
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back, color: Colors.white), // Set the icon color to white
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty || !RegExp(r'^[A-Za-z\s]+$').hasMatch(query.trim())) {
      return Center(
        child: Text(
          'Please enter valid words with letters from A to Z separated by spaces',
          style: TextStyle(fontSize: 18, color: Colors.black), // Changed text color to black
        ),
      );
    }

    List<List<int>> wordsIndexes = [];
    List<String> words = query.trim().toUpperCase().split(' ');
    for (String word in words) {
      List<int> indexes = word.codeUnits.map((unit) => unit - 65).toList();
      wordsIndexes.add(indexes);
    }

    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Learn the Signs for '$query'",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Changed text color to black
              ),
            ),
            SizedBox(height: 20),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 10.0,
              children: words.map((word) {
                return Column(
                  children: [
                    Text(
                      word,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // Changed text color to black
                      ),
                    ),
                    SizedBox(height: 10),
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 10.0,
                      children: word.split('').map((letter) {
                        String imagePath = 'assets/$letter.png';
                        return Image.asset(imagePath, width: 100, height: 100);
                      }).toList(),
                    ),
                  ],
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                close(context, wordsIndexes);
              },
              child: Text('Start Slideshow'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}

class SignSlideshow extends StatefulWidget {
  final List<List<int>> wordsIndexes;

  SignSlideshow({required this.wordsIndexes});

  @override
  _SignSlideshowState createState() => _SignSlideshowState();
}

class _SignSlideshowState extends State<SignSlideshow> {
  int _currentIndex = 0;
  List<String> _letters = [];
  Timer? _timer;
  int _currentLetterIndex = 0;

  @override
  void initState() {
    super.initState();
    _startSlideshow();
  }

  void _startSlideshow() {
    _letters = [];
    for (var indexes in widget.wordsIndexes) {
      List<String> letters =
      indexes.map((index) => String.fromCharCode(65 + index)).toList();
      _letters.addAll(letters);
    }

    _timer = Timer.periodic(Duration(seconds: 2), (timer) {
      setState(() {
        if (_currentLetterIndex < _letters.length) {
          _currentLetterIndex++;
        } else {
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Sign Slideshow'),
            backgroundColor: Colors.blue[700],
          ),
          body: Center(
            child: AnimatedSwitcher(
              duration: Duration(seconds: 1),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(opacity: animation, child: child);
              },
              child: _currentLetterIndex < _letters.length
                  ? Column(
                key: ValueKey<int>(_currentLetterIndex),
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Signs for '${_letters[_currentLetterIndex]}'",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),
                  _letters[_currentLetterIndex].isNotEmpty
                      ? Image.asset(
                    'assets/${_letters[_currentLetterIndex]}.png',
                    width: 300,
                    height: 300,
                  )
                      : SizedBox.shrink(),
                ],
              )
                  : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "End of Slideshow",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _currentLetterIndex = 0;
                      });
                      _startSlideshow();
                    },
                    child: Text('Restart Slideshow'),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    }