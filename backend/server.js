require("dotenv").config();
const express = require("express");
const cors = require("cors");

const app = express();
app.use(express.json());
app.use(cors());

const clientesRoutes = require("./src/routes/clientes.routes");
const roupasRoutes = require("./src/routes/roupas.routes");
const encomendasRoutes = require("./src/routes/encomendas.routes");
const pedidosRoutes = require("./src/routes/pedidos.routes");

app.use("/clientes", clientesRoutes);
app.use("/roupas", roupasRoutes);
app.use("/encomendas", encomendasRoutes);
app.use("/pedidos", pedidosRoutes);

const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
  console.log(`Servidor rodando na porta ${PORT}`);
});
