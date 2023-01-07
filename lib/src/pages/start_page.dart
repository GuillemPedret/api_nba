import 'package:api_to_sqlite/src/pages/home_page.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 40.0),
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/background.gif"),
            fit: BoxFit.cover,),
        ),
        child: Expanded(
          child: Align(
            alignment: FractionalOffset.bottomCenter,
            child: SizedBox(
              width: 100,
              height: 100,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                  child: Text('START'),
                  style: ButtonStyle(
                  shape: MaterialStateProperty.all(CircleBorder()),
                  padding: MaterialStateProperty.all(EdgeInsets.all(20)),
                  backgroundColor: MaterialStateProperty.all(Colors.red)),),
              ),
            )
            ),
          ),


    );
  }
}

