import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DockerFile extends StatefulWidget {
  @override
  _DockerFileState createState() => _DockerFileState();
}

class _DockerFileState extends State<DockerFile> {
  var cmd;
  var mydata;

  myWeb(cmd) async {
    var url = 'http://65.0.94.30/cgi-bin/web.py?x=${cmd}';
    var result = await http.get(url);
    setState(() {
      mydata = result.body;
    });
    print(mydata);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'LW Summer Team 12_20',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 280),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage('assets/backimage.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: <Widget>[
              Container(
                width: double.maxFinite,
                height: 150,
                child: Container(
                    child: Image.asset('assets/dockerimage.png'),
                    color: Colors.transparent),
              ),
              Text(
                "Docker",
                style: TextStyle(
                    color: Colors.lightBlue,
                    fontSize: 45,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 60,
              ),
              Card(
                color: Colors.transparent,
                child: TextField(
                  cursorColor: Colors.white,
                  cursorWidth: 2.0,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                  onChanged: (value) {
                    cmd = value;
                  },
                  textAlign: TextAlign.center,
                  autocorrect: false,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: 'Lets Dockerize',
                  ),
                ),
              ),
              Card(
                color: Colors.lightBlue.shade100,
                child: ElevatedButton(
                  onPressed: () {
                    myWeb(cmd);
                  },
                  child: Text(
                    'Click Here',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              Text(mydata ?? '___'),
            ],
          ),
        ),
      ),
    );
  }
}
