import 'package:flutter/material.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';


class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildNewsItem(
            'Exploring the Enchanting Forests',
            '''
            Discover the hidden wonders of dense forests and their unique ecosystems. 
            Explore the diverse flora and fauna that inhabit these enchanting places. 
            Learn about the delicate balance of nature and the importance of preserving these ecosystems.
            ''',
            'https://i0.wp.com/forestsnews.cifor.org/wp-content/uploads/2018/02/37008043706_f9436587c4_k.jpg?fit=2048%2C1365&ssl=1',
          ),
          _buildNewsItem(
            'The Majesty of Mountains',
            '''
            Embark on a journey to explore the majestic mountains around the world. 
            Experience breathtaking views from towering peaks and learn about the geological wonders they hold. 
            Understand the impact of climate change on mountainous regions and the importance of conservation efforts.
            ''',
            'https://images.unsplash.com/photo-1503614472-8c93d56e92ce?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8MTh8fHxlbnwwfHx8fHw%3D',
          ),
          _buildNewsItem(
            'Serenity by the Seashore',
            '''
            Immerse yourself in the serenity of the seashore. 
            From pristine beaches to coastal landscapes, discover the beauty of the ocean and its impact on the surrounding environment. 
            Learn about marine life, coastal ecosystems, and the challenges they face in the modern world.
            ''',
            'https://images.unsplash.com/photo-1491378630646-3440efa57c3b?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2Vhc2hvcmV8ZW58MHx8MHx8fDA%3D',
          ),
          _buildFooter(),
        ],
      ),
    );
  }

  Widget _buildNewsItem(String title, String description, String imageUrl) {
    return Card(
      margin: EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            imageUrl,
            height: 200.0,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 12.0),
                Text(
                  description,
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      color: Colors.grey[200],
      padding: EdgeInsets.all(16.0),
      child: Center(
        child: Text(
          'Copyright © 2024 Iteka Inc.',
          style: TextStyle(
            fontSize: 16.0,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
