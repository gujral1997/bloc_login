import 'dart:async';

class Bloc {
  final _emailController = StreamController<String>(); // _ for private
  final passwordController = StreamController<String>();

  Function(String) get changeEmail => _emailController.sink.add;
}

void main() {
  final bloc = Bloc();

  bloc._emailController.sink.add('aaa');

  bloc.changeEmail('');
}
