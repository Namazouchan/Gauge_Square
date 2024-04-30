function addMidTermGoalEntry() {
  const container = document.getElementById("mid-term-goal-area");
  const newGoalEntry = container.firstElementChild.cloneNode(true);
  newGoalEntry.querySelectorAll('textarea, select, input[type="date"]').forEach(input => {
    input.value = '';
  });
  container.appendChild(newGoalEntry);
}

function removeMidTermGoalEntry(button) {
  const entry = button.parentNode;
  if (entry.parentNode.childElementCount > 1) {
    entry.parentNode.removeChild(entry);
  } else {
    alert('少なくとも一つの入力エリアは必要です。');
  }
}
