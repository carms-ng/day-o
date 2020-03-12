import confetti from 'canvas-confetti';

const loadConfetti = () => {

  const actionAll = document.querySelectorAll('.section-action');

  actionAll.forEach((action) => {
    const doneButton = action.querySelector('.action-done-btn');
    if (doneButton) {
      action.querySelector('.action-done-btn').addEventListener('click', (event) => {
        const sub = action.parentElement;

        setTimeout(() => {
          const numNotDone = sub.querySelectorAll('.fa-circle').length;
          if (numNotDone === 0) {
            confetti();
          }
        }, 100);
      });
    }
  });
}

export { loadConfetti };
