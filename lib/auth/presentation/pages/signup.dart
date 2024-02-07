import 'package:flutter/material.dart';
import 'package:session2/auth/presentation/pages/signin.dart';
import 'package:session2/core/main.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:supabase/supabase.dart';
import 'home.dart';

class signUp extends StatefulWidget {
  const signUp({super.key, required this.title});

  final String title;

  @override
  State<signUp> createState() => _signUpState();
}

bool sec = true;
bool secc = true;

class _signUpState extends State<signUp> {
  TextEditingController namectr = TextEditingController();
  TextEditingController emailctr = TextEditingController();
  TextEditingController phonectr = TextEditingController();
  TextEditingController passctr = TextEditingController();
  TextEditingController passcctr = TextEditingController();
  bool check = false;

  bool isValid() {
    if ((passcctr.text == passctr.text) &
        (passctr.text.length >= 6) &
        (namectr.text.length != 0) &
        (phonectr.text.length != 0) &
        (emailctr.text.length != 0) &
        (check == true)) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Row(
            children: [
              SizedBox(
                width: 24,
              ),
              Column(
                children: [
                  SizedBox(
                    height: 81,
                  ),
                  Text(
                    'Create an account',
                    style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Complete the sign up process to get started',
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 167, 167, 167)),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Full Name',
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 167, 167, 167)),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 44,
                    width: MediaQuery.of(context).size.width - 48,
                    child: TextField(
                      onChanged: (str) {
                        setState(() {});
                      },
                      controller: namectr,
                      decoration: InputDecoration(
                          hintText: "Ivanov Ivan",
                          hintStyle: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 207, 207, 207)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    'Phone Number',
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 167, 167, 167)),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 44,
                    width: MediaQuery.of(context).size.width - 48,
                    child: TextField(

                      controller: phonectr,
                      decoration: InputDecoration(
                        hintText: "+7(999)999-99-99",
                        hintStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 207, 207, 207)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      inputFormatters: [
                        MaskTextInputFormatter(
                            mask: '+#(###)###-##-##',
                            filter: {'#': RegExp(r'[0-9]')})
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    'email adress',
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 167, 167, 167)),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 44,
                    width: MediaQuery.of(context).size.width - 48,
                    child: TextField(
                      onChanged: (str) {
                        setState(() {});
                      },
                      controller: emailctr,
                      decoration: InputDecoration(
                          hintText: "***********@mail.com",
                          hintStyle: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 207, 207, 207)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    'Password',
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 167, 167, 167)),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 44,
                    width: MediaQuery.of(context).size.width - 48,
                    child: TextField(
                      onChanged: (str) {
                        setState(() {});
                      },
                      controller: passctr,
                      decoration: InputDecoration(
                          hintText: "**********",
                          hintStyle: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 207, 207, 207)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          suffixIcon: GestureDetector(
                            child: SizedBox(
                                width: 15,
                                height: 15,
                                child: Icon(
                                  Icons.remove_red_eye,
                                )),
                            onTap: () {
                              setState(() {
                                if (secc == true) {
                                  secc == false;
                                } else {
                                  secc == true;
                                }
                              });
                            },
                          )),
                      obscureText: true,
                      obscuringCharacter: '*',
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    'Confirm Password',
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 167, 167, 167)),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 44,
                    width: MediaQuery.of(context).size.width - 48,
                    child: TextField(
                      onChanged: (str) {
                        setState(() {});
                      },
                      controller: passcctr,
                      decoration: InputDecoration(
                        hintText: "**********",
                        hintStyle: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 207, 207, 207)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        suffixIcon: GestureDetector(
                          child: SizedBox(
                              width: 15,
                              height: 15,
                              child: Icon(
                                Icons.remove_red_eye,
                              )),
                          onTap: () {
                            setState(() {
                              if (secc == true) {
                                secc == false;
                              } else {
                                secc == true;
                              }
                            });
                          },
                        ),
                      ),
                      obscureText: secc,
                      obscuringCharacter: '*',
                    ),
                  ),
                  SizedBox(
                    height: 37,
                  ),
                  Row(
                    children: [
                      Checkbox(
                          value: check,
                          onChanged: (value) {
                            setState(() {
                              check = value!;
                            });
                          }),
                      SizedBox(
                        width: 271,
                        child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                text: "By ticking this box, you agree to our ",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 167, 167, 167)),
                                children: [
                                  TextSpan(
                                      text:
                                          'Terms and conditions and private policy',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w500,
                                          color: Color.fromARGB(
                                              255, 235, 188, 46)))
                                ])),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 64,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 48,
                    height: 46,
                    child: OutlinedButton(
                      onPressed: (isValid())
                          ? () async {
                              try {
                                var res = await supabase.auth.signUp(
                                    password: passctr.text,
                                    email: emailctr.text,
                                    phone: phonectr.text);
                                final Session? session = res.session;
                                final User user = res.user!;
                                await supabase.from('profiles').insert({
                                  'user_id': user.id,
                                  'fullname': namectr.text,
                                  'phone': phonectr.text,
                                  'avatar': '',

                                });
                                if (user != null){Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => home(
                                          title: '',
                                        )));}
                              } catch (exept) {
                                var exepte = exept.toString();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                  content: Text(r'exepte')));
                      }
                            }
                          : null,
                      child: Text("Sign Up"),
                      style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Color.fromARGB(255, 5, 96, 250),
                          disabledBackgroundColor:
                              Color.fromARGB(255, 167, 167, 167),
                          disabledForegroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4))),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 48,
                    child: Row(
                      children: [
                        Text(
                          "Have an account?",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 167, 167, 167)),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => signIn(
                                          title: '',
                                        )));
                          },
                          child: Text(
                            "Sign in",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 5, 96, 250)),
                          ),
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width - 48,
                      child: Row(
                        children: [
                          Text("or sign in using",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 167, 167, 167)))
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      )),
                  SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width - 48,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Image.asset("assets/google.png")],
                      )),
                  SizedBox(
                    height: 24,
                  )
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
              SizedBox(
                width: 24,
              ),
            ],
          )
        ],
      ),
    );
  }
}
