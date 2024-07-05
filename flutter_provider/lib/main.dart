import 'package:flutter/material.dart';
import 'package:flutter_provider/user_provider.dart';
import 'package:provider/provider.dart';

import 'cart_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => cart(),
      ),
      ChangeNotifierProvider(
        create: (context) => User(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

// class CartScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Cart')),
//       body: Consumer<cart>(
//         builder: (context, cart, child) {
//           return ListView.builder(
//             itemCount: cart.items.length,
//             itemBuilder: (context, index) {
//               return ListTile(
//                 title: Text(cart.items[index]),
//                 trailing: IconButton(
//                   icon: Icon(Icons.delete),
//                   onPressed: () {
//                     cart.removeItem(cart.items[index]);
//                   },
//                 ),
//               );
//             },
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () =>
//             Provider.of<cart>(context, listen: false).addItem('New Item'),
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<User>(
          builder: (context, user, child) {
            return Text('Hello, ${user.name}');
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<cart>(
              builder: (context, cart, child) {
                return ListView.builder(
                  itemCount: cart.items.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(cart.items[index]),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          cart.removeItem(cart.items[index]);
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () =>
                  Provider.of<cart>(context, listen: false).addItem('New Item'),
              child: Text('Add Item to Cart'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () =>
                  Provider.of<User>(context, listen: false).setName(' Doe'),
              child: Text('Set User Name'),
            ),
          ),
        ],
      ),
    );
  }
}
