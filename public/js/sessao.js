// sessão
function validarSessao() {
    let email = sessionStorage.EMAIL_USUARIO;
    let nome = sessionStorage.NOME_USUARIO;
    let icon = sessionStorage.FOTO;
    let cargo = sessionStorage.CARGO;

    let div_usuario = document.getElementById('div_usuario');
    let menubar = document.getElementById('menu');

    if (email != null && nome != null && cargo=='Leitor') {
        div_usuario.innerHTML=''
        menubar.innerHTML += `
        <li>
                    <div class="nav-user">
                        <img src="res/icon/${icon}" alt="Avatar do usuário" class="user-avatar">
                        <span class="user-name" id="b_usuario">${nome}</span>
                    </div>
                    <ul class="nav-dropdown">
                        <li>
                            <a onclick=" limparSessao()">Sair</a>
                        </li>
                        <li>
                            <a onclick=" apagarConta()">Apagar conta</a>
                        </li>
                    </ul>
                </li>`;
            
    } else if (email != null && nome != null && cargo=='Jornalista') {
        div_usuario.innerHTML=''
        menubar.innerHTML += `
                <li>
                    <a href="#">Gerenciamento</a>
                    <ul class="nav-dropdown">
                        <li>
                            <a href="dashboard/dashboard-materias.html">Dashboard Matérias</a>
                        </li>
                        <li>
                            <a href="painel.html">Painel</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <div class="nav-user">
                        <img src="res/icon/${icon}" alt="Avatar do usuário" class="user-avatar">
                        <span class="user-name" id="b_usuario">${nome}</span>
                    </div>
                    <ul class="nav-dropdown">
                        <li>
                            <a onclick=" limparSessao()">Sair</a>
                        </li>
                        <li>
                            <a onclick=" apagarConta()">Apagar conta</a>
                        </li>
                    </ul>
                </li>
            `;
    }
    else if (email != null && nome != null && cargo=='Redator'){
        div_usuario.innerHTML=''
        menubar.innerHTML += `
                <li>
                    <a href="#">Gerenciamento</a>
                    <ul class="nav-dropdown">
                        <li>
                            <a href="dashboard/dashboard-usuarios.html">Dashboard Usuários</a>
                        </li>
                        <li>
                            <a href="dashboard/dashboard-materias.html">Dashboard Matérias</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <div class="nav-user">
                        <img src="res/icon/${icon}" alt="Avatar do usuário" class="user-avatar">
                        <span class="user-name" id="b_usuario">${nome}</span>
                    </div>
                    <ul class="nav-dropdown">
                        <li>
                            <a onclick=" limparSessao()">Sair</a>
                        </li>
                        <li>
                            <a onclick=" apagarConta()">Apagar conta</a>
                        </li>
                    </ul>
                </li>
            `;
    } else {
        window.location = "../login.html";
    }
}
function validarSessaoMateria() {
    let email = sessionStorage.EMAIL_USUARIO;
    let nome = sessionStorage.NOME_USUARIO;
    let icon = sessionStorage.FOTO;
    let cargo = sessionStorage.CARGO;

    let div_usuario = document.getElementById('div_usuario');
    let menubar = document.getElementById('menu');

    if (email != null && nome != null && cargo=='Leitor') {
         div_usuario.innerHTML=''
        menubar.innerHTML += `
        <li>
                    <div class="nav-user">
                        <img src="res/icon/${icon}" alt="Avatar do usuário" class="user-avatar">
                        <span class="user-name" id="b_usuario">${nome}</span>
                    </div>
                    <ul class="nav-dropdown">
                        <li>
                            <a onclick=" limparSessao()">Sair</a>
                        </li>
                        <li>
                            <a onclick=" apagarConta()">Apagar conta</a>
                        </li>
                    </ul>
                </li>`;
            
    } else if (email != null && nome != null && cargo=='Jornalista') {
        div_usuario.innerHTML=''
        menubar.innerHTML += `
                <li>
                    <a href="#">Gerenciamento</a>
                    <ul class="nav-dropdown">
                        <li>
                            <a href="./../../dashboard/dashboard-materias.html">Dashboard Matérias</a>
                        </li>
                        <li>
                            <a href="./../../painel.html">Painel</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <div class="nav-user">
                        <img src="./../icon/${icon}" alt="Avatar do usuário" class="user-avatar">
                        <span class="user-name" id="b_usuario">${nome}</span>
                    </div>
                    <ul class="nav-dropdown">
                        <li>
                            <a onclick=" limparSessao()">Sair</a>
                        </li>
                        <li>
                            <a onclick=" apagarConta()">Apagar conta</a>
                        </li>
                    </ul>
                </li>
            `;
    }
    else if (email != null && nome != null && cargo=='Redator'){
        div_usuario.innerHTML=''
        menubar.innerHTML += `
                <li>
                    <a href="#">Gerenciamento</a>
                    <ul class="nav-dropdown">
                        <li>
                            <a href="./../..dashboard/dashboard-usuarios.html">Dashboard Usuários</a>
                        </li>
                        <li>
                            <a href="./../..dashboard/dashboard-materias.html">Dashboard Matérias</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <div class="nav-user">
                        <img src="./../icon/${icon}" alt="Avatar do usuário" class="user-avatar">
                        <span class="user-name" id="b_usuario">${nome}</span>
                    </div>
                    <ul class="nav-dropdown">
                        <li>
                            <a onclick=" limparSessao()">Sair</a>
                        </li>
                        <li>
                            <a onclick=" apagarConta()">Apagar conta</a>
                        </li>
                    </ul>
                </li>
            `;
    } else {
        window.location = "../login.html";
    }
}
function validarSessaoDash() {
    let email = sessionStorage.EMAIL_USUARIO;
    let nome = sessionStorage.NOME_USUARIO;
    let icon = sessionStorage.FOTO;
    let cargo = sessionStorage.CARGO;

    let div_usuario = document.getElementById('div_usuario');
    let menubar = document.getElementById('menu');

    if (email != null && nome != null && cargo=='Leitor') {
        div_usuario.innerHTML = div_usuario.innerHTML=''
        menubar.innerHTML += `
        <li>
                    <div class="nav-user">
                        <img src="res/icon/${icon}" alt="Avatar do usuário" class="user-avatar">
                        <span class="user-name" id="b_usuario">${nome}</span>
                    </div>
                    <ul class="nav-dropdown">
                        <li>
                            <a onclick=" limparSessao()">Sair</a>
                        </li>
                        <li>
                            <a onclick=" apagarConta()">Apagar conta</a>
                        </li>
                    </ul>
                </li>`;
            
    } else if (email != null && nome != null && cargo=='Jornalista') {
        div_usuario.innerHTML=''
        menubar.innerHTML += `
                <li>
                    <a href="#">Gerenciamento</a>
                    <ul class="nav-dropdown">
                        <li>
                            <a href="dashboard/dashboard-materias.html">Dashboard Matérias</a>
                        </li>
                        <li>
                            <a href="painel.html">Painel</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <div class="nav-user">
                        <img src="res/icon/${icon}" alt="Avatar do usuário" class="user-avatar">
                        <span class="user-name" id="b_usuario">${nome}</span>
                    </div>
                    <ul class="nav-dropdown">
                        <li>
                            <a onclick=" limparSessao()">Sair</a>
                        </li>
                        <li>
                            <a onclick=" apagarConta()">Apagar conta</a>
                        </li>
                    </ul>
                </li>
            `;
    }
    else if (email != null && nome != null && cargo=='Redator'){
        div_usuario.innerHTML=''
        menubar.innerHTML += `
                <li>
                    <a href="#">Gerenciamento</a>
                    <ul class="nav-dropdown">
                        <li>
                            <a href="dashboard/dashboard-usuarios.html">Dashboard Usuários</a>
                        </li>
                        <li>
                            <a href="dashboard/dashboard-materias.html">Dashboard Matérias</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <div class="nav-user">
                        <img src="res/icon/${icon}" alt="Avatar do usuário" class="user-avatar">
                        <span class="user-name" id="b_usuario">${nome}</span>
                    </div>
                    <ul class="nav-dropdown">
                        <li>
                            <a onclick=" limparSessao()">Sair</a>
                        </li>
                        <li>
                            <a onclick=" apagarConta()">Apagar conta</a>
                        </li>
                    </ul>
                </li>
            `;
    } else {
        window.location = "../login.html";
    }
}
function validarSessaoAoContrario() {
    let email = sessionStorage.EMAIL_USUARIO;
    let nome = sessionStorage.NOME_USUARIO;

    if (email != null && nome != null) {
        window.location = "../index.html";
    } 
}

