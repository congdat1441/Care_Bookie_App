import 'package:care_bookie/view/pages/login_signup_page/reset_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../firebases/firebase_auth_function.dart';
import '../layouts_page/navbar_layout.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final textFieldFocusNode = FocusNode();
  bool _obscured = true;
  String email = '';
  String password = '';
  String fullname = '';
  String dob = '';
  bool gender = false;
  String image = '';
  String phone = '';

  bool login = true;

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus) {
        return; // If focus is on text field, dont unfocus
      }
      textFieldFocusNode.canRequestFocus =
          false; // Prevents focus if tap on eye
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height - 30,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            customTopCircle(),
            formLoginAndSignup(),
            googleLogin(),
          ],
        ),
      ),
    ));
  }

  Widget customTopCircle() {
    return Expanded(
      child: Stack(
        children: [
          Positioned(
              top: -240,
              right: 10,
              child: Container(
                width: 500,
                height: 500,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFF0675D6)),
              )),
          Positioned(
              top: -280,
              right: 70,
              child: Container(
                width: 500,
                height: 500,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFF0768D6)),
              )),
          Positioned(
              top: -325,
              right: 135,
              child: Container(
                width: 500,
                height: 500,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFF005DC8)),
              )),
          Positioned(
              top: -310,
              right: 200,
              child: Container(
                width: 400,
                height: 400,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFF0057B9)),
              )),
          Positioned(top: 260, right: 100, child: titleSigninSignupTEST()),
        ],
      ),
    );
  }

  Widget titleSigninSignupTEST() {
    return Row(
      children: [
        TextButton(
            onPressed: () {
              setState(() {
                login = !login;
              });
            },
            child: Row(
              children: [login ? titleLogin() : titleSignup()],
            ))
      ],
    );
  }

  Widget formLoginAndSignup() {
    return Form(
      key: _formKey,
      child: Container(
        height: 400,
        //color: Colors.orange,
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            login ? addEmail() : nameAccount(),
            login ? addPassword() : addEmail(),
            login ? Container() : addPassword(),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 50, 10),
              height: 55,
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      login
                          ? AuthServices.signinUser(email, password, context)
                          : AuthServices.signupUser(email, password, fullname,
                                  dob, gender, image, phone, context)
                              .then((value) {
                              if (value) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginForm()),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        'Please verify your email to login'),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            "Please verify your email to login")));
                              }
                            });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Text(
                    login ? 'LOGIN ' : 'SIGN UP',
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w600),
                  )),
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    login = !login;
                  });
                },
                child: Text(login
                    ? "Don't have an account? Signup"
                    : "Already have an account? Login"))
          ],
        ),
      ),
    );
  }

  Widget titleSignup() {
    return Row(
      children: const [
        Text(
          "Sign up",
          style: TextStyle(
            fontFamily: "Poppins",
            fontSize: 45,
            fontWeight: FontWeight.w500,
            color: Color(0xFF2F3948),
          ),
        ),
        Text(
          "/ ",
          style: TextStyle(
            fontFamily: "Poppins",
            fontSize: 28,
            fontWeight: FontWeight.w500,
            color: Color(0xFF2F3948),
          ),
        ),
        Text(
          "Login",
          style: TextStyle(
            fontFamily: "Poppins",
            fontSize: 25,
            fontWeight: FontWeight.w400,
            color: Color(0xFF168AD8),
            decoration: TextDecoration.underline,
          ),
        )
      ],
    );
  }

  Widget titleLogin() {
    return Row(
      children: const [
        Text(
          "Login",
          style: TextStyle(
            fontFamily: "Poppins",
            fontSize: 45,
            fontWeight: FontWeight.w500,
            color: Color(0xFF2F3948),
          ),
        ),
        Text(
          "/ ",
          style: TextStyle(
            fontFamily: "Poppins",
            fontSize: 28,
            fontWeight: FontWeight.w500,
            color: Color(0xFF2F3948),
          ),
        ),
        Text(
          "Sign up",
          style: TextStyle(
            fontFamily: "Poppins",
            fontSize: 25,
            fontWeight: FontWeight.w400,
            color: Color(0xFF168AD8),
            decoration: TextDecoration.underline,
          ),
        )
      ],
    );
  }

  Widget nameAccount() {
    return Container(
      height: 75,
      padding: const EdgeInsets.fromLTRB(0, 20, 30, 0),
      width: 330,
      child: TextFormField(
          key: const ValueKey('fullness'),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please Enter Full Name';
            } else {
              return null;
            }
          },
          onSaved: (value) {
            setState(() {
              fullname = value!;
            });
          },
          decoration: const InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.all(
              Radius.circular(0),
            )),
            label:
                Text("Enter Full Name", style: TextStyle(color: Colors.black)),
            prefixIcon: SizedBox(
              width: 0,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Icon(
                  Icons.abc_outlined,
                  color: Colors.black,
                ),
              ),
            ),
          )),
    );
  }

  Widget addEmail() {
    return Container(
      //color: Colors.pink,

      padding: const EdgeInsets.fromLTRB(0, 20, 30, 0),
      width: 330,
      child: TextFormField(
          key: const ValueKey('email'),
          validator: (value) {
            if (value!.isEmpty || !value.contains('@')) {
              return 'Please Enter valid Email';
            } else if (value.length <= 5) {
              return "Not enough required characters";
            }
            return null;
          },
          onSaved: (value) {
            setState(() {
              email = value!;
            });
          },
          decoration: const InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.all(
              Radius.circular(0),
            )),
            label: Text("Email", style: TextStyle(color: Colors.black)),
            prefixIcon: SizedBox(
              width: 0,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Icon(
                  Icons.email_outlined,
                  color: Colors.black,
                ),
              ),
            ),
          )),
    );
  }

  Widget addPassword() {
    return Container(
      //height: 80,
      padding: const EdgeInsets.fromLTRB(0, 20, 30, 10),
      width: 330,
      child: TextFormField(
          key: const ValueKey('password'),
          obscureText: _obscured,
          validator: (value) {
            if (value!.length < 6) {
              return 'Please Enter Password of min length 6';
            } else {
              return null;
            }
          },
          onSaved: (value) {
            setState(() {
              password = value!;
            });
          },
          decoration: InputDecoration(
            enabledBorder: const UnderlineInputBorder(
                borderRadius: BorderRadius.all(
              Radius.circular(0),
            )),
            label:
                const Text("Password", style: TextStyle(color: Colors.black)),
            prefixIcon: const SizedBox(
              width: 0,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Icon(
                  Icons.lock_outline,
                  color: Colors.black,
                  size: 24,
                ),
              ),
            ),
            suffixIcon: SizedBox(
              width: 0,
              child: Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: _toggleObscured,
                  child: Icon(
                    _obscured
                        ? Icons.visibility_rounded
                        : Icons.visibility_off_rounded,
                    size: 24,
                  ),
                ),
              ),
            ),
          )),
    );
  }

  Widget forgotPassword() {
    return Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.fromLTRB(0, 0, 25, 10),
      child: TextButton(
        child: const Text(
          "Forgot password",
          style: TextStyle(fontFamily: 'Poppins', color: Color(0xFF168AD8)),
        ),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ResetPassword()));
        },
      ),
    );
  }

  Widget googleLogin() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        InkWell(
          onTap: () async {
            await AuthServices().signInWithGoogle();
            //print('>>done');
            // ignore: use_build_context_synchronously
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const NavbarLayout(
                          index: 0,
                        )));
          },
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                child: SvgPicture.asset(
                  "assets/images/icons8-google.svg",
                  width: 40,
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(5, 20, 30, 0.0),
                child: Text(
                  "Google",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
