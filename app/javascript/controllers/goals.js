// フィールドセットの追加機能
const midGoalAdd = () => {
  const midGoalsContainer = document.getElementById("mid-goals");
  const midGoalFields = midGoalsContainer.querySelectorAll(".mid-goal-field");

  if (midGoalFields.length > 0 && midGoalFields.length < 5) {
    const newMidGoalField = midGoalFields[0].cloneNode(true);
    newMidGoalField.querySelectorAll("input, select").forEach(input => {
      input.value = '';
    });


    // 新しいフィールドセットに削除ボタンのイベントリスナーを追加
    newMidGoalField.querySelector(".remove-mid-goal").addEventListener("click", function() {
      this.parentNode.remove();
    });

    midGoalsContainer.appendChild(newMidGoalField);
  } else {
    alert("中期目標は最大5つまでしか作成できません。");
  }
};

// フィールドセットの削除機能
const addRemoveEventListeners = () => {
  const removeButtons = document.querySelectorAll(".remove-mid-goal");
  removeButtons.forEach(button => {
    button.addEventListener("click", function() {
      this.parentNode.remove();
    });
  });
};

// 初期削除ボタンにイベントリスナーを追加
document.addEventListener("DOMContentLoaded", () => {
  document.getElementById("add-mid-term-goals").addEventListener("click", midGoalAdd);
  addRemoveEventListeners();
});
