import "bootstrap";

import Chart from 'chart.js';

import { loadActionDropdown } from '../components/dropdown';
loadActionDropdown();


//// chart (small)
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

//// Chart (modal)
const drawChartModal = (data) => {
  const xAxis = Object.keys(data);
  const yAxis = Object.values(data);

  new Chart(timeChartModal, {
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

const timeChartModal = document.getElementById('time-chart-modal');

const weeklyDataModal = JSON.parse(timeChartModal.dataset.weeklyImpact);
const monthlyDataModal = JSON.parse(timeChartModal.dataset.monthlyImpact);
const allTimeDataModal = JSON.parse(timeChartModal.dataset.allTimeImpact);


document.querySelector("#seven-days-modal").addEventListener("click", () => {
  drawChartModal(weeklyDataModal);
});

document.querySelector("#thirty-days-modal").addEventListener("click", () => {
  drawChartModal(monthlyDataModal);

});

document.querySelector("#all-time-modal").addEventListener("click", () => {
  drawChartModal(allTimeDataModal);

});

drawChartModal(weeklyDataModal);


//// Life Chart (small)
const ctxLifeChart = document.getElementById('lifeChart');

const categoryData = JSON.parse(ctxLifeChart.dataset.categoryImpact);

const plastic = categoryData['Plastic'] || 100;
const commute = categoryData['Commute'] || 100;
const waste = categoryData['Waste'] || 100;
const energy = categoryData['Energy'] || 100;
const travel = categoryData['Travel'] || 100;
const diet = categoryData['Diet'] || 100;

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
          padding: 15,
        }
    },
  }

    //options: options
});

//// Life chart (modal)
const ctxLifeChartModal = document.getElementById('life-chart-modal');

const categoryDataModal = JSON.parse(ctxLifeChartModal.dataset.categoryImpact);

const plasticDataModal = categoryDataModal['Plastic']
const commuteDataModal = categoryDataModal['Commute']
const wasteDataModal = categoryDataModal['Waste']
const energyDataModal = categoryDataModal['Energy']
const travelDataModal = categoryDataModal['Travel']
const dietDataModal = categoryDataModal['Diet']


var lifeChartModal = new Chart(ctxLifeChartModal, {
    type: 'pie',
    data: dataLifeChart,
    options: {
      legend: {
        labels: {
          usePointStyle: true,
          padding: 15,
        }
    },
  }

    //options: options
});
