import 'dart:async';

import 'package:flutter/services.dart' show PlatformException;
import 'package:uni_links/uni_links.dart';


class DeepLinks {
  // ignore: cancel_subscriptions
  static StreamSubscription? _sub;
  static bool isInitialized = false;
  static late Function(Uri? uri) _processUri;

  static void init(void Function(Uri? uri) fn) async {
    _processUri = fn;
    if (isInitialized) {
      return;
    }

    try {
      await _initUniLinks();
      isInitialized = true;
    } catch (e) {
      print('startup init AppLink error');
    }
    await setupUriLinksStream();
  }

  

  static Future<void> _initUniLinks() async {
    print('initUniLinks');
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      Uri? initialUri = await getInitialUri();
      if (initialUri == null) {
        print('INITIAL URI NULL');
        return;
      }
      _processUri(initialUri);
    } on PlatformException {
      // Handle exception by warning the user their action did not succeed
    }
  }

  static Future<void> setupUriLinksStream() async {
    print('setupUriLinksStream');
    if (_sub != null) {
      print('already set up');
      return;
    }

    try {
      // Attach a listener to the stream
      // getUriLinksStream()
      _sub = getInitialUri().asStream().listen((Uri? uri) {
        if (uri != null) {
          _processUri(uri);
        }
      }, onError: (err) {
        // Handle exception by warning the user their action did not succeed
        print('uriLinksStream error');
        print(err);
      });
      // NOTE: Don't forget to call _sub.cancel() in dispose()
    } on PlatformException {
      // Handle exception by warning the user their action did not succeed
      print('setupUriLinksStream platformException');
    }
  }

  static void dispose() {
    print('disposeUriLinksStream');
//    _sub?.cancel();
  }
}
