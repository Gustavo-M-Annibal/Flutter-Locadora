// TODO: mesma classe do exercício 1 (Parte 1), copiada aqui.
/// Exercício 1 — Entidade principal
/// Recurso obrigatório: construtor com parâmetros nomeados + required
class Filme {
  final String titulo;
  final int duracaoMinutos;
  final double preco;
  final DateTime dataLancamento;

  Filme({
    required this.titulo,
    required this.duracaoMinutos,
    required this.preco,
    DateTime? dataLancamento,
  }) : dataLancamento = dataLancamento ?? DateTime(2000, 1, 1);

  /// Método que será sobrescrito no exercício 2 (herança).
  String ficha() {
    return '$titulo, $duracaoMinutos minutos';
  }
}
