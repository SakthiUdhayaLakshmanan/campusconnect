import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MarkWidget()));
}

class MarkWidget extends StatefulWidget {
  const MarkWidget({super.key});

  @override
  State<MarkWidget> createState() => _MarkWidgetState();
}

class _MarkWidgetState extends State<MarkWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  Widget _buildUploadCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required String status,
    Color? statusIconColor,
    IconData? statusIcon,
  }) {
    return Material(
      color: Colors.transparent,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Readex Pro',
                  color: Color(0xFF12151C),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                height: 120,
                decoration: BoxDecoration(
                  color: const Color(0xFFE0E3E7),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      icon,
                      color: const Color(0xFF105DFB),
                      size: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        subtitle,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          color: Color(0xFF5A5C60),
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    status,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: statusIconColor ?? const Color(0xFF5A5C60),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  if (statusIcon != null)
                    Icon(
                      statusIcon,
                      color: statusIconColor,
                      size: 24,
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFFF6F6F6),
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          centerTitle: false,
          elevation: 0,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Upload your academic documents',
                    style: TextStyle(
                      fontFamily: 'Readex Pro',
                      color: Color(0xFF12151C),
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildUploadCard(
                    title: 'Mark Sheet',
                    subtitle: 'Tap to upload mark sheet',
                    icon: Icons.upload_file,
                    status: 'mark_sheet.pdf',
                    statusIcon: Icons.check_circle,
                    statusIconColor: const Color(0xFF02CA79),
                  ),
                  const SizedBox(height: 24),
                  _buildUploadCard(
                    title: 'Certificate',
                    subtitle: 'Tap to upload certificate',
                    icon: Icons.upload_file,
                    status: 'No file uploaded',
                    statusIcon: Icons.info_outline,
                    statusIconColor: const Color(0xFFC96F46),
                  ),
                  const SizedBox(height: 24),
                  _buildUploadCard(
                    title: 'Additional Documents',
                    subtitle: 'Add more documents (optional)',
                    icon: Icons.add_circle_outline,
                    status: '',
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      // Add your submit logic here
                      print('Submit button pressed ...');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF105DFB),
                      minimumSize: const Size(double.infinity, 56),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                      elevation: 3,
                    ),
                    child: const Text(
                      'Submit Documents',
                      style: TextStyle(
                        fontFamily: 'Readex Pro',
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}