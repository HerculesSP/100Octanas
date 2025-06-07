var ambiente_processo = 'desenvolvimento';

var caminho_env = ambiente_processo === 'producao' ? '../.env' : '../.env.dev';
require("dotenv").config({ path: caminho_env });
const nodemailer = require('nodemailer')
var usuarioModel = require("../models/usuarioModel");

let transporter = nodemailer.createTransport({
    host: 'smtp.gmail.com',
    port: 465,
    secure: true, 
    auth: {
        user: "100OctanasHSP@gmail.com",
        pass: process.env.EMAIL_TOKEN
      },
    });

function confirmarConta(req, res) {
    let email = req.query.email;
    let nome = req.query.nome;
    let codigo = Math.floor(Math.random() * 1000000);
     try {
        const htmlContent = `
           
        `;
        const info = transporter.sendMail({
            from: `"100 Octanas | Confirmação de conta" ${email}`, 
            to: `${email}`, 
            subject: "Confirmação de conta", 
            text: `Olá ${nome}, seu código de verificação é: ${codigo}`, 
            html: htmlContent
        });
        console.log("Message sent: %s", info.messageId);
        res.send(codigo.toString());
    } catch (error) {
        console.error("Erro ao enviar o email:", error);
        res.status(500).send("Erro ao enviar o email.");
    }
}

module.exports = {
    confirmarConta
}