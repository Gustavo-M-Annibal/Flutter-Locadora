// TODO: Exercício 8 — recebe o objeto pelo construtor da tela, via
// Navigator.of(context).push com MaterialPageRoute.

import 'package:flutter/material.dart';
import '../models/filme.dart';

/// Exercício 8 — Navegação com passagem de dados
/// O objeto chega aqui pelo construtor, vindo de Navigator.push na home_page.
/// Mostra 2 dados que NÃO aparecem no cartão: preço e data de lançamento.
class DetalhePage extends StatelessWidget {
  final Filme filme;

  const DetalhePage({super.key, required this.filme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(filme.titulo)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(filme.titulo, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Text('Preço: R\$ ${filme.preco.toStringAsFixed(2)}'),
            const SizedBox(height: 8),
            Text(
              'Lançamento: ${filme.dataLancamento.day}/'
              '${filme.dataLancamento.month}/${filme.dataLancamento.year}',
            ),
          ],
        ),
      ),
    );
  }
}
