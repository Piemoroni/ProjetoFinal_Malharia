const prisma = require("../data/prisma");

const cadastrar = async (req, res) => {
  const data = req.body;

  console.log(data);

  // if (data.senha !== data.confirmarSenha) {
  //   return res.json({ erro: "Senhas não coincidem" });
  // }

  // delete data.confirmarSenha;

  const item = await prisma.clientes.create({ data });
  res.json(item);
};

const listar = async (req, res) => {
  const lista = await prisma.clientes.findMany();

  if (lista.length === 0) {
    return res.json({ mensagem: "Nenhum cliente encontrado" });
  }

  res.json(lista);
};

const buscar = async (req, res) => {
  const item = await prisma.clientes.findUnique({
    where: { id: Number(req.params.id) }
  });

  if (!item) return res.json({ erro: "Cliente não encontrado" });

  res.json(item);
};

const atualizar = async (req, res) => {
  const item = await prisma.clientes.findUnique({
    where: { id: Number(req.params.id) }
  });

  if (!item) return res.json({ erro: "Cliente não encontrado" });

  const atualizado = await prisma.clientes.update({
    where: { id: Number(req.params.id) },
    data: req.body
  });

  res.json(atualizado);
};

const excluir = async (req, res) => {
  const item = await prisma.clientes.findUnique({
    where: { id: Number(req.params.id) }
  });

  if (!item) return res.json({ erro: "Cliente não encontrado" });

  await prisma.clientes.delete({
    where: { id: Number(req.params.id) }
  });

  res.json({ mensagem: "Cliente excluído" });
};

module.exports = {
  cadastrar,
  listar,
  buscar,
  atualizar,
  excluir
};