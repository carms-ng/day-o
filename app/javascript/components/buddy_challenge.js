setTimeout(() => {
  const modalChallenges = document.querySelectorAll(".modal-challenge")
  const modalBuddies = document.querySelectorAll(".modal-buddy")
  // const buddyChallengeButton = document.querySelector(".challenge-buddy")
  const buddyChallengeButtons = document.querySelectorAll(".challenge-buddy")

  buddyChallengeButtons.forEach((buddyChallengeButton) => {
    buddyChallengeButton.addEventListener('click', (event)=> {
      const challengeId = buddyChallengeButton.dataset.challenge;

      const modalChallenge = document.querySelector(`#modal-challenge-${event.currentTarget.dataset.challenge}`);
      modalChallenge.classList.add("d-none");
      const modalBuddy = document.querySelector(`#modal-buddy-${event.currentTarget.dataset.challenge}`);
      modalBuddy.classList.remove("d-none");

      const backToChallenge = document.querySelector(`.back-button-challenge-${challengeId}`);
      backToChallenge.addEventListener('click', () => {
        modalChallenge.classList.remove("d-none");
        modalBuddy.classList.add("d-none");
      });

      const buddyUsers = document.querySelectorAll(".buddy-card")
      buddyUsers.forEach((user) => {
        user.addEventListener('click', ()=>{
          const challengeForm = document.querySelector(`#challenge-receiver-${challengeId}`)
          const receiverIdField = challengeForm.children[2].firstElementChild;
          receiverIdField.value = user.dataset.userId;


          // newChallengeButton.classList.add("d-none");

          //modalChallenge = document.querySelector(`#modal-challenge-${user.dataset.challenge}`);
          modalChallenge.classList.remove("d-none");
          modalBuddy.classList.add("d-none");

          newChallengeButton = document.querySelector(`#new-challenge-button-${challengeId}`);
          newChallengeButton.classList.add("d-none");

          buddyChallengeButton.classList.add("d-none");


          const avatarContainer = modalChallenge.querySelector(".buddies-avatar-container");

          const buddyUserAvatar = modalChallenge.querySelector(".buddies-avatar-container > img:last-child");
          buddyUserAvatar.src = user.dataset.userPhoto;

          const submitBtn = challengeForm.querySelector("input[type='submit']");
          submitBtn.value = `Challenge ${user.dataset.userUsername}`;
          submitBtn.dataset.disableWith = `Challenge ${user.dataset.userUsername}`;
          const newBuddyChallengeform = document.querySelector(`#new-buddy-challenge-form-${challengeId}`);
          challengeForm.classList.remove("d-none");
          newBuddyChallengeform.classList.remove("d-none");
        });
      });
    });
  });
}, 500)



