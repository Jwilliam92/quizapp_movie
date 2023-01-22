import 'package:flutter/material.dart';
import 'package:project_questions/pages/questao.dart';
import 'package:project_questions/pages/resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final perguntaSelecionada;
  final void Function(int) quandoResponder;

  Questionario({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.quandoResponder,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada]['respostas']
            as List<Map<String, Object>>
        : [];
    return Column(
      children: <Widget>[
        Questao(perguntas[perguntaSelecionada]['text'].toString()),
        ...respostas.map(
          (resp) {
            return Resposta(
              resp['text'].toString(),
              () => quandoResponder(int.parse(resp['nota'].toString())),
            );
          },
        )
      ],
    );
  }
}
