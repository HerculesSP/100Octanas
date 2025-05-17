function emptyName(){
    let text = input_name.value;
    if(text == ""){
        input_name.style.border = "2px solid red";
        invalid_name.innerHTML = "<img src='../assets/icon/denied.png'> <span class='denied'> Nome Inválido! </span>";
        return false;
    } else{
        input_name.style.border = "2px solid green";
        invalid_name.innerHTML = "<img src='../assets/icon/accept.png'> <span class='accept'> Nome Ok! </span>";
        return true;
    }
}
function emptyLastname(){
    let text = input_lastname.value;
    if(text == ""){
        input_lastname.style.border = "2px solid red";
        invalid_lastname.innerHTML = "<img src='../assets/icon/denied.png'><span class='denied'> Sobrenome Inválido! </span>";
        return false;
    } else{
        input_lastname.style.border = "2px solid green";
        invalid_lastname.innerHTML = "<img src='../assets/icon/accept.png'> <span class='accept'> Sobrenome Ok! </span>";
        return true;
    }
}
function email(){
    let text = input_email.value;
    let haveAt = text.indexOf('@');
    if(haveAt == -1){
        input_email.style.border = "2px solid red";
        invalid_email.innerHTML = "<img src='../assets/icon/denied.png'> <span class='denied'> Email Inválido! </span>";
        return false;
    }else{
        input_email.style.border = "2px solid green";
        invalid_email.innerHTML = "<img src='../assets/icon/accept.png'> <span class='accept'> Email Ok! </span>";
        return true;
    }
}
function password(){
    var password= input_password.value;
    let passwordLength = password.length;
    let haveNumber = /\d/.test(password);
    let haveSpecial = /[!@#$%^&*(),.?":{}|<>]/.test(password);
    let haveLower = /[a-z]/.test(password);
    let haveUpper = /[A-Z]/.test(password);
    if(passwordLength < 8 || passwordLength > 20){
        input_password.style.border = "2px solid red";
        invalid_password.innerHTML = "<img src='../assets/icon/denied.png'> <span class='denied'> A senha deve ter entre 8 e 20 dígitos! </span>";
        return false;
    } else if(!haveNumber || !haveSpecial || !haveLower || !haveUpper){
        input_password.style.border = "2px solid red";
        invalid_password.innerHTML = "<img src='../assets/icon/denied.png'> <span class='denied'> A senha deve conter letras maiúsculas, minúsculas, números e caracteres especiais! </span>";
        return false;
    } else{
        input_password.style.border = "2px solid green";
        invalid_password.innerHTML = "<img src='../assets/icon/accept.png'> <span class='accept'> Senha Ok! </span>";
        return true;
    }
}
function confirmPassword(){
    let confirmPassword = input_confirm_password.value;
    if(confirmPassword != input_password.value ){
        input_confirm_password.style.border = "2px solid red";
        invalid_confirm_password.innerHTML = "<img src='../assets/icon/denied.png'> <span class='denied'> As senhas não conferem! </span>";
        return false;
    } else if(input_confirm_password.value == ""){
        input_confirm_password.style.border = "2px solid red";
        invalid_confirm_password.innerHTML = "<img src='../assets/icon/denied.png'> <span class='denied'> Esse campo não pode ficar vazio! </span>";
        return false;
    } else{
        input_confirm_password.style.border = "2px solid green";
        invalid_confirm_password.innerHTML = "<img src='../assets/icon/accept.png'> <span class='accept'> Senha Ok! </span>";
        return true;
    }
}
function checkAll(){
    let nameValid = emptyName();
    let lastnameValid = emptyLastname();
    let passwordValid = password();
    let emailValid = email();
    let confirmPasswordValid = confirmPassword();
    if(nameValid && lastnameValid && emailValid && passwordValid && confirmPasswordValid){
        credential_submit_button.disabled = false;
        credential_submit_button.style.cursor = "pointer";
        return true;
    }else{
        credential_submit_button.disabled = true;
        credential_submit_button.style.cursor = "not-allowed";
        return false;
    }
}
function checkAllLogin(){
    let emailValid = email();
    let passwordValid = password();
    if(emailValid && passwordValid){
        login_submit_button.disabled = false;
        login_submit_button.style.cursor = "pointer";
        return true;
    }else{
        login_submit_button.disabled = true;
        login_submit_button.style.cursor = "not-allowed";
        return false;
    }
}
function checkAllSubmit(){
    let validAll = checkAll();
    if (validAll) {
        window.location.href = "login.html";
        alert("Cadastro realizado com sucesso! Você será redirecionado para a página de login.");
        return true; 
    }
}
function checkAllLoginSubmit(){
    let emailValid = input_email.value;
    let passwordValid = input_password.value;
    let validAll = checkAllLogin();
        if (validAll && emailValid==arrayEmail[i] && passwordValid==arrayPassword[i]) {
            invalid_data.innerHTML ='';
            window.location.href = "dashboard.html";
            return true;
        } else if(validAll && emailValid==arrayEmail[i] && passwordValid!=arrayPassword[i]){
            invalid_data.innerHTML = "<img src='assets/icon/denied.png'> <span class='denied'> A senha inserida não confere! </span>";
            input_password.style.border = "2px solid red";
            input_password.value = "";
            invalid_password.innerHTML = "<img src='../assets/icon/denied.png'> <span class='denied'> Insira a senha novamente! </span>";
            return;

        } else {
            invalid_data.innerHTML = "<img src='../assets/icon/denied.png'> <span class='denied'> As credenciais inseridas não conferem! </span>";
            input_email.style.border = "2px solid red";
            input_email.value = "";
            invalid_email.innerHTML = "<img src='../assets/icon/denied.png'> <span class='denied'> Insira o email novamente! </span>";
            input_password.style.border = "2px solid red";
            input_password.value = "";
            invalid_password.innerHTML = "<img src='../assets/icon/denied.png'> <span class='denied'> Insira a senha novamente! </span>"; 
        }
}