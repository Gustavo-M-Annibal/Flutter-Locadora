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
      backgroundColor: const Color(0xFFF5EFE6),
      appBar: AppBar(
        title: const Text('Cadastrar filme'),
        centerTitle: true,
        backgroundColor: const Color(0xFF6B1E23),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
        ),
      ),
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
                prefixIcon: Icon(Icons.movie, color: Color(0xFF6B1E23)),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF6B1E23), width: 2),
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _duracaoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Duração (min)',
                prefixIcon: Icon(Icons.timer, color: Color(0xFF6B1E23)),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF6B1E23), width: 2),
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _precoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Preço',
                prefixIcon: Icon(Icons.attach_money, color: Color(0xFF6B1E23)),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF6B1E23), width: 2),
                ),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _confirmar,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6B1E23),
                foregroundColor: Colors.white,
              ),
              child: const Text('Confirmar'),
            ),
          ],
        ),
      ),
    );
  }
}