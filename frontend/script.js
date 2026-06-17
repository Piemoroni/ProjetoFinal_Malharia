const url = "http://localhost:3000";

document.addEventListener("DOMContentLoaded", () => {
    carregarDashboard();
});

function carregarDashboard() {
    const container = document.querySelector("#conteudo");

    Promise.all([
        fetch(url + "/clientes/listar").then(r => r.json()),
        fetch(url + "/roupas/listar").then(r => r.json()),
        fetch(url + "/pedidos/listar").then(r => r.json()),
        fetch(url + "/encomendas/listar").then(r => r.json())
    ])
    .then(([clientes, roupas, pedidos, encomendas]) => {

        container.innerHTML = `
            <div class="dashboard">

                <div class="card">
                    <h3>Clientes</h3>
                    <p>${clientes.length}</p>
                </div>

                <div class="card">
                    <h3>Roupas</h3>
                    <p>${roupas.length}</p>
                </div>

                <div class="card">
                    <h3>Pedidos</h3>
                    <p>${pedidos.length}</p>
                </div>

                <div class="card">
                    <h3>Encomendas</h3>
                    <p>${encomendas.length}</p>
                </div>

            </div>

            <canvas id="grafico"></canvas>
        `;

        const ctx = document.getElementById("grafico");

        new Chart(ctx, {
            type: "bar",
            data: {
                labels: ["Clientes", "Roupas", "Pedidos", "Encomendas"],
                datasets: [{
                    label: "Total",
                    data: [
                        clientes.length,
                        roupas.length,
                        pedidos.length,
                        encomendas.length
                    ],
                    backgroundColor: [
                        "#2563eb",
                        "#1e3a8a",
                        "#60a5fa",
                        "#3b82f6"
                    ]
                }]
            }
        });

    })
    .catch(() => alert("Erro ao carregar dashboard"));
}

function carregarClientes() {
    fetch(url + "/clientes/listar")
        .then(res => res.json())
        .then(data => {

            const container = document.querySelector("#conteudo");
            container.innerHTML = "";

            data.forEach(c => {
                const card = document.createElement("div");
                card.classList.add("card");

                card.innerHTML = `
                    <h3>${c.nome}</h3>
                    <p>${c.email}</p>
                    <p>${c.telefone}</p>
                    <p>${c.endereco}</p>

                    <button onclick="editarCliente(${c.id})">Editar</button>
                    <button onclick="excluirCliente(${c.id})">Excluir</button>
                `;

                container.appendChild(card);
            });
        });
}

document.querySelector("#formCliente").addEventListener("submit", function (e) {
    e.preventDefault();

    const novo = {
        nome: nome.value,
        email: email.value,
        telefone: telefone.value,
        endereco: endereco.value
    };

    fetch(url + "/clientes/cadastrar", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(novo)
    })
    .then(() => {
        alert("Cliente cadastrado!");
        formCliente.reset();
        modalCliente.classList.add("oculto");
        carregarDashboard();
    })
    .catch(() => alert("Erro ao cadastrar cliente"));
});

function excluirCliente(id) {
    if (!confirm("Deseja excluir este cliente?")) return;

    fetch(url + "/clientes/excluir/" + id, {
        method: "DELETE"
    })
    .then(() => {
        alert("Cliente excluído!");
        carregarClientes();
        carregarDashboard();
    })
    .catch(() => alert("Erro ao excluir cliente"));
}

function editarCliente(id) {

    fetch(url + "/clientes/buscar/" + id)
        .then(res => res.json())
        .then(c => {

            nome.value = c.nome;
            email.value = c.email;
            telefone.value = c.telefone;
            endereco.value = c.endereco;

            modalCliente.classList.remove("oculto");

            formCliente.onsubmit = function (e) {
                e.preventDefault();

                fetch(url + "/clientes/atualizar/" + id, {
                    method: "PUT",
                    headers: { "Content-Type": "application/json" },
                    body: JSON.stringify({
                        nome: nome.value,
                        email: email.value,
                        telefone: telefone.value,
                        endereco: endereco.value
                    })
                })
                .then(() => {
                    alert("Cliente atualizado!");
                    modalCliente.classList.add("oculto");
                    formCliente.reset();
                    formCliente.onsubmit = originalSubmit;
                    carregarClientes();
                    carregarDashboard();
                });
            };
        });
}

const originalSubmit = document.querySelector("#formCliente").onsubmit;

function carregarRoupas() {
    fetch(url + "/roupas/listar")
        .then(res => res.json())
        .then(data => {

            const container = document.querySelector("#conteudo");
            container.innerHTML = "";

            data.forEach(r => {
                const card = document.createElement("div");
                card.classList.add("card");

                card.innerHTML = `
                    <h3>${r.nome}</h3>
                    <p>${r.descricao}</p>
                    <p>R$ ${r.valor}</p>
                    <p>Qtd: ${r.quantidade}</p>
                `;

                container.appendChild(card);
            });
        });
}

function carregarPedidos() {
    fetch(url + "/pedidos/listar")
        .then(res => res.json())
        .then(data => {

            const container = document.querySelector("#conteudo");
            container.innerHTML = "";

            data.forEach(p => {
                const card = document.createElement("div");
                card.classList.add("card");

                card.innerHTML = `
                    <h3>Pedido #${p.id}</h3>
                    <p>Cliente: ${p.cliente?.nome}</p>
                    <p>Roupa: ${p.roupa?.nome}</p>
                    <p>Qtd: ${p.quantidade}</p>
                    <p>Total: R$ ${p.valor_final}</p>
                `;

                container.appendChild(card);
            });
        });
}

function carregarEncomendas() {
    fetch(url + "/encomendas/listar")
        .then(res => res.json())
        .then(data => {

            const container = document.querySelector("#conteudo");
            container.innerHTML = "";

            data.forEach(e => {
                const card = document.createElement("div");
                card.classList.add("card");

                card.innerHTML = `
                    <h3>Encomenda #${e.id}</h3>
                    <p>Cliente: ${e.cliente?.nome}</p>
                    <p>Roupa: ${e.roupa?.nome}</p>
                    <p>${e.descricao_personalizada}</p>
                    <p>Qtd: ${e.quantidade}</p>
                    <p>Valor: R$ ${e.valor}</p>
                `;

                container.appendChild(card);
            });
        });
}

function abrirModalCliente() {
    modalCliente.classList.remove("oculto");
}