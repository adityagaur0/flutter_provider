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
