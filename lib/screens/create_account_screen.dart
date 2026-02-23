import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'sign_in_screen.dart';
import 'main_screen.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final _formKey = GlobalKey<FormState>();

  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _contactController = TextEditingController();
  final _dobController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  String? _selectedBloodGroup;

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _isLoading = false;
  bool _acceptedTerms = false;

  final List<String> _bloodGroups = [
    'A+','A-','B+','B-','O+','O-','AB+','AB-'
  ];

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _contactController.dispose();
    _dobController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleCreateAccount() async {

    // 1️⃣ Validate fields first
    if (!_formKey.currentState!.validate()) {
      return;
    }

    // 2️⃣ Then check Terms
    if (!_acceptedTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please accept Terms & Conditions'),
        ),
      );
      return;
    }

    // 3️⃣ Proceed
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 2));
    setState(() => _isLoading = false);

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const MainScreen()),
    );
  }

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        _dobController.text =
        "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  InputDecoration _inputDecoration(String label,
      {IconData? icon, Widget? suffix}) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Color(0xFFFFC107)),
      prefixIcon:
      icon != null ? Icon(icon, color: const Color(0xFFFFC107)) : null,
      suffixIcon: suffix,
      filled: true,
      fillColor: const Color(0xFF1C1C1C),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide:
        const BorderSide(color: Color(0xFFFFC107), width: 1.5),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide:
        const BorderSide(color: Color(0xFFFFC107), width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide:
        const BorderSide(color: Color(0xFFFFC107), width: 2),
      ),
      contentPadding:
      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding:
          const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                ),

                const SizedBox(height: 24),

                Text(
                  'Create',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Account',
                  style: GoogleFonts.inter(
                    color: const Color(0xFFFFC107),
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 32),

                /// Full Name
                TextFormField(
                  controller: _fullNameController,
                  style: const TextStyle(color: Colors.white),
                  decoration:
                  _inputDecoration('Full Name', icon: Icons.person),
                  validator: (value) =>
                  value!.isEmpty ? 'Enter full name' : null,
                ),

                const SizedBox(height: 16),

                /// Email
                TextFormField(
                  controller: _emailController,
                  style: const TextStyle(color: Colors.white),
                  keyboardType: TextInputType.emailAddress,
                  decoration:
                  _inputDecoration('Email', icon: Icons.email),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter email';
                    }

                    final emailRegex = RegExp(
                      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.(com|in|org|net)$',
                    );

                    if (!emailRegex.hasMatch(value)) {
                      return 'Enter valid email (example@gmail.com)';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 16),

                /// Contact
                TextFormField(
                  controller: _contactController,
                  style: const TextStyle(color: Colors.white),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10),
                  ],
                  decoration: _inputDecoration(
                      'Contact Number', icon: Icons.phone),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter contact number';
                    }

                    if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                      return 'Phone number must be exactly 10 digits';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 16),

                /// Blood Group
                DropdownButtonFormField<String>(
                  value: _selectedBloodGroup,
                  dropdownColor: const Color(0xFF1C1C1C),
                  style: const TextStyle(color: Colors.white),
                  decoration: _inputDecoration(
                      'Blood Group', icon: Icons.bloodtype),
                  items: _bloodGroups
                      .map((group) => DropdownMenuItem(
                    value: group,
                    child: Text(group),
                  ))
                      .toList(),
                  onChanged: (value) =>
                      setState(() => _selectedBloodGroup = value),
                  validator: (value) =>
                  value == null ? 'Select blood group' : null,
                ),

                const SizedBox(height: 16),

                /// DOB
                TextFormField(
                  controller: _dobController,
                  readOnly: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: _inputDecoration(
                    'Date of Birth',
                    icon: Icons.calendar_today,
                  ),
                  onTap: _selectDate,
                  validator: (value) =>
                  value!.isEmpty ? 'Select date of birth' : null,
                ),

                const SizedBox(height: 16),

                /// Password
                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  style: const TextStyle(color: Colors.white),
                  decoration: _inputDecoration(
                    'Password',
                    icon: Icons.lock,
                    suffix: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: const Color(0xFFFFC107),
                      ),
                      onPressed: () => setState(() =>
                      _obscurePassword = !_obscurePassword),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter password';
                    }

                    if (value.length < 8) {
                      return 'Password must be at least 8 characters';
                    }

                    if (!RegExp(r'[A-Z]').hasMatch(value)) {
                      return 'Include at least 1 capital letter';
                    }

                    if (!RegExp(r'[0-9]').hasMatch(value)) {
                      return 'Include at least 1 number';
                    }

                    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
                      return 'Include at least 1 special character';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 16),

                /// Confirm Password
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: _obscureConfirmPassword,
                  style: const TextStyle(color: Colors.white),
                  decoration: _inputDecoration(
                    'Confirm Password',
                    icon: Icons.lock,
                    suffix: IconButton(
                      icon: Icon(
                        _obscureConfirmPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: const Color(0xFFFFC107),
                      ),
                      onPressed: () => setState(() =>
                      _obscureConfirmPassword =
                      !_obscureConfirmPassword),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty)
                      return 'Confirm password';
                    if (value != _passwordController.text)
                      return 'Passwords do not match';
                    return null;
                  },
                ),

                const SizedBox(height: 16),

                /// Terms
                Row(
                  children: [
                    Checkbox(
                      value: _acceptedTerms,
                      onChanged: (val) =>
                          setState(() => _acceptedTerms = val!),
                      activeColor: const Color(0xFFFFC107),
                      checkColor: Colors.black,
                    ),
                    Flexible(
                      child: Text(
                        'I agree to the Terms & Conditions',
                        style:
                        GoogleFonts.poppins(color: Colors.grey),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                /// Create Button
                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: ElevatedButton(
                    onPressed:
                    _isLoading ? null : _handleCreateAccount,
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                      const Color(0xFFFFC107),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(14),
                      ),
                    ),
                    child: _isLoading
                        ? const CircularProgressIndicator(
                        color: Colors.black)
                        : Text(
                      'Create Account',
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                /// Already have account
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                            const LoginScreen()),
                      );
                    },
                    child: RichText(
                      text: TextSpan(
                        text: "Already have an account? ",
                        style: GoogleFonts.poppins(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                        children: [
                          TextSpan(
                            text: 'Sign In',
                            style: GoogleFonts.poppins(
                              color: const Color(0xFFFFC107),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}