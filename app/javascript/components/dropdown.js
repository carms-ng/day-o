const loadActionDropdown = () => {

  const actions = document.querySelectorAll('.section-action');

  actions.forEach((action) => {
    const chevron = action.querySelector('.dd-chevron');
    chevron.addEventListener('click', (event) => {
      chevron.classList.toggle('chevron-active');
      action.classList.toggle('action-active');
    });
  });
};

export { loadActionDropdown };

