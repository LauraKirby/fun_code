const headingInput = document.querySelector('.heading-input');
const pageHeading = document.querySelector('#page-heading')
const editHeadingBtn = document.querySelector('.heading-btn');

const languageList = document.querySelector('.language-list');
const toggleShowBtn = document.querySelector('.hide-btn');
const addListItemBtn = document.querySelector('.add-list-item-btn');
const itemInput = document.querySelector('.list-item-input');
const lastListItem = document.querySelector('li:last-child')

const descriptionInput = document.querySelector('.description-input');
const descriptionBtn = document.querySelector('.description-btn');
const description = document.querySelector('p.description');

descriptionBtn.addEventListener('click', () => {
  description.innerHTML = descriptionInput.value + ':';
  descriptionInput.value = '';
});

editHeadingBtn.addEventListener('click', () => {
  pageHeading.innerHTML = headingInput.value;
  pageHeading.className = 'purple-heading'
  headingInput.value = '';
});

toggleShowBtn.addEventListener('click', ()=> {
  if (languageList.style.display == '') {
    toggleShowBtn.innerHTML = 'Show list'
    languageList.style.display = 'none';
  } else {
    languageList.style.display = '';
    toggleShowBtn.innerHTML = 'Hide list'
  }
});

addListItemBtn.addEventListener('click', ()=> {
  let li = document.createElement('li');
  li.innerHTML = itemInput.value;
  lastListItem.insertAdjacentElement('afterend', li);
  itemInput.value = '';
});
