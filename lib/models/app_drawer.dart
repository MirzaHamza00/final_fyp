import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

class AppDrawer extends StatefulWidget {
  static const Color backHexColor = Color(0xff1D2553);

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  File _storedImage;

  Future<void> _takePicture() async {
    final picker = ImagePicker();
    final imageFile = await picker.getImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    setState(() {
      if (imageFile != null) {
        _storedImage = File(imageFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: deviceSize.height * 0.27,
              decoration: BoxDecoration(
                color: AppDrawer.backHexColor,
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.elliptical(
                        MediaQuery.of(context).size.width, 120.0)),
              ),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 18, 0),
                    width: deviceSize.width * 0.21,
                    height: deviceSize.height * 0.13,
                    child: ClipOval(
                      child: _storedImage != null
                          ? imagePicker(deviceSize)
                          : GestureDetector(
                              onTap: _takePicture,
                              child: Container(
                                width: deviceSize.width * 0.24,
                                height: deviceSize.height * 0.15,
                                child: Image.asset(
                                  'assets/images/takePic.png',
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                              ),
                            ),
                    ),
                  ),
                  SizedBox(
                    width: deviceSize.width * 0.01,
                  ),
                  FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      'UserName',
                      style: TextStyle(
                        fontSize: 23,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.map,
                color: Colors.deepOrange,
              ),
              title: Text(
                'NearBy Places',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('nearPlace');
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.cloud,
                color: Colors.deepOrange,
              ),
              title: Text(
                'Weather Update',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('whetherUpdate');
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.language,
                color: Colors.deepOrange,
              ),
              title: Text(
                'Language',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.keyboard_return,
                color: Colors.deepOrange,
              ),
              title: Text(
                'Log Out',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
          ],
        ),
      ),
    );
  }

  Container imagePicker(Size deviceSize) {
    return Container(
      width: deviceSize.width * 0.25,
      height: deviceSize.height * 0.14,
      color: Colors.transparent,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.file(
            _storedImage,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: GestureDetector(
              onTap: _takePicture,
              child: Container(
                color: Colors.black38,
                width: double.infinity,
                child: Text(
                  'edit',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.lightGreen[200],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
