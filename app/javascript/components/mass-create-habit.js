
const loadMassCreateModal = () => {
  const btn = document.getElementById('habit-bottom-btn');
  btn.addEventListener('ajax:success', (event) => {
    console.log(event.detail[0].new_impact);
    $('#massCreateModal').modal('show')

    const modal = document.querySelector('.modal-body');
    modal.innerText = `${event.detail[0].new_impact}`;

    $('#massCreateModal').on('hide.bs.modal', function (e) {
      location.reload();
    })
  });
}

export { loadMassCreateModal };
