/// The basic data structure of LISP.
class Cons {
  /// The first object.
  dynamic car;

  /// The second object.
  dynamic cdr;

  /// Constructs a cons.
  Cons(this.car, [this.cdr]);

  /// The head of the cons.
  dynamic get head => car;

  /// The tail of the cons, if applicable.
  Cons? get tail {
    if (cdr is Cons) {
      return cdr;
    } else if (cdr == null) {
      return null;
    } else {
      throw StateError('${toString()} does not have a tail.');
    }
  }

  @override
  bool operator ==(Object other) =>
      other is Cons && car == other.car && cdr == other.cdr;

  @override
  int get hashCode => 31 * car.hashCode + cdr.hashCode;

  @override
  String toString() {
    final buffer = StringBuffer();
    buffer.write('(');
    var current = this;
    for (;;) {
      buffer.write(current.car);
      if (current.cdr is Cons) {
        current = current.cdr;
        buffer.write(' ');
      } else if (current.cdr == null) {
        buffer.write(')');
        return buffer.toString();
      } else {
        buffer.write(' . ');
        buffer.write(current.cdr);
        buffer.write(')');
        return buffer.toString();
      }
    }
  }
}