function validarSessaoIndex() {
    let email = sessionStorage.EMAIL_USUARIO;
    let nome = sessionStorage.NOME_USUARIO;
    let icon = sessionStorage.FOTO;
    let cargo = sessionStorage.CARGO;

    let div_usuario = document.getElementById('div_usuario');
    let menubar = document.getElementById('menu');

    if (email != null && nome != null && cargo=='Leitor') {
        div_usuario.innerHTML =  div_usuario.innerHTML=''
        menubar.innerHTML += `
        <li>
                    <div class="nav-user">
                        <img src="res/icon/${icon}" alt="Avatar do usuário" class="user-avatar">
                        <span class="user-name" id="b_usuario">${nome}</span>
                    </div>
                    <ul class="nav-dropdown">
                        <li>
                            <a onclick=" limparSessao()">Sair</a>
                        </li>
                        <li>
                            <a onclick=" apagarConta()">Apagar conta</a>
                        </li>
                    </ul>
                </li>`;
            
    } else if (email != null && nome != null && cargo=='Jornalista') {
        div_usuario.innerHTML=''
        menubar.innerHTML += `
                <li>
                    <a href="#">Gerenciamento</a>
                    <ul class="nav-dropdown">
                        <li>
                            <a href="dashboard/dashboard-materias.html">Dashboard Matérias</a>
                        </li>
                        <li>
                            <a href="painel.html">Painel</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <div class="nav-user">
                        <img src="res/icon/${icon}" alt="Avatar do usuário" class="user-avatar">
                        <span class="user-name" id="b_usuario">${nome}</span>
                    </div>
                    <ul class="nav-dropdown">
                        <li>
                            <a onclick=" limparSessao()">Sair</a>
                        </li>
                        <li>
                            <a onclick=" apagarConta()">Apagar conta</a>
                        </li>
                    </ul>
                </li>
            `;
    }
    else if (email != null && nome != null && cargo=='Redator'){
        div_usuario.innerHTML=''
        menubar.innerHTML += `
                <li>
                    <a href="#">Gerenciamento</a>
                    <ul class="nav-dropdown">
                        <li>
                            <a href="dashboard/dashboard-usuarios.html">Dashboard Usuários</a>
                        </li>
                        <li>
                            <a href="dashboard/dashboard-materias.html">Dashboard Matérias</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <div class="nav-user">
                        <img src="res/icon/${icon}" alt="Avatar do usuário" class="user-avatar">
                        <span class="user-name" id="b_usuario">${nome}</span>
                    </div>
                    <ul class="nav-dropdown">
                        <li>
                            <a onclick=" limparSessao()">Sair</a>
                        </li>
                        <li>
                            <a onclick=" apagarConta()">Apagar conta</a>
                        </li>
                    </ul>
                </li>
            `;
    } else {
        div_usuario.innerHTML=''
        menubar.innerHTML += `
                <li>
                    <div class="nav-user">
                        <img src="res/icon/default-icon.png" alt="Avatar do usuário" class="user-avatar">
                        <span class="user-name" id="b_usuario">Olá visitante!</span>
                    </div>
                    <ul class="nav-dropdown">
                        <li>
                            <a href='cadastro.html'>Cadastre-se</a>
                        </li>
                        <li>
                            <a href= 'login.html'>Entrar</a>
                        </li>
                    </ul>
                </li>
            `;
    }
}
function validarSessaoPainel() {
    let cargo = sessionStorage.CARGO;
    if (cargo != 'Jornalista') {
        window.location = "../index.html";
    } 
}
function validarSessaoDashUsuario() {
    let cargo = sessionStorage.CARGO;
    if (cargo != 'Redator') {
        window.location = "../index.html";
    } 
}
function validarSessaoDashMateria() {
    let cargo = sessionStorage.CARGO;
    if (cargo != 'Redator' || cargo != 'Jornalista') {
        window.location = "../index.html";
    } 
}
function limparSessao() {
    sessionStorage.clear();
    window.location = "../login.html";
}
function apagarConta(){
    document.getElementById('popupConfirm').style.display = 'flex';
}

function fechar() {
    document.getElementById('popupConfirm').style.display = 'none';
}
function confirmar() {
  fechar();
   const dados = {
        idUsuario: sessionStorage.ID_USUARIO
    };
  fetch("/usuarios/apagarUsuario", {
      method: "POST",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify(dados)
    })
      .then(function (resposta) {
        console.log("resposta: ", resposta);
        if (resposta.ok) {
          console.log(
            "Usuário apagado com sucesso!");
             sessionStorage.clear();
             window.location.reload();
        } else {
          throw "Houve um erro ao apagar o usuário!";
        }
      })
      .catch(function (resposta) {
        console.log(`#ERRO: ${resposta}`);
      });
}



