import "bootstrap";

import Chart from 'chart.js';

const drawChart = (data) => {
  const xAxis = Object.keys(data);
  const yAxis = Object.values(data);

  new Chart(timeChart, {
    type: 'line',
    data: {
      labels: xAxis,
      datasets: [{
        label: "",
        data: yAxis,
        // backgroundColor: ['#7CB518'],
        borderColor: ['#7CB518'],
        borderWidth: 2
      }]
    },
    options: {
      legend: {
        display: false,
      },
      scales: {
        yAxes: [{
          ticks: {
            beginAtZero: true
          }
        }]
      }
    }
  });
}


const timeChart = document.getElementById('time-chart');
const ctxLifeChart = document.getElementById('lifeChart');

const weeklyData = JSON.parse(timeChart.dataset.weeklyImpact);
const monthlyData = JSON.parse(timeChart.dataset.monthlyImpact);
const allTimeData = JSON.parse(timeChart.dataset.allTimeImpact);


document.querySelector("#seven-days").addEventListener("click", () => {
  drawChart(weeklyData);
});

document.querySelector("#thirty-days").addEventListener("click", () => {
  drawChart(monthlyData);

});

document.querySelector("#all-time").addEventListener("click", () => {
  drawChart(allTimeData);

});

// initialally, start with week
drawChart(weeklyData);


// Life Chart

// For a pie chart

var dataLifeChart = {
    datasets: [{
        data: [10, 20, 30, 50, 60, 90],
        backgroundColor: [
            '#09A66D',
            '#FB7429',
            '#43CCE5',
            '#ECD0B4',
            '#94514C',
            '#B29DC8'
        ]
    }],

    // These labels appear in the legend and in the tooltips when hovering different arcs
    labels: [
        'Plastic',
        'Commute',
        'Food',
        'Energy',
        'Travel',
        'Diet'
    ]
};

var lifeChart = new Chart(ctxLifeChart, {
    type: 'pie',
    data: dataLifeChart,
    options: {
      legend: {
        labels: {
          usePointStyle: true,
        }
    },
  }

    //options: options
});

