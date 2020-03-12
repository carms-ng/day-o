import { CountUp } from 'countup.js';

const loadMassCreateModal = () => {
  const btn = document.getElementById('habit-bottom-btn');
  btn.addEventListener('ajax:success', (event) => {
    console.log(event.detail[0].new_impact);
    $('#massCreateModal').modal('show')

    const countUp = new CountUp('count-up', event.detail[0].new_impact);
    countUp.start();
    // const modal = document.querySelector('.modal-body');
    // modal.insertAdjacentHTML('afterbegin', `<h2>${event.detail[0].new_impact}</h2>`)

    $('#massCreateModal').on('hide.bs.modal', function (e) {
      location.reload();
    })
  });
}

export { loadMassCreateModal };
