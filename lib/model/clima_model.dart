class ClimaModel {

  final double temperatura;
  final double tempMin;
  final double tempMax;
  final double sensacaoTermica;
  final String descricao;
  final String icone;
  final int umidade;
  final int visibilidade;
  final int pressao;

  ClimaModel(
      this.temperatura,
      this.tempMin,
      this.tempMax,
      this.sensacaoTermica,
      this.descricao,
      this.icone,
      this.umidade,
      this.visibilidade,
      this.pressao);
}