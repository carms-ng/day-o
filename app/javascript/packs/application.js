import "bootstrap";
import "../components/buddy_challenge";


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
const ctxLifeChart = document.getElementById('lifeChart');

const categoryData = JSON.parse(ctxLifeChart.dataset.categoryImpact);

const plastic = categoryData['Plastic']
const commute = categoryData['Commute']
const waste = categoryData['Waste']
const energy = categoryData['Energy']
const travel = categoryData['Travel']
const diet = categoryData['Diet']

// For a pie chart

var dataLifeChart = {
    datasets: [{
        data: [plastic, commute, waste, energy, travel, diet],
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
        'Waste',
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

