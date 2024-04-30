function addTextArea(divId) {
  const container = document.getElementById(divId);
  const newTextArea = document.createElement('textarea');
  newTextArea.name = divId.includes('long') ? "long_term_goals[]" : "mid_term_goals[]";
  container.appendChild(newTextArea);
  if (divId === 'mid-term-goals') {
    const newDateInput = document.createElement('input');
    newDateInput.type = 'date';
    newDateInput.name = 'mid_term_dates[]';
    container.appendChild(newDateInput);
  }
}

function removeTextArea(divId) {
  const container = document.getElementById(divId);
  let elements = container.getElementsByTagName('textarea');
  if (elements.length > 1) { // 確実に一つは残す
    elements[elements.length - 1].remove();
    if (divId === 'mid-term-goals') {
      let dateElements = container.getElementsByTagName('input');
      if (dateElements.length > 1) {
        dateElements[dateElements.length - 1].remove();
      }
    }
  }
}
