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
        const html = `
           <!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Confirmação de Email</title>
  <style>
    body, html { 
        margin:0; 
        padding:0; 
        background:#ffffff;  
    }
    .email-container { 
        width:600px; 
        margin:0 auto; 
        background:#ffffff; 
    }
    .header { 
        background:rgb(212, 0, 0); 
        color:#ffffff; 
        padding:25px 40px; 
        text-align:center; 
    }
    .content { 
        background:#f3f3f3 center; 
        padding:40px 16px; 
    }
    .card { 
        background:#ffffff; 
        border-radius:8px; 
        overflow:hidden; 
        width:100%; 
    }
    .card-header { 
        background:rgb(212, 0, 0); 
        padding:32px 0 10px 0; 
        text-align:center; 
    }
    .card-body { 
        padding:32px; 
        background:#ffffff; 
    }
    .code { 
        background:#f7f7f7; 
        border-radius:12px; 
        padding:20px 24px; 
        margin-bottom:40px; 
        text-align:center; 
    }
    .footer { 
        background:rgb(212, 0, 0); 
        color:#ffffff; 
        padding:48px; 
        text-align:center; 
    }
    .footer-text { 
        font-size:12px; 
        line-height:140%; 
        color:#ffffff; 
    }
  </style>
  <link href="https://fonts.googleapis.com/css?family=DM+Sans:ital,wght@0,400;0,400;0,600;0,700;0,800" rel="stylesheet">
</head>
<body>
  <div class="email-container">
    <div class="header">
      <h1 style="font-size:32px; font-weight:700; margin:0;">100 Octanas</h1>
    </div>
    <div class="content">
      <div class="card">
        <div class="card-header">
          <h2 style="font-size:44px; font-weight:700; margin:0; color:#ffffff;">Verifique o seu email</h2>
        </div>
        <div class="card-body">
          <p style="font-size:20px; line-height:30px; color:#767676; margin:0 0 20px 0;">
            Olá ${nome},<br>
            O seu código de verificação é:
          </p>
          <div class="code">
            <span style="font-size:40px; font-weight:800; color:#141414; letter-spacing:15px;">${codigo}</span>
          </div>
          <p style="font-size:20px; line-height:30px; color:#767676; margin:0 0 20px 0;">
            Esse código é válido somente enquanto a página de verificação estiver carregada.<br><br>
            Para a sua segurança, nunca compartilhe esse código com outras pessoas. Se você não solicitou isso, entre em contato com o suporte imediatamente.
          </p>
        </div>
      </div>
    </div>
    <div class="footer">
      <p class="footer-text" style="margin:0 0 32px 0; padding:0;">
        100 Octanas é um projeto de Pesquisa e Inovação do curso de Bacharelado em Ciência da Computação da São Paulo Tech School desenvolvido por Hércules da Silva Pereira.
      </p>
  </div>
</body>
</html>
        `;
        const info = transporter.sendMail({
            from: `"100 Octanas | Confirmação de conta" <100OctanasHSP@gmail.com>`, 
            to: `${email}`, 
            subject: "Confirmação de conta", 
            text: `Olá ${nome}, seu código de verificação é: ${codigo}`, 
            html: html
        });
        console.log("Message sent: %s", info.messageId);
        res.send(codigo.toString());
    } catch (error) {
        console.error("Erro ao enviar o email:", error);
        res.status(500).send("Erro ao enviar o email.");
    }
}

function registrarVerificacao (req, res) {
  const idUsuario = req.body.idUsuario;
  usuarioModel.registrarVerificacao(idUsuario)
    .then(function (resultado) {
        res.json(resultado);
    })
    .catch(function (erro) {
        console.log(erro);
        res.status(500).json(erro.sqlMessage);
    });

};

function redefinirSenha(req, res) {
    let email = req.query.email;
    let nome = req.query.nome;
    let codigo = Math.floor(Math.random() * 1000000);
     try {
        const htmlContent = `
           
        `;
        const info = transporter.sendMail({
            from: `"100 Octanas | Confirmação de conta" <100OctanasHSP@gmail.com>`, 
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
    confirmarConta,
    registrarVerificacao,
    redefinirSenha
}