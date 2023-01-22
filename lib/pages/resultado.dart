import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int nota;
  final void Function() reiniciarQuestionario;

  Resultado(this.nota, this.reiniciarQuestionario);

  String get fraseResultado {
    if (nota < 8) {
      return 'Parabéns!';
    } else if (nota < 12) {
      return 'Você é bom!';
    } else if (nota < 16) {
      return 'Você foi incrível!';
    } else {
      return 'Nível Impressionante!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Center(
        child: Text(
          fraseResultado,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      SizedBox(
        height: 12,
      ),
      Center(
        child: Column(
          children: [
            ElevatedButton.icon(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.deepPurpleAccent),
              ),
              onPressed: reiniciarQuestionario,
              icon: const Icon(Icons.restart_alt_rounded),
              label: const Text('Reiniciar!'),
            ),
          ],
        ),
      ),
    ]);
  }
}
