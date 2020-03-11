setTimeout(() => {
  const modalChallenges = document.querySelectorAll(".modal-challenge")
  const modalBuddies = document.querySelectorAll(".modal-buddy")
  // const buddyChallengeButton = document.querySelector("#challenge-buddy")
  const buddyChallengeButtons = document.querySelectorAll("#challenge-buddy")
  const backToChallenge = document.querySelector("#back-to-challenge")


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

      const buddyUsers = document.querySelectorAll(".buddy-user")
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

          const newBuddyChallengeform = document.querySelector(`#new-buddy-challenge-form-${challengeId}`);
          challengeForm.classList.remove("d-none");
          newBuddyChallengeform.classList.remove("d-none");
          // const hidingButton = (buddyChallengeButton) => {
          //   buddyChallengeButton
          // };
        });
      });
    });
  });
}, 500)



