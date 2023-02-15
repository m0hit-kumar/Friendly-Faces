import 'package:flutter/material.dart';

class Done extends StatelessWidget {
  const Done({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
        // ignore: prefer_const_constructors
        backgroundColor: Colors.white,
        body: Center(
          // padding: const EdgeInsets.all(100),
          child: SizedBox(
            // padding: EdgeInsets.all(40),
            //color: Colors.yellow,
            width: 300,
            height: 744,

            child: Column(children: [
              const Padding(
                padding: EdgeInsets.only(top: 80),
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 50,
                    color: Color.fromARGB(255, 39, 112, 248),
                  ),
                ),
              ),
              const SizedBox(
                width: 300,
                height: 155,
                //color: Colors.grey,
              ),
              const TextField(
                  decoration: InputDecoration(hintText: 'username')),
              const TextField(
                  obscureText: true,
                  decoration: InputDecoration(hintText: 'password')),
              const SizedBox(
                width: 300,
                height: 50,
                // color: Colors.white,
              ),
              Container(
                  height: 40,
                  width: 400,
                  child: ElevatedButton(
                      onPressed: () {}, child: const Text("LOGIN"))),
              // ignore: prefer_const_constructors
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: const Text("Forgot Password?",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              const Text("Don't have an acc.? Sign Up"),
              const SizedBox(
                width: 300,
                height: 85,
              ),
              TextButton(onPressed: () {}, child: const Text("Cancel"))
            ]),
          ),
        ));
  }
}
