// TODO: Exercício 9 — TextFormField + TextEditingController + dispose().

import 'package:flutter/material.dart';
import '../models/filme.dart';

/// Exercício 9 — Entrada de dados
/// Recurso obrigatório: TextFormField — Conceito: TextEditingController
/// StatefulWidget aqui só por causa do dispose() dos controllers (ver nota
/// do exercício 10 no enunciado sobre vazamento de memória).
class CadastroPage extends StatefulWidget {
  final void Function(Filme) aoConfirmar;

  const CadastroPage({super.key, required this.aoConfirmar});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final _tituloController = TextEditingController();
  final _duracaoController = TextEditingController();
  final _precoController = TextEditingController();

  @override
  void dispose() {
    _tituloController.dispose();
    _duracaoController.dispose();
    _precoController.dispose();
    super.dispose();
  }

  void _confirmar() {
    final titulo = _tituloController.text;
    // O controller sempre devolve String — conversão explícita necessária.
    final duracao = int.tryParse(_duracaoController.text) ?? 0;
    final preco = double.tryParse(_precoController.text) ?? 0.0;

    final novoFilme = Filme(
      titulo: titulo,
      duracaoMinutos: duracao,
      preco: preco,
    );

    widget.aoConfirmar(novoFilme);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastrar filme')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _tituloController,
              decoration: const InputDecoration(
                labelText: 'Título',
                prefixIcon: Icon(Icons.movie),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _duracaoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Duração (min)',
                prefixIcon: Icon(Icons.timer),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _precoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Preço',
                prefixIcon: Icon(Icons.attach_money),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _confirmar,
              child: const Text('Confirmar'),
            ),
          ],
        ),
      ),
    );
  }
}
