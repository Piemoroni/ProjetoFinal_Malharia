const prisma = require("../data/prisma");

const {
  pedidoDuplicado,
  podeExcluirPedido,
  validarEstoque,
  calcularValor
} = require("../services/pedidos.service");

const cadastrar = async (req, res) => {
  const data = req.body;

  try {
    await pedidoDuplicado(data.clienteId, data.roupaId);

    const roupa = await validarEstoque(
      data.roupaId,
      data.quantidade
    );

    data.valor_final = calcularValor(
      data.quantidade,
      roupa.valor
    );

    const item = await prisma.pedidos.create({ data });

    res.json(item);

  } catch (e) {
    res.json({ erro: e.message });
  }
};

const listar = async (req, res) => {
  const lista = await prisma.pedidos.findMany();
  res.json(lista);
};

const buscar = async (req, res) => {
  const item = await prisma.pedidos.findUnique({
    where: { id: Number(req.params.id) }
  });

  if (!item) return res.json({ erro: "Pedido não encontrado" });

  res.json(item);
};

const atualizar = async (req, res) => {
  const item = await prisma.pedidos.findUnique({
    where: { id: Number(req.params.id) }
  });

  if (!item) return res.json({ erro: "Pedido não encontrado" });

  const atualizado = await prisma.pedidos.update({
    where: { id: Number(req.params.id) },
    data: req.body
  });

  res.json(atualizado);
};

const excluir = async (req, res) => {
  try {
    await podeExcluirPedido(Number(req.params.id));

    const item = await prisma.pedidos.findUnique({
      where: { id: Number(req.params.id) }
    });

    if (!item) return res.json({ erro: "Pedido não encontrado" });

    await prisma.pedidos.delete({
      where: { id: Number(req.params.id) }
    });

    res.json({ mensagem: "Pedido excluído" });

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