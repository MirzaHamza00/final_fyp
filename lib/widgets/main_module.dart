import 'package:flutter/material.dart';

class MainModule extends StatelessWidget {
  final String id;
  final String title;
  final String imagePath;

  MainModule(this.id, this.title, this.imagePath);

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed('poolingtour');
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Card(
      elevation: 5,
      shadowColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: InkWell(
        onTap: () => selectCategory(context),
        splashColor: Colors.blue[900],
        borderRadius: BorderRadius.circular(15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 10.0,
                ),
                width: 40,
                height: 40,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: deviceSize.height * 0.01,
              ),
              Center(
                child: Container(
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 8),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: deviceSize.height * 0.02,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PoolingTour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('PoolingTour'),
    );
  }
}
