const prisma = require("../data/prisma");

const cadastrar = async (req, res) => {
  const item = await prisma.roupas.create({ data: req.body });
  res.json(item);
};

const listar = async (req, res) => {
  const lista = await prisma.roupas.findMany();
  res.json(lista);
};

const buscar = async (req, res) => {
  const item = await prisma.roupas.findUnique({
    where: { id: Number(req.params.id) }
  });

  if (!item) return res.json({ erro: "Roupa não encontrada" });

  res.json(item);
};

const atualizar = async (req, res) => {
  const item = await prisma.roupas.findUnique({
    where: { id: Number(req.params.id) }
  });

  if (!item) return res.json({ erro: "Roupa não encontrada" });

  const atualizado = await prisma.roupas.update({
    where: { id: Number(req.params.id) },
    data: req.body
  });

  res.json(atualizado);
};

const excluir = async (req, res) => {
  const item = await prisma.roupas.findUnique({
    where: { id: Number(req.params.id) }
  });

  if (!item) return res.json({ erro: "Rouap não encontrada" });

  await prisma.roupas.delete({
    where: { id: Number(req.params.id) }
  });

  res.json({ mensagem: "Roupa excluída" });
};

module.exports = {
  cadastrar,
  listar,
  buscar,
  atualizar,
  excluir
};