import 'package:api_to_sqlite/src/providers/db_provider.dart';
import 'package:api_to_sqlite/src/providers/players_api_provider.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class AddPlayer extends StatefulWidget {
  const AddPlayer({Key? key}) : super(key: key);

  @override
  _AddPlayerState createState() => _AddPlayerState();
}

class _AddPlayerState extends State<AddPlayer> {
  var isLoading = false;
  final _name = TextEditingController();
  final _avatar = TextEditingController();
  final _team = TextEditingController();
  final _id = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text('Add NBA player', style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        actions: <Widget>[
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
                        textInputAction: TextInputAction.newline,
                        cursorColor: Colors.red,
                        maxLines: 2,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                        autofocus: true,
                        decoration: const InputDecoration(
                          hintText: 'Name',
                          labelText: 'Name and Surname',
                          labelStyle: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w500),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: _team,
                        textInputAction: TextInputAction.newline,
                        cursorColor: Colors.red,
                        maxLines: 1,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                        autofocus: true,
                        decoration: const InputDecoration(
                          hintText: 'Team',
                          labelText: 'Team',
                          labelStyle: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w500),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: _avatar,
                        textInputAction: TextInputAction.newline,
                        cursorColor: Colors.red,
                        maxLines: 2,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                        autofocus: true,
                        decoration: const InputDecoration(
                          hintText: 'Avatar photo',
                          labelText: 'Avatar',
                          labelStyle: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w500),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                        ),

                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: _id,
                        textInputAction: TextInputAction.newline,
                        cursorColor: Colors.red,
                        maxLines: 2,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                        autofocus: true,
                        decoration: const InputDecoration(
                          hintText: 'Number Player',
                          labelText: 'Number',
                          labelStyle: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w500),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                        ),

                      ),
                    ),
                  ],
                ),
              ),
            ),),)
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          DBProvider.db.insertNewPlayer(_name.text, _avatar.text, _team.text, _id.text);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        },
        backgroundColor: Colors.red,
        child: Text('Add'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  }





