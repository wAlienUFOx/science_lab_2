import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'menu.dart';
import 'dart:io';
//import 'package:path_provider/path_provider.dart';
import 'package:image_picker/image_picker.dart';

class Publish extends StatefulWidget {
  const Publish({Key? key}) : super(key: key);

  @override
  State<Publish> createState() => _PublishState();
}

class _PublishState extends State<Publish> {

  File? image;
  String description = '';

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Опубликовать'),
        centerTitle: true,
        actions: [
          IconButton(
            icon:  Icon(Icons.menu),
            onPressed: () =>
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Menu())
                ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            image != null ? Center(
              child: Column(
                children: [
                  SizedBox(height: 5),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child:
                      Image.file(
                          image!,
                      width: 400,
                      height: 500,
                      fit: BoxFit.cover,),
                  ),
                ],
              ),
            ) :
            Container(
              width: 400,
              height: 500,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      pickImage(ImageSource.camera);
                    },
                    child:  Text('Открыть камеру'),
                    style: ElevatedButton.styleFrom(
                        minimumSize:  Size(200.0, 40.0),
                        primary: Colors.blue
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      pickImage(ImageSource.gallery);
                    },
                    child:  Text('Открыть галерею'),
                    style: ElevatedButton.styleFrom(
                        minimumSize:  Size(200.0, 40.0),
                        primary: Colors.blue
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              maxLines: 5,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300, fontFamily: 'TimesNewRoman'),
              decoration:  InputDecoration(
                labelText: 'Описание',
              ),
              onChanged: (String string){
                description = string;
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.send),
        onPressed: () {
          //space for export function
          Navigator.of(context).pop();
        }
      ),
    );
  }

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTmp = File(image.path);
      setState((){
        this.image = imageTmp;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image $e');
    }
  }

}