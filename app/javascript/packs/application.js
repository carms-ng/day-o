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
            label: 'Weekly Impact',
            data: yAxis,
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)',
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)',
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
            ],
            borderWidth: 1
        }]
    },
    options: {
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
        data: [10, 20, 30],
        backgroundColor: [
            'red',
            '#3F4C29',
            'blue'
        ]
    }],

    // These labels appear in the legend and in the tooltips when hovering different arcs
    labels: [
        'Plastic',
        'Commute',
        'Food'
    ]
};

var lifeChart = new Chart(ctxLifeChart, {
    type: 'pie',
    data: dataLifeChart
    //options: options
});

