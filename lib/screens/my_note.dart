import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model.dart';
import 'controller.dart';

class MyNote extends StatelessWidget {
  int index;
  // MyNote({
  //   Key? key,
  //   required this.index,
  // }) : super(key: key);
  // const MyNote({Key? key, required this.index}) : super(key: key);

  MyNote({this.index});
  @override
  Widget build(BuildContext context) {
    final NoteController nc = Get.find();
    String text = "";
    text = index == null ? " " : nc.notes[index].title;
    TextEditingController textEditingController =
        new TextEditingController(text: text);

    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: index == null
                  ? Text('Create a New Note ')
                  : Text('Update note'),
            ),
            body: Padding(
              padding: EdgeInsets.all(15),
              child: Container(
                height: 500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: textEditingController,
                        autofocus: true,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: InputDecoration(
                          hintText: 'Create a new note!!',
                          labelText: ' My Note',
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black87),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        style: TextStyle(fontSize: 20),
                        keyboardType: TextInputType.text,
                        maxLines: 5,
                      ),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          RaisedButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: Text('Cancel'),
                            color: Colors.red,
                          ),
                          RaisedButton(
                            onPressed: () {
                              if (index == null) {
                                nc.notes.add(
                                    Note(title: textEditingController.text));
                              } else {
                                var updatenote = nc.notes[index];
                                updatenote.title = textEditingController.text;
                                nc.notes[index] = updatenote;
                              }

                              Get.back();
                            },
                            child: index == null ? Text('Add') : Text('Update'),
                            color: Colors.green,
                          )
                        ])
                  ],
                ),
              ),
            )));
  }
}
