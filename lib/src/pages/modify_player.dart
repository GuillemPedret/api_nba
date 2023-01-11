import 'package:api_to_sqlite/src/models/player_model.dart';
import 'package:api_to_sqlite/src/providers/db_provider.dart';
import 'package:api_to_sqlite/src/providers/players_api_provider.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import 'home_page.dart';

class ModifyPlayer extends StatefulWidget {
  const ModifyPlayer({Key? key}) : super(key: key);


  @override
  _ModifyPlayerState createState() => _ModifyPlayerState();
}

class _ModifyPlayerState extends State<ModifyPlayer> {
  var isLoading = false;



  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String,dynamic>;
    final _name = TextEditingController(text: args['name']);
    final _avatar = TextEditingController(text: args['avatar']);
    final _team = TextEditingController(text: args['team']);
    final _id = TextEditingController(text: args['id']);

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Modify NBA player', style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        actions: <Widget>[
          Container(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () async {
                await DBProvider.db.deleteSelectedPlayer(int.parse(_id.text));
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
            ),
          ),
        ],
      ),

      body: isLoading
          ? const Center(
        child: CircularProgressIndicator(),
      )
          :
    SingleChildScrollView(
    physics: NeverScrollableScrollPhysics(),
      child: Container(

          decoration: const BoxDecoration(
            image: DecorationImage(
              scale: 2.0,
              opacity: 0.2,
              image: AssetImage(
                  'assets/images/NBA-logo.png'),
            ),
          ),
          child: Container(
            color: Colors.transparent,
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 15, top: 15, right: 15, bottom: 15),
                child: ListView(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        controller: _name,
                        //initialValue: args['name'],
                        //textInputAction: TextInputAction.newline,
                        cursorColor: Colors.black,
                        maxLines: 2,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                        autofocus: true,
                        decoration: const InputDecoration(
                          hintText: 'Name',
                          labelText: 'Name and Surname',
                          labelStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: _team ,
                        //initialValue: args['team'],
                        //textInputAction: TextInputAction.newline,
                        cursorColor: Colors.black,
                        maxLines: 1,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                        autofocus: true,
                        decoration: const InputDecoration(
                          hintText: 'Team',
                          labelText: 'Team',
                          labelStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ), ),)
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          DBProvider.db.deleteSelectedPlayer(int.parse(_id.text));
          DBProvider.db.insertNewPlayer(_name.text, _avatar.text, _team.text, _id.text);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        },
        backgroundColor: Colors.black,
        child: Text('Modify'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

}





