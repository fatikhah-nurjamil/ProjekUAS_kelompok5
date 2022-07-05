import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:putri_domas/bloc/login_bloc.dart';
import 'package:putri_domas/helpers/user_info.dart';
import 'package:putri_domas/ui/kost.dart';
import 'package:putri_domas/ui/landing.dart';
import 'package:putri_domas/ui/register.dart';
import 'package:putri_domas/widget/warning_dialog.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  final _emailTextboxController = TextEditingController();
  final _passwordTextboxController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Landing())),
        ),
        backgroundColor: Colors.green.shade300, // appbar color.
      ),
      body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    _emailTextField(),
                    _passwordTextField(),
                    _buttonLogin(),
                    const SizedBox(
                      height: 30,
                    ),
                    _menuRegistrasi()
                  ],
                ),
              ))),
    );
  }

  // Membuat Textbox Email
  Widget _emailTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Email"),
      keyboardType: TextInputType.emailAddress,
      controller: _emailTextboxController,
      validator: (value) {
        // ika karakter yang dimasukkan kurang dari 6 karakter
        if (value!.isEmpty) {
          return "Email harus diisi";
        }
        return null;
      },
    );
  }

  Widget _passwordTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Password"),
      keyboardType: TextInputType.text,
      obscureText: true,
      controller: _passwordTextboxController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Password Harus Diisi";
        }
        return null;
      },
    );
  }

  // Membuat Tombol login
  Widget _buttonLogin() {
    return ElevatedButton(
      child: const Text("Login"),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.green.shade300),
      ),
      onPressed: () {
        var validate = _formKey.currentState!.validate();
        if (validate) {
          if (!_isLoading) _submit();
        }
      },
    );
  }

  void _submit() {
    _formKey.currentState!.save();
    setState(() {
      _isLoading = true;
    });

    LoginBloc.login(
            email: _emailTextboxController.text,
            password: _passwordTextboxController.text)
        .then((value) async {
      await UserInfo().setToken(value.token.toString());
      await UserInfo().setUserID(int.parse(value.userID.toString()));
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const KostPage()));
    }, onError: (error) {
      print(error);
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) => const WarningDialog(
                description: "Login gagal, silahkan coba lagi",
              ));
    });
    setState(() {
      _isLoading = false;
    });
  }

  // Membuat menu untuk membuka halaman registrasi
  Widget _menuRegistrasi() {
    return Center(
      child: InkWell(
          child: const Text(
            "Belum punya akun? Silahkan Registrasi",
            style: TextStyle(color: Colors.blue),
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Register()));
          }),
    );
  }
}
