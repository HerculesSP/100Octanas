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
    if (verificado == 0) {
        console.log("Usuário não verificado, redirecionando...");
        document.getElementById('popupEmail').style.display = 'flex';
    } else {
        document.getElementById('popupEmail').style.display = 'none';
    }
}
