const midGoalAdd = () => {
  const midGoalsContainer = document.getElementById("mid-goals");
  const midGoalsFields = midGoalsContainer.querySelectorAll(".mid-goals-field");

  if (midGoalsFields.length < 5){
    const newMidGoalField = midGoalsFields[0].cloneNode(true);
    newMidGoalField.querySelectorAll("input, select").forEach(input => {
      input.value = '';
    });

    midGoalsContainer.appendChild(newMidGoalField);
  } else {
    alert("中期目標は最大5つまでしか作成できません。")
  }
};

document.getElementById("add-mid-term-goals").addEventListener("click", midGoalAdd);