import 'filme.dart';

/// Exercício 2 — Herança
/// Recurso obrigatório: extends — Conceito: super no construtor + @override
///
/// Teste "é-um": todo filme legendado é um filme. Cabe herança.
class FilmeLegendado extends Filme {
  final String idioma;
  final String estudioDublagem;

  FilmeLegendado({
    required String titulo,
    required int duracaoMinutos,
    required double preco,
    DateTime? dataLancamento,
    required this.idioma,
    required this.estudioDublagem,
  }) : super(
          titulo: titulo,
          duracaoMinutos: duracaoMinutos,
          preco: preco,
          dataLancamento: dataLancamento,
        );

  @override
  String ficha() {
    return '${super.ficha()}, $idioma, dublagem: $estudioDublagem';
  }
}
