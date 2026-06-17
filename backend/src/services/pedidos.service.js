const prisma = require("../data/prisma");

const pedidoDuplicado = async (clienteId, roupaId) => {
    const existente = await prisma.pedidos.findFirst({
        where: { clienteId, roupaId }
    });

    if (existente) {
        throw new Error("Pedido duplicado");
    }
};

const validarEstoque = async (roupaId, quantidade) => {
    const roupa = await prisma.roupas.findUnique({
        where: { id: roupaId }
    });

    if (!roupa) throw new Error("Roupa não encontrada");

    if (quantidade > roupa.quantidade) {
        throw new Error("Estoque insuficiente");
    }

    return roupa;
};

const calcularValor = (qtd, valor) => qtd * valor;

const podeExcluirPedido = async (id) => {
    const pedido = await prisma.pedidos.findUnique({
        where: { id }
    });

    if (!pedido) throw new Error("Pedido não encontrado");

    const agora = new Date();
    const data = new Date(pedido.id);

    const diff = (agora - data) / (1000 * 60 * 60);

    if (diff > 24) {
        throw new Error("Pedido não pode ser excluído após 24h");
    }
};

module.exports = {
    pedidoDuplicado,
    podeExcluirPedido,
    validarEstoque,
    calcularValor
};