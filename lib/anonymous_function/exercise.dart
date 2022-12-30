typedef TouchHandler = void Function(double x, double y);

class Surface {
  final TouchHandler onTouch;

  Surface({required this.onTouch});

  void touch(double x, double y) => onTouch.call(x, y);
}

main() {
  final surface = Surface(onTouch: (x, y) {
    print('x: $x y: $y');
  });

  surface.touch(202.3, 134.0);
}
