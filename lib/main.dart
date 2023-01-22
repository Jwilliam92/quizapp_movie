import 'package:flutter/material.dart';
import 'package:project_questions/pages/questao.dart';
import 'package:project_questions/pages/questionario.dart';
import 'package:project_questions/pages/resposta.dart';
import 'package:project_questions/pages/resultado.dart';

void main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var perguntaSelecionada = 0;
  var _notaTotal = 0;
  final _perguntas = const [
    {
      'text':
          'De qual filme de terror saiu a frase: Qual o seu filme de terror favorito?',
      'respostas': [
        {'text': 'Halloween', 'nota': 5},
        {'text': 'Pânico', 'nota': 10},
        {'text': 'A Hora do Pesadelo', 'nota': 3},
        {'text': 'Massacre da Serra Elétrica', 'nota': 1},
      ],
    },
    {
      'text': 'Quem é o diretor do filme Exterminador do Futuro?',
      'respostas': [
        {'text': 'Eli Roth', 'nota': 3},
        {'text': 'Charles Chaplin', 'nota': 5},
        {'text': 'James Cameron', 'nota': 10},
        {'text': 'Sam Raimi', 'nota': 1},
      ],
    },
    {
      'text': 'Qual o ano de Lançamento do Filme Tubarão?',
      'respostas': [
        {'text': '1986', 'nota': 3},
        {'text': '1990', 'nota': 5},
        {'text': '1975', 'nota': 10},
        {'text': '1980', 'nota': 1},
      ],
    },
  ];

  void _responder(int nota) {
    if (temPerguntaSelecionada) {
      setState(() {
        perguntaSelecionada++;
        _notaTotal += nota;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      perguntaSelecionada = 0;
      _notaTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          title: Center(child: const Text('Perguntas')),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: perguntaSelecionada,
                quandoResponder: _responder,
              )
            : Resultado(_notaTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
