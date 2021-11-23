

import 'package:flutter/material.dart';
import 'package:restaurant_app/page/detail_page.dart';
import 'package:restaurant_app/restaurant.dart';

class RestaurantListPage extends StatelessWidget {
  const RestaurantListPage({Key? key}) : super(key: key);

  static const routeName = '/resto_list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant', style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        shadowColor: Colors.grey,
      ),
      body: FutureBuilder<String>(
        future: DefaultAssetBundle.of(context)
            .loadString('assets/local_restaurant.json'),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            // loading widget
            return const Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasData) {
              final List<RestaurantElement> restos =
                  parseRestos(snapshot.data!);
              return ListView.builder(
                  itemCount: restos.length,
                  itemBuilder: (context, index) {
                    return _buildRestoItem(context, restos[index]);
                  });
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }
        },
      ),
    );
  }
}

Widget _buildRestoItem(BuildContext context, RestaurantElement resto) {
  return Card(
    child: InkWell(
      splashColor: Colors.blue,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8.0),
          leading: ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: 80,
              minHeight: 80,
              maxWidth: 80,
              maxHeight: 80,
            ),
            child: Image.network(resto.pictureId, fit: BoxFit.cover),
          ),
          title: Text(resto.name),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(resto.city),
              Text(resto.rating.toString()),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, RestoDetailPage.routeName,
        arguments: resto);
      }
    ),
  );
}
