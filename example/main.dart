import 'dart:html';
import "package:js/js.dart";
import 'package:intersection_observer/intersection_observer.dart' as io;

void main() {
  Element output = querySelector('#output');
  var blocks = querySelectorAll('.block');
  for (var b in blocks) {
    b.setAttribute('intersecting','false');
  }
  io.IntersectionObserverCallback callback = (List<io.IntersectionObserverEntry> entries,
      io.IntersectionObserver observer) {
    entries.forEach((io.IntersectionObserverEntry entry) {
      entry.target.setAttribute('intersecting', entry.isIntersecting.toString());

      // print('''
      // boundingClientRect: ${entry.boundingClientRect}
      // intersectionRatio: ${entry.intersectionRatio}
      // intersectionRect: ${entry.intersectionRect}
      // isIntersecting: ${entry.isIntersecting}
      // rootBounds: ${entry.rootBounds}
      // target: ${entry.target}
      // time: ${entry.time}

      // observer.root ${observer.root}
      // observer.rootMargin ${observer.rootMargin}
      // observer.thresholds ${observer.thresholds}
      
      // ''');
    });
    var redInView = blocks.where((Element el) => el.getAttribute('intersecting') == 'true' && el.classes.contains('red')).length;
    var greenInView = blocks.where((Element el) => el.getAttribute('intersecting') == 'true' && el.classes.contains('green')).length;
    output.innerHtml = '${redInView} red blocks in view <br> ${greenInView} green blocks in view';
  };
  io.IntersectionObserver observer = new io.IntersectionObserver(callback);
  querySelectorAll('.block').forEach((Element el) {
    observer.observe(el);
  });
}
