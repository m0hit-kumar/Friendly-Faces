import 'package:flutter/material.dart';

class Practice extends StatelessWidget {
  const Practice({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // ignore: prefer_const_constructors
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          //     child: SizedBox(
          //   width: 400,
          //   height: 700,
          //   child: Padding(
          //     padding: EdgeInsets.only(top: 100),
          //     child: Text(
          //       'Sign Up',
          //       style: TextStyle(
          //         fontSize: 50,
          //         color: Color.fromARGB(255, 39, 112, 248),
          //       ),
          //     ),
          //   ),
          // )

          child: SizedBox(
            width: 250,
            height: 744,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 100),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 50,
                      color: Color.fromRGBO(157, 124, 209, 1),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 200,
                  height: 70,
                  //color: Colors.grey,
                ),
                const TextField(
                    decoration: InputDecoration(hintText: 'Full Name')),
                const SizedBox(
                  width: 200,
                  height: 20,
                  //color: Colors.grey,
                ),
                const TextField(
                    decoration: InputDecoration(hintText: 'Email id')),
                const SizedBox(
                  width: 200,
                  height: 20,
                  //color: Colors.grey,
                ),
                const TextField(
                    decoration: InputDecoration(hintText: 'Username')),
                const SizedBox(
                  width: 200,
                  height: 20,
                  //color: Colors.grey,
                ),
                const TextField(
                    decoration: InputDecoration(hintText: 'Password')),
                const SizedBox(
                  width: 200,
                  height: 20,
                  //color: Colors.grey,
                ),
                SizedBox(
                    height: 40,
                    width: 200,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text("Sign Up"))),
                const SizedBox(
                  width: 200,
                  height: 20,
                  //color: Colors.grey,
                ),
                const Text("Already have an account?"),
                TextButton(onPressed: () {}, child: const Text("Sign In")),
                const SizedBox(
                  width: 200,
                  height: 40,
                  //color: Colors.grey,
                ),
                TextButton(onPressed: () {}, child: const Text("Cancel"))
              ],
            ),
          ),
        ));
  }
}
