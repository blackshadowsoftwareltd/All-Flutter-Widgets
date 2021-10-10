import 'package:flutter/material.dart';
import 'package:youtube_detailsz/model.dart';
import 'package:youtube_detailsz/services.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('YouTube Video Details'),
        ),
        body: FutureBuilder<YouTubeVideoDetailsModel>(
            future: YouTubeServices.getDetails(
                'https://www.youtube.com/watch?v=6bWC-WH3s98&t=12s'),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final data = snapshot.data;

                return Container(
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    child: SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          zText('Title : ${data!.title}'),
                          SizedBox(
                              width: double.infinity,
                              child: Image.network(data.thumbnailUrl!,
                                  fit: BoxFit.fitWidth)),
                          Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Text('Chanel : ${data.authorName}',
                                  style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold))),
                          zText('Chanel Url : ${data.authorUrl}')
                        ])));
              }
              return const Center(child: CircularProgressIndicator());
            }));
  }

  Widget zText(label) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(label, style: const TextStyle(fontSize: 18)),
      );
}
