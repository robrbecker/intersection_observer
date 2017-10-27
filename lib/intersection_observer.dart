@JS()
library intersection_observer;

import "package:js/js.dart";
import 'dart:html' show Element, Rectangle;

typedef IntersectionObserverCallback(List<IntersectionObserverEntry> entries,
      IntersectionObserver observer);

@JS()
@anonymous
class IntersectionObserverOptions {
  external Element get root;
  external String get rootMargin;
  external List<num> get threshold;
  external factory IntersectionObserverOptions({root, rootMargin, threshold});
}

class IntersectionObserver {
  
  _IntersectionObserver _internalObserver;

  IntersectionObserver(IntersectionObserverCallback callback, [ IntersectionObserverOptions options ]) {
    _internalObserver = new _IntersectionObserver(allowInterop(callback), options);
  }

  Element get root => _internalObserver.root;
  String get rootMargin => _internalObserver.rootMargin;
  List<num> get thresholds => _internalObserver.thresholds;
  
  void disconnect() {
    _internalObserver.disconnect();
  }
  
  void observe(Element target) {
    _internalObserver.observe(target);
  }

  List<IntersectionObserverEntry> takeRecords() => _internalObserver.takeRecords();
  
  void unobserve(Element target) {
    _internalObserver.unobserve(target);
  }
}

@JS('IntersectionObserver')
class _IntersectionObserver {

  external _IntersectionObserver(IntersectionObserverCallback callback, [ IntersectionObserverOptions options ]);

  final Element root;
  final String rootMargin;
  final List<num> thresholds;
  
  external void disconnect();
  external void observe(Element target);
  external List<IntersectionObserverEntry> takeRecords();
  external void unobserve(Element target);
}

@JS("IntersectionObserverEntry")
class IntersectionObserverEntry {
  final Rectangle boundingClientRect;
  final Rectangle intersectionRect;
  final num intersectionRatio;
  final Rectangle rootBounds;
  final Element target;
  final double time;
  final bool isIntersecting;
}
