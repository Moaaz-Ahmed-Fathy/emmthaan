import 'package:emmthaan/provider/new_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:emmthaan/providers/prayer_provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prayer Articles'),
      ),
      body: Consumer<newprovider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (provider.error != null) {
            return Center(child: Text(provider.error!));
          }

          return ListView.builder(
            itemCount: provider.articles.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(provider.articles[index]['title']),
                subtitle: Text(provider.articles[index]['description'] ?? 'No Description'),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<newprovider>(context, listen: false).fetchArticles();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}