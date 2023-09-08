import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(
    MaterialApp(
      home:MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  final String gitHubLink = "https://github.com/Iykeman98";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('StageOne'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage("assets/profile2.jpeg"),
              ),
              SizedBox(height: 40,),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:  MaterialStatePropertyAll<Color>(Colors.white30),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GitHubWebView(gitHubUrl: gitHubLink),
                    ),
                  );
                },
                child: Text("Open GitHub", style: TextStyle(color: Colors.black),),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class GitHubWebView extends StatelessWidget {
  final String gitHubUrl;

  GitHubWebView({required this.gitHubUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text('GitHub Profile'),
          centerTitle: true,
      ),
      body: WebView(
        initialUrl: gitHubUrl,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}





