# flutter_provider
## To share information between the widget tree.
![wgt tree](https://github.com/adityagaur0/flutter_provider/assets/112656570/28d9cf90-f4f2-4160-8bfc-015aaf5f2b4f)

## Example App demo with Provider
```
dependencies:
  flutter:
    sdk: flutter
  provider:version
```

Then, you have several tools at your disposal:

**ChangeNotifier:**         This one should be extended to provide an object that can be used to send change notifications to its listeners.

**ChangeNotifierProvider:** It has changes from a ChangeNotifier. Child widgets can access the state object and listen the changes

**Consumer:**               Rebuilds part of a subtree when the listening state changes.

**Provider.of:**            Allows descendant widgets to access the state object.

Building our first Provider
```
import 'package:flutter/material.dart';

class CatProvider extends ChangeNotifier {
  String _name = 'undefined michi 😼';

  String get name => _name;

  set name (String newName) {
    _name = newName;
    notifyListeners();
  }

}
```
main fn


```
class ProviderExample extends StatelessWidget {
  const ProviderExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create:  (context) => CatProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Home(),
      ),
    );
  }
}

```
### Multi provider

```
import 'package:example_provider/cat_provider.dart';
import 'package:example_provider/home.dart';
import 'package:example_provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class ProviderExample extends StatelessWidget {
  const ProviderExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: 
      [
        ChangeNotifierProvider(create:  (context) => UserProvider(),),
        ChangeNotifierProvider(create:  (context) => CatProvider(),)
        ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Home(),
      ),
    );
  }
}
```
