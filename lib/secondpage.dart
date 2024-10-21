import 'package:flutter/material.dart';
import 'profile.dart';
import 'game.dart';
import 'mark&ceritificate.dart';

void main() {
  runApp( mainpage());
}
class mainpage extends StatelessWidget {
  const mainpage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: const NewPageWidget(),
    );
  }
}

class NewPageModel {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController previousSchoolController = TextEditingController();
  final TextEditingController gpaController = TextEditingController();
  final TextEditingController extracurricularController = TextEditingController();
  final TextEditingController awardsController = TextEditingController();

  final FocusNode fullNameFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final FocusNode phoneFocus = FocusNode();
  final FocusNode previousSchoolFocus = FocusNode();
  final FocusNode gpaFocus = FocusNode();
  final FocusNode extracurricularFocus = FocusNode();
  final FocusNode awardsFocus = FocusNode();

  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    previousSchoolController.dispose();
    gpaController.dispose();
    extracurricularController.dispose();
    awardsController.dispose();

    fullNameFocus.dispose();
    emailFocus.dispose();
    phoneFocus.dispose();
    previousSchoolFocus.dispose();
    gpaFocus.dispose();
    extracurricularFocus.dispose();
    awardsFocus.dispose();
  }

  String? Function(String?)? textControllerValidator = (value) {
    if (value == null || value.isEmpty) {
      return 'Field cannot be empty';
    }
    return null;
  };
}

class NewPageWidget extends StatefulWidget {
  const NewPageWidget({super.key});

  @override
  State<NewPageWidget> createState() => _NewPageWidgetState();
}

class _NewPageWidgetState extends State<NewPageWidget> {
  late NewPageModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = NewPageModel();
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        fontFamily: 'Readex Pro',
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required FocusNode focusNode,
    required String label,
    TextInputType? keyboardType,
    int? maxLines,
    int? minLines,
  }) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      maxLines: maxLines,
      minLines: minLines,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      validator: _model.textControllerValidator,
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle(title),
          const SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: const Text('Student Application'),
          backgroundColor: Theme.of(context).primaryColor,
          actions: [
            IconButton(
              icon: const Icon(Icons.sports_esports),
              onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder: (context)=> GameWidget()));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Games clicked')),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.restaurant),
              onPressed: () {
                // Handle food icon tap
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Food clicked')),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Profile1()));
                // Handle menu icon tap
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Menu clicked')),
                );
              },
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _buildSection(
                  'Personal Information',
                  [
                    _buildTextField(
                      controller: _model.fullNameController,
                      focusNode: _model.fullNameFocus,
                      label: 'Full Name',
                    ),
                    const SizedBox(height: 16),
                    _buildTextField(
                      controller: _model.emailController,
                      focusNode: _model.emailFocus,
                      label: 'Email Address',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 16),
                    _buildTextField(
                      controller: _model.phoneController,
                      focusNode: _model.phoneFocus,
                      label: 'Phone Number',
                      keyboardType: TextInputType.phone,
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                _buildSection(
                  'Academic Information',
                  [
                    _buildTextField(
                      controller: _model.previousSchoolController,
                      focusNode: _model.previousSchoolFocus,
                      label: 'Previous School',
                    ),
                    const SizedBox(height: 16),
                    _buildTextField(
                      controller: _model.gpaController,
                      focusNode: _model.gpaFocus,
                      label: 'GPA',
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                _buildSection(
                  'Additional Information',
                  [
                    _buildTextField(
                      controller: _model.extracurricularController,
                      focusNode: _model.extracurricularFocus,
                      label: 'Extracurricular Activities',
                      maxLines: 5,
                      minLines: 3,
                    ),
                    const SizedBox(height: 16),
                    _buildTextField(
                      controller: _model.awardsController,
                      focusNode: _model.awardsFocus,
                      label: 'Awards and Achievements',
                      maxLines: 5,
                      minLines: 3,
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MarkWidget()));
                    // Add your submit logic here
                    print('Submit button pressed');
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(MediaQuery.of(context).size.width, 56),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  child: const Text(
                    'Submit Application',
                    style: TextStyle(
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
    ));
  }
}
