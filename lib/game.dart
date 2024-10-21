import 'package:flutter/material.dart';

void main() {
  runApp(GameWidget());
}

class GameWidget extends StatefulWidget {
  const GameWidget({super.key});

  @override
  State<GameWidget> createState() => _GameWidgetState();
}

class _GameWidgetState extends State<GameWidget> {
  double sliderValue = 7.0;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFF5FBFB),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Image.network(
                'https://images.unsplash.com/photo-1532210317995-cc56d90177d9?w=500&h=500',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0x99000000), Colors.transparent],
                    stops: [0, 1],
                    begin: AlignmentDirectional(0, -1),
                    end: AlignmentDirectional(0, 1),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: Icon(Icons.arrow_back, color: Colors.white),
                            onPressed: () {
                              print('IconButton pressed ...');
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.favorite_border, color: Colors.white),
                            onPressed: () {
                              print('IconButton pressed ...');
                            },
                          ),
                        ],
                      ),
                      Text(
                        'Math Quest',
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'An exciting journey through numbers!',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: Color(0xFFE0E0E0),
                          fontSize: 16,
                        ),
                      ),
                      _buildGameDetails(),
                      _buildDescription(),
                      _buildLearningObjectives(),
                      _buildProgressTracking(),
                      ElevatedButton(
                        onPressed: () {
                          print('Button pressed ...');
                        },
                        child: Text('Start Game'),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(MediaQuery.of(context).size.width, 56),
                          backgroundColor: Color(0xFF06D5CD),
                          textStyle: TextStyle(
                            fontFamily: 'Inter',
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGameDetails() {
    return Material(
      color: Colors.transparent,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Game Details',
              style: TextStyle(
                fontFamily: 'Readex Pro',
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            _buildInfoRow('Age Group:', '7-12 years'),
            _buildInfoRow('Difficulty:', 'Intermediate'),
            _buildInfoRow('Subject:', 'Mathematics'),
          ],
        ),
      ),
    );
  }

  Widget _buildDescription() {
    return Material(
      color: Colors.transparent,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Description',
              style: TextStyle(
                fontFamily: 'Readex Pro',
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Math Quest is an interactive game that takes students on an adventure through various mathematical concepts. Players solve puzzles, defeat number monsters, and collect rewards while improving their math skills.',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLearningObjectives() {
    return Material(
      color: Colors.transparent,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Learning Objectives',
              style: TextStyle(
                fontFamily: 'Readex Pro',
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            _buildLearningObjectiveRow('Master basic arithmetic operations'),
            _buildLearningObjectiveRow('Develop problem-solving skills'),
            _buildLearningObjectiveRow('Improve mental math abilities'),
          ],
        ),
      ),
    );
  }

  Widget _buildLearningObjectiveRow(String text) {
    return Row(
      children: [
        Icon(Icons.check_circle, color: Color(0xFF16857B), size: 20),
        SizedBox(width: 8),
        Text(text, style: TextStyle(fontSize: 14)),
      ],
    );
  }

  Widget _buildProgressTracking() {
    return Material(
      color: Colors.transparent,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Progress Tracking',
              style: TextStyle(
                fontFamily: 'Readex Pro',
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Completed Levels:', style: TextStyle(fontSize: 14)),
                Text('7/20', style: TextStyle(fontSize: 14)),
              ],
            ),
            Slider(
              activeColor: Color(0xFF06D5CD),
              inactiveColor: Color(0xFFE0E0E0),
              min: 0,
              max: 20,
              value: sliderValue,
              onChanged: (newValue) {
                setState(() {
                  sliderValue = newValue;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(fontSize: 14, color: Color(0xFF57636C))),
        Text(value, style: TextStyle(fontSize: 14, color: Color(0xFF101518))),
      ],
    );
  }
}
