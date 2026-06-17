const prisma = require("../data/prisma");

const {
  encomendaDuplicada,
  podeExcluirEncomenda,
  validarEstoque,
  calcularValor
} = require("../services/encomendas.service");

const cadastrar = async (req, res) => {
  const data = req.body;

  try {
    await encomendaDuplicada(
      data.clienteId,
      data.roupaId,
      data.descricao_personalizada
    );

    const roupa = await validarEstoque(
      data.roupaId,
      data.quantidade
    );

    data.valor = calcularValor(data.quantidade, roupa.valor);

    const item = await prisma.encomendas.create({ data });

    res.json(item);

  } catch (e) {
    res.json({ erro: e.message });
  }
};

const listar = async (req, res) => {
  const lista = await prisma.encomendas.findMany();
  res.json(lista);
};

const buscar = async (req, res) => {
  const item = await prisma.encomendas.findUnique({
    where: { id: Number(req.params.id) }
  });

  if (!item) return res.json({ erro: "Encomenda não encontrada" });

  res.json(item);
};

const atualizar = async (req, res) => {
  const item = await prisma.encomendas.findUnique({
    where: { id: Number(req.params.id) }
  });

  if (!item) return res.json({ erro: "Encomenda não encontrada" });

  const atualizado = await prisma.encomendas.update({
    where: { id: Number(req.params.id) },
    data: req.body
  });

  res.json(atualizado);
};

const excluir = async (req, res) => {
  try {
    await podeExcluirEncomenda(Number(req.params.id));

    const item = await prisma.encomendas.findUnique({
      where: { id: Number(req.params.id) }
    });

    if (!item) return res.json({ erro: "Encomenda não encontrada" });

    await prisma.encomendas.delete({
      where: { id: Number(req.params.id) }
    });

    res.json({ mensagem: "Encomenda excluída" });

  } catch (e) {
    res.json({ erro: e.message });
  }
};

module.exports = {
  cadastrar,
  listar,
  buscar,
  atualizar,
  excluir
};