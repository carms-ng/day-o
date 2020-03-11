const modalChallenge = document.querySelector(".modal-challenge")
const modalBuddy = document.querySelector(".modal-buddy")
const buddyChallengeButton = document.querySelector("#challenge-buddy")

const backToChallenge = document.querySelector("#back-to-challenge")

backToChallenge.addEventListener('click', ()=> {
  modalChallenge.classList.remove("d-none");
  modalBuddy.classList.add("d-none");
});

buddyChallengeButton.addEventListener('click', ()=> {
  modalChallenge.classList.add("d-none");
  modalBuddy.classList.remove("d-none");
});


const buddyUsers = document.querySelectorAll(".buddy-user")
const receiverIdField = document.querySelector("#buddy_challenge_receiver_id")
const newChallengeButton = document.querySelector('#new-challenge-button')
const newBuddyChallengeform = document.querySelector('#new_buddy_challenge')

buddyUsers.forEach((user) => {
  user.addEventListener('click', ()=>{
    receiverIdField.value = user.dataset.userId;
    newChallengeButton.classList.add("d-none");
    modalChallenge.classList.remove("d-none");
    modalBuddy.classList.add("d-none");
    newBuddyChallengeform.classList.remove("d-none");
  });
});

