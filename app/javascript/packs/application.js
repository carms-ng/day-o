import "bootstrap";
import "../components/buddy_challenge";

let lastNumberOfChallenges;

setInterval(() => {
  fetch("/notifications", { method: "GET" })
    .then(response => response.json())
    .then((data) => {
      if (lastNumberOfChallenges < data.count) {
        new Audio("notification.mp3").play();
      }


      if (data.count > 0) {
        const existingBadge = document.querySelector(".buddy-notification-badge");

        if (existingBadge) {
          existingBadge.innerText = data.count
        } else {
          const badgeContainer = document.querySelector("a[href='/buddy_challenges']");

          badgeContainer.insertAdjacentHTML("afterbegin", `
            <span class="buddy-notification-badge">${data.count}</span>
          `)

        }
      }

      lastNumberOfChallenges = data.count;
    })
}, 1000);


import { initChart } from '../components/charts';
initChart();

import { loadActionDropdown } from '../components/dropdown';
loadActionDropdown();

import { loadConfetti } from '../components/confetti';
loadConfetti();

import { loadMassCreateModal } from '../components/mass-create-habit';
loadMassCreateModal();

