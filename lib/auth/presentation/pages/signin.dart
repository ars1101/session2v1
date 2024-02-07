
import 'package:flutter/material.dart';
import 'package:session2/core/main.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'signup.dart';
import 'package:supabase/supabase.dart';
import 'home.dart';

class signIn extends StatefulWidget {
  const signIn({super.key, required this.title});

  final String title;

  @override
  State<signIn> createState() => _signInState();
}

bool sec = true;
bool secc = true;

class _signInState extends State<signIn> {
  TextEditingController namectr = TextEditingController();
  TextEditingController emailctr = TextEditingController();
  TextEditingController phonectr = TextEditingController();
  TextEditingController passctr = TextEditingController();
  TextEditingController passcctr = TextEditingController();
  bool check = false;

  bool isValid(){
    if (( passctr.text.length >= 6) & (emailctr.text.length != 0)  & (check == true)){
      return true;
    }
    else{return false;}

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
                      onChanged: (str){setState(() { });},
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
                      onChanged: (str){setState(() { });},
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
                    height: 17,
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
                      Text("Remember password", style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 167, 167, 167)),),
                      SizedBox(width: 48,),
                      Text("Forgot password", style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 5, 96, 250)))
                    ],
                  ),
                  SizedBox(
                    height: 64,
                  ),
                  SizedBox( width: MediaQuery.of(context).size.width-48, height: 46,
                    child: OutlinedButton(
                      onPressed:  (isValid()) ? () async  {var res = await supabase.auth.signInWithPassword(password: passcctr.text, email: emailctr.text);

                      final Session? session = res.session;
                      final User user = res.user!;
    if (user != null){Navigator.push(
                          context,
                          MaterialPageRoute(
                          builder: (context) => home(
                            title: '',
                          )));}
                      } : null,
                      child: Text("Sign in"),
                      style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Color.fromARGB(255, 5, 96, 250),
                          disabledBackgroundColor:
                          Color.fromARGB(255, 167, 167, 167),disabledForegroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
                    ),
                  ),
                  SizedBox(height: 20,),
                  SizedBox( width: MediaQuery.of(context).size.width-48,
                    child: Row(children: [Text("Dont have an account?", style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 167, 167, 167))
                      ,),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => signUp(
                                    title: '',
                                  )));
                        },
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 5, 96, 250)),
                        ),
                      )],mainAxisAlignment: MainAxisAlignment.center,),

                  ),
                  SizedBox(height: 18,),
                  SizedBox( width: MediaQuery.of(context).size.width-48,
                      child: Row(children: [Text("or sign in using", style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 167, 167, 167)))],mainAxisAlignment: MainAxisAlignment.center,)

                  ),
                  SizedBox(height: 8,),
                  SizedBox( width: MediaQuery.of(context).size.width-48,
                      child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [Image.asset("assets/google.png")], ))
                  , SizedBox(height: 24,)],
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