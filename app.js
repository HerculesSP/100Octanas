// var ambiente_processo = 'producao';
var ambiente_processo = 'desenvolvimento';

var caminho_env = ambiente_processo === 'producao' ? '.env' : '.env.dev';
// Acima, temos o uso do operador ternário para definir o caminho do arquivo .env
// A sintaxe do operador ternário é: condição ? valor_se_verdadeiro : valor_se_falso

require("dotenv").config({ path: caminho_env });

var express = require("express");
var cors = require("cors");
var path = require("path");
var PORTA_APP = process.env.APP_PORT;
var HOST_APP = process.env.APP_HOST;

var app = express();

var indexRouter = require("./src/routes/index");
var usuarioRouter = require("./src/routes/usuarios");
var materiaRouter = require('./src/routes/materias');
var categoriaRouter = require('./src/routes/categorias');
var emailsRouter = require('./src/routes/emails');

app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(express.static(path.join(__dirname, "public")));
app.use(express.json({ limit: '50mb' }));
app.use(express.urlencoded({ limit: '50mb', extended: true }));
app.use(cors());

app.use('/materias', materiaRouter);
app.use("/", indexRouter);
app.use("/usuarios", usuarioRouter);
app.use("/categorias", categoriaRouter);
app.use("/emails", emailsRouter);

app.listen(PORTA_APP, function () {
    console.log(`
    Bem vindo ao Site
 __   ___    ___       ____         _
/_ | / _ \\  / _ \\     / __ \\       | |
 | || | | || | | |   | |  | |  ___ | |_   __ _  _ __    __ _  ___
 | || | | || | | |   | |  | | / __|| __| / _\` || '_ \\  / _\` |/ __|
 | || |_| || |_| |   | |__| || (__ | |_ | (_| || | | || (_| |\\__ \\
 |_| \\___/  \\___/     \\____/  \\___| \\__| \\__,_||_| |_| \\__,_||___/
    \n\n                                                                                                
    O jornal está hospedado no servidor local e pode ser acessado em: http://${HOST_APP}:${PORTA_APP}. \n
    Estamos no ambiente de: ${process.env.AMBIENTE_PROCESSO}. \n
    `);
});

    