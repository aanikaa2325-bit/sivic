import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sivic/screens/login_page.dart';
import 'package:sivic/screens/otp_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();

  bool _isPasswordHidden = true;
  bool _isConfirmPasswordHidden = true;
  bool _isLoading = false;
  String? _firebaseErrorMessage;

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _nidController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _nidController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _submit() async {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    }

    _formKey.currentState!.save();

    setState(() {
      _firebaseErrorMessage = null;
      _isLoading = true;
    });

    final firstName = _firstNameController.text.trim();
    final lastName = _lastNameController.text.trim();
    final nid = _nidController.text.trim();
    final email = _emailController.text.trim();
    final phone = _phoneController.text.trim();
    final pass = _passwordController.text;

    try {
      final userCredential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );

      final uid = userCredential.user!.uid;

      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .set({
        'firstName': firstName,
        'lastName': lastName,
        'nid': nid,
        'phone': phone,
        'email': email,
      });

      if (mounted) {
        setState(() => _isLoading = false);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OtpPage(
              isFromForgotPassword: false,
              userData: {
                'uid': uid,
                'firstName': firstName,
                'lastName': lastName,
                'nid': nid,
                'phone': phone,
                'email': email,
              },
            ),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        _isLoading = false;
        _firebaseErrorMessage =
            e.message ?? 'An error occurred during sign up.';
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _firebaseErrorMessage = 'An unexpected error occurred.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 56,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Image.asset('assets/icons/back.png', height: 48, width: 48),
          padding: const EdgeInsets.only(left: 16),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 18, right: 18, bottom: 36),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 28),
                  Image.asset('assets/images/logo.png', height: 72),
                  const SizedBox(height: 20),
                  const Text(
                    'Sign Up',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 28, color: Color(0xFF1E241E)),
                  ),
                  const SizedBox(height: 32),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 4.0),
                              child: Text('First name', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: Color(0xFF333733))),
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              controller: _firstNameController,
                              cursorColor: const Color(0xFF4A8B4A),
                              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                              decoration: const InputDecoration(hintText: 'First name'),
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) return 'Required';
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 4.0),
                              child: Text('Last name', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: Color(0xFF333733))),
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              controller: _lastNameController,
                              cursorColor: const Color(0xFF4A8B4A),
                              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                              decoration: const InputDecoration(hintText: 'Last name'),
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) return 'Required';
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  const Padding(
                    padding: EdgeInsets.only(left: 4.0),
                    child: Text('National ID', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: Color(0xFF333733))),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _nidController,
                    cursorColor: const Color(0xFF4A8B4A),
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    decoration: const InputDecoration(hintText: 'Enter your NID'),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) return 'National ID is required';
                      else if (value.length != 13 && value.length != 17) return 'NID length must be 13 or 17 digits long';
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  const Padding(
                    padding: EdgeInsets.only(left: 4.0),
                    child: Text('Phone', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: Color(0xFF333733))),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    cursorColor: const Color(0xFF4A8B4A),
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    decoration: const InputDecoration(hintText: 'Enter your phone number'),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) return 'Phone number is required';
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  const Padding(
                    padding: EdgeInsets.only(left: 4.0),
                    child: Text('Email', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: Color(0xFF333733))),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: const Color(0xFF4A8B4A),
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    decoration: const InputDecoration(hintText: 'Enter your email'),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) return 'Email address is required';
                      if (!value.contains('@')) return 'Enter a valid email address';
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  const Padding(
                    padding: EdgeInsets.only(left: 4.0),
                    child: Text('Password', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: Color(0xFF333733))),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _passwordController,
                    cursorColor: const Color(0xFF4A8B4A),
                    obscureText: _isPasswordHidden,
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    validator: (value) {
                      if (value == null || value.isEmpty) return 'Password cannot be empty';
                      if (value.length < 8) return 'Password must be at least 8 digits';
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Create a password',
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 4.0),
                        child: IconButton(
                          icon: Image.asset(
                            _isPasswordHidden ? 'assets/icons/hide.png' : 'assets/icons/unhide.png',
                            width: 20,
                            height: 20,
                          ),
                          onPressed: () => setState(() => _isPasswordHidden = !_isPasswordHidden),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  const Padding(
                    padding: EdgeInsets.only(left: 4.0),
                    child: Text('Confirm Password', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: Color(0xFF333733))),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _confirmPasswordController,
                    cursorColor: const Color(0xFF4A8B4A),
                    obscureText: _isConfirmPasswordHidden,
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    validator: (value) {
                      if (value == null || value.isEmpty) return 'Please confirm your password';
                      if (value != _passwordController.text) return 'Passwords do not match';
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Confirm password',
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 4.0),
                        child: IconButton(
                          icon: Image.asset(
                            _isConfirmPasswordHidden ? 'assets/icons/hide.png' : 'assets/icons/unhide.png',
                            width: 20,
                            height: 20,
                          ),
                          onPressed: () => setState(() => _isConfirmPasswordHidden = !_isConfirmPasswordHidden),
                        ),
                      ),
                    ),
                  ),

                  if (_firebaseErrorMessage != null) ...[
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: Text(
                        _firebaseErrorMessage!,
                        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Color(0xFFF86B59)),
                      ),
                    ),
                  ],

                  const SizedBox(height: 24),

                  InkWell(
                    onTap: _isLoading ? null : _submit,
                    child: Container(
                      height: 56,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1C1F1C),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Center(
                        child: _isLoading
                            ? const SizedBox(
                          height: 22,
                          width: 22,
                          child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                        )
                            : const Text('Create account', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account? ', style: TextStyle(color: Color(0xFF848D84), fontWeight: FontWeight.w400)),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage())),
                        child: const Text('Sign in', style: TextStyle(color: Color(0xFF333733), fontWeight: FontWeight.w500)),
                      ),
                    ],
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