import 'package:emmthaan/provider/new_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:emmthaan/providers/prayer_provider.dart';

class newscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prayerProvider = Provider.of<newprovider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Prayer Articles'),
      ),
      body: prayerProvider.isLoading
          ? Center(child: CircularProgressIndicator())
          : prayerProvider.error != null
          ? Center(child: Text(prayerProvider.error!))
          : ListView.builder(
        itemCount: prayerProvider.articles.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(prayerProvider.articles[index]['title']),
            subtitle: Text(prayerProvider.articles[index]['description'] ?? 'No Description'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          prayerProvider.fetchArticles();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}