import "bootstrap";

import Chart from 'chart.js';

const ctx = document.getElementById('weekChart');
const ctxLifeChart = document.getElementById('lifeChart');


const data = JSON.parse(ctx.dataset.impact)

console.log(data)

// Week Chart
const xAxis = Object.keys(data);
const yAxis = Object.values(data);
console.log(xAxis);
console.log(yAxis);

const weekChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: xAxis,
        datasets: [{
            label: "",
            data: yAxis,
            backgroundColor: [
                '#7F915E',
            ],
            borderColor: [
                '#7F915E',
            ],
            borderWidth: 1
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

