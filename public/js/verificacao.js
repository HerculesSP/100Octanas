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
        document.getElementById('popupEmail').style.display = 'flex';
         fetch(`emails/confirmarConta?email=${email}&nome=${nome}`)
            .then(response => {
                if (response.ok) {
                    response.json().then(resposta => {
                    console.log(resposta)
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
