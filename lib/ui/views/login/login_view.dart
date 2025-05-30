import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'login_viewmodel.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, viewModel, child) {
        final _formKey = GlobalKey<FormState>();
        bool _isPasswordVisible = false;

        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: SafeArea(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Login", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 16),
                    const Text("Please enter your email and password to login", style: TextStyle(fontSize: 16, color: Color(0xFF757575))),
                    const SizedBox(height: 32),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter your Email",
                        labelText: "Email",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                      ),
                      validator: (val) => val == null || val.isEmpty ? 'Email is required' : null,
                      onSaved: (val) => viewModel.setEmail(val!),
                    ),
                    const SizedBox(height: 18),
                    StatefulBuilder(
                      builder: (context, setState) => TextFormField(
                        obscureText: !_isPasswordVisible,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          hintText: "Enter your password",
                          labelText: "Password",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                          suffixIcon: IconButton(
                            icon: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                            onPressed: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
                          ),
                        ),
                        validator: (val) => val == null || val.isEmpty ? 'Password is required' : null,
                        onSaved: (val) => viewModel.setPassword(val!),
                      ),
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          _formKey.currentState?.save();
                          viewModel.login();
                        }
                      },
                      child: const Text("Login"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
