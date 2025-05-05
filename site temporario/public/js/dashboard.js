const ctx = document.getElementById('usuario-meses');

  new Chart(ctx, {
    type: 'bar',
    data: {
      labels: ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'],
      datasets: [{
        label: 'Matérias lidas por mês',
        data: [12, 19, 3, 5, 2, 3, 10, 15, 20, 25, 30, 35],
        borderWidth: 1
      }]
    },
    options: {
      scales: {
        y: {
          beginAtZero: true
        }
      }
    }
  });
  const ctx2 = document.getElementById('usuario-dias');

  new Chart(ctx2, {
    type: 'line',
    data: {
      labels: ['Domingo', 'Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado'],
      datasets: [{
        label: 'Matérias lidas por dia',
        data: [12, 19, 3, 5, 2, 3, 10],
        borderWidth: 1
      }]
    },
    options: {
      scales: {
        y: {
          beginAtZero: true
        }
      }
    }
  });
  const ctxDonut = document.getElementById('donut').getContext('2d');

    window.graficoDonutInstance = new Chart(ctxDonut, {
        type: 'doughnut',
        data: {
            labels: ['Tema 1', 'Tema 2', 'Tema 3'],
            datasets: [{
                data: [34, 33, 33],
                backgroundColor: ['rgb(6, 140, 173)', 'rgb(4, 92, 114)', 'rgb(4, 88, 109)'],
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: {
                    position: 'right'
                },
                title: {
                    
                }
            }
        }
    });



    function abrir() {
      document.getElementById('popupConfirm').style.display = 'flex';
    }
    function fechar() {
      document.getElementById('popupConfirm').style.display = 'none';
    }
    function confirmar() {
      fechar();
      alert('Apagado com sucesso!');
    }

