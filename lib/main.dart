import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<String> imageUrls = [
    'https://ichef.bbci.co.uk/news/976/cpsprodpb/6509/production/_125856852_gettyimages-499342095-594x594.jpg',
    'https://www.koimoi.com/wp-content/new-galleries/2023/08/when-shah-rukh-khan-scared-the-sht-out-out-a-reporter-jokingly-threatened-to-kill-him-over-questions-on-his-smoking-habits-01.jpg',
    'https://api.time.com/wp-content/uploads/2023/04/shah-rukh-khan-time100-2023-1.jpg',
    'https://images.indianexpress.com/2022/12/shah-rukh-khan-pathaan-1200.jpeg',
    'https://images.news18.com/ibnlive/uploads/2023/01/shah-rukh-khan-2-167317681916x9.jpg',
    'https://www.koimoi.com/wp-content/new-galleries/2023/03/shah-rukh-khans-wish-of-his-mother-watching-his-films-on-the-great-wall-of-china-from-heaven-makes-fans-cry-again-see-video-001.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Photo Gallery')),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'Welcome to My Photo Gallery!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for photos...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 11,
                mainAxisSpacing: 11,
              ),
              itemCount: imageUrls.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Photo ${index + 1} Clicked!!'),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Image.network(
                          imageUrls[index],
                          height: 60, // Adjusted height
                          width: 60, // Adjusted width
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Center(child: Text('Photo ${index + 1}')),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            ListTile(
              leading: Image.network(
                'https://www.koimoi.com/wp-content/new-galleries/2023/01/pathaan-box-office-success-was-predicted-by-shah-rukh-khan-much-before-the-films-release-netizens-think-so-001.jpg',
                height: 100,
                width: 90,
                fit: BoxFit.cover,
              ),
              title: Text('Photo 1'),
              subtitle: Text('Description for Photo 1'),
            ),
            ListTile(
              leading: Image.network(
                'https://www.masala.com/cloud/2022/11/02/PpuJn94Z-Shah-Rukh-Khan-exclusive-image-for-Masala-1200x900.jpg',
                height: 100,
                width: 90,
                fit: BoxFit.cover,
              ),
              title: Text('Photo 2'),
              subtitle: Text('Description for Photo 2'),
            ),
            ListTile(
              leading: Image.network(
                'https://assets.gqindia.com/photos/63d15b3f54581faa93efe4e1/16:9/w_1920,h_1080,c_limit/Shah%20Rukh%20Khan%20in%20Pathaan.jpg',
                height: 100,
                width: 90,
                fit: BoxFit.cover,
              ),
              title: Text('Photo 3'),
              subtitle: Text('Description for Photo 3'),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: FloatingActionButton(
                elevation: 18,
                child: Icon(Icons.upload),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Photos Uploaded Successfully!'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
