const prisma = require("../data/prisma");

const encomendaDuplicada = async (clienteId, roupaId, descricao) => {
    const existente = await prisma.encomendas.findFirst({
        where: {
            clienteId,
            roupaId,
            descricao_personalizada: descricao
        }
    });

    if (existente) {
        throw new Error("Encomenda duplicada");
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

const podeExcluirEncomenda = async (id) => {
    const encomenda = await prisma.encomendas.findUnique({
        where: { id }
    });

    if (!encomenda) throw new Error("Encomenda não encontrada");

    const agora = new Date();
    const data = new Date(encomenda.createdAt); 

    const diff = (agora - data) / (1000 * 60 * 60);

    if (diff > 24) {
        throw new Error("Encomenda não pode ser excluída após 24h");
    }
};

module.exports = {
    encomendaDuplicada,
    podeExcluirEncomenda,
    validarEstoque,
    calcularValor
};