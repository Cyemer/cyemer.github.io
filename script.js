document.querySelectorAll('.faq-question').forEach(question => {
  question.addEventListener('click', () => {
    const answer = question.nextElementSibling;
    const arrow = question.querySelector('.arrow');
    const isOpen = answer.classList.contains('open');

    if (isOpen) {
      answer.classList.remove('open');
      arrow.innerHTML = '&#9654;'; // right arrow
    } else {
      answer.classList.add('open');
      arrow.innerHTML = '&#9660;'; // down arrow
    }
  });
});
