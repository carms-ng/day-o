import "bootstrap";
import "../components/buddy_challenge";


if (document.querySelector("meta[name='user-signed-in']").content === "true") {
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
            `);


            // const times = 10;
            // for(let i=0; i < times; i++){
            //   const notificationIcon = document.querySelectorAll(".notification-bounce");
            //   // const style = "animated bounce fast delay-2s";
            //   notificationIcon.classList.add("animated");
            //   notificationIcon.classList.add("bounce");
            // };
          }
        }

        lastNumberOfChallenges = data.count;
      })
  }, 1000);
}


import { initChart } from '../components/charts';
initChart();

import { loadActionDropdown } from '../components/dropdown';
loadActionDropdown();

import { loadConfetti } from '../components/confetti';
loadConfetti();

import { loadMassCreateModal } from '../components/mass-create-habit';
loadMassCreateModal();

