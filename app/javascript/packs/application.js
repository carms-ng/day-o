import "bootstrap";
import "../components/buddy_challenge";

import { initChart } from '../components/charts';
import { loadActionDropdown } from '../components/dropdown';
import { loadMassCreateModal } from '../components/mass-create-habit';
import { loadCarousel } from '../components/carousel';


initChart();
loadActionDropdown();
loadConfetti();
loadMassCreateModal();
loadCarousel();

// notification
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

            const notificationIcon = document.querySelector(".notification-bounce");
            notificationIcon.classList.add("animated", "bounce", "fast", "infinite");
          }
        }

        lastNumberOfChallenges = data.count;
      })
  }, 1000);
}

import { loadConfetti } from '../components/confetti';