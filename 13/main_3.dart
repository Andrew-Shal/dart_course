import 'dart:html';

void main() {
  final ButtonElement button = querySelector('button');
  final InputElement input = querySelector('input');

  button.onClick.take(4).where((event) => input.value == 'test').listen(
      (event) => print('you guessed correct!'),
      onDone: () => print('sorry, you lost the game!'));
}
