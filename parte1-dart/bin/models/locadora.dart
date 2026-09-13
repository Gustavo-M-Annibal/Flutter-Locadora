// TODO: Exercícios 3 e 4 — composição (List<Filme>) e encapsulamento
// (atributo privado + getter calculado).
/// Exercício 3 — Composição
/// Recurso obrigatório: List<Filme> — "tem um", não "é um".
///
/// Exercício 4 — Encapsulamento
/// Recurso obrigatório: atributo privado (_filmes) —
/// Conceito: getter calculado (duracaoTotalMinutos), não campo guardado.
import 'filme.dart';
class Locadora {
  final String nome;
  final List<Filme> _filmes = [];

  Locadora({required this.nome});

  void adicionar(Filme filme) {
    _filmes.add(filme);
  }

  /// Cópia somente-leitura para quem consome de fora (ex: a UI na Parte 2).
  List<Filme> get filmes => List.unmodifiable(_filmes);

  /// Calculado a cada chamada a partir de _filmes — nunca armazenado.
  int get duracaoTotalMinutos {
    var total = 0;
    for (final filme in _filmes) {
      total += filme.duracaoMinutos;
    }
    return total;
  }
}
