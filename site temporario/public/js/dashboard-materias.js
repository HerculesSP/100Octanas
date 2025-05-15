const materiaMensal = document.getElementById('materia-meses');

  new Chart(materiaMensal, {
    type: 'bar',
    data: {
      labels: ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'],
      datasets: [{
        label: 'Acessos por mês',
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
  const materiaSemanal = document.getElementById('materia-dias');

  new Chart(materiaSemanal, {
    type: 'line',
    data: {
      labels: ['Domingo', 'Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado'],
      datasets: [{
        label: 'Acessos por dia',
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
  const materiaDonut = document.getElementById('materia-donut').getContext('2d');

    window.graficoDonutInstance = new Chart(materiaDonut, {
        type: 'doughnut',
        data: {
            labels: ['18 a 29 anos', '30 a 49 anos', '50 a 64 anos', '65 anos ou mais'],
            datasets: [{
                data: [20, 20, 20, 20],
                backgroundColor: ['rgb(6, 140, 173)', 'rgb(4, 92, 114)', 'rgb(4, 88, 109)', 'rgb(4, 88, 97)'],
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