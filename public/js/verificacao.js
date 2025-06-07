var codigo = 0;
function verificado() {
    let verificado = sessionStorage.VERIFICADO;
    if (verificado == 0) {
        window.location = "../index.html";
    }
}

function verificadoDashMaterias() {
    let verificado = sessionStorage.VERIFICADO;
    if (verificado == 0) {
       window.location = "/.../../index.html";
    }
    
}
function verificadoIndex() {
    let verificado = sessionStorage.VERIFICADO;
    let email = sessionStorage.EMAIL_USUARIO;
    let nome = sessionStorage.NOME_USUARIO;
    if (verificado == 0) {
        console.log('chamou')
        document.getElementById('popupEmail').style.display = 'flex';
         fetch(`emails/confirmarConta?email=${email}&nome=${nome}`)
            .then(response => {
                if (response.ok) {
                    response.json().then(resposta => {
                    codigo = resposta;
                    });
                } 
            })
            .catch(error => {
                console.error(`Erro no envio do email: ${error.message}`);
        });
    } else {
        document.getElementById('popupEmail').style.display = 'none';
    }
}
function confirmarCodigo(codigoDigitado) {
    if (codigoDigitado == codigo) {
        sessionStorage.VERIFICADO = 1;
        document.getElementById('popupEmail').style.display = 'none';
        const dados = {
        idUsuario: sessionStorage.ID_USUARIO
        };
        fetch("/emails/registrarVerificacao", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(dados)
        })
        .then(function (resposta) {
            console.log("resposta: ", resposta);
            if (resposta.ok) {
                window.location = `index.html`;
            } else {
                throw "Houve um erro ao salvar as matérias no banco!";
            }
        })
            window.location = "../index.html";
    } else {
        alert("Código incorreto. Tente novamente.");
    }
}
