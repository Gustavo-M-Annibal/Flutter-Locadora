// TODO: Exercício 1 — classe principal do domínio.
// Recurso obrigatório: construtor com parâmetros nomeados + required
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
}