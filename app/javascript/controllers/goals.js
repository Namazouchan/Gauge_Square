// フィールドセットの追加機能
const midGoalAdd = () => {
  const midGoalsContainer = document.getElementById("mid-goals");
  const midGoalFields = midGoalsContainer.querySelectorAll(".mid-goal-field");

  console.log("midGoalFields.length:", midGoalFields.length);

  if (midGoalFields.length < 5) {
    console.log("midGoalFields.length:", midGoalFields.length);
    let newMidGoalField;
      newMidGoalField = document.createElement('div');
      newMidGoalField.classList.add('mid-goal-field');
      newMidGoalField.innerHTML = `
        <div class="mb-3">
          <label class="form-label bold-label" for="goal_mid_goal">中期的な目標</label>
          <input class="form-control" type="text" name="goal[mid_goal_${midGoalFields.length+1}]" id="goal_mid_goal_${midGoalFields.length+1}">
        </div>
        <div class="mb-3">
          <label class="form-label" for="goal_mid_goal">何をするのか</label>
          <input class="form-control" type="text" name="goal[what_to_do_${midGoalFields.length+1}]" id="goal_what_to_do_${midGoalFields.length+1}">
        </div>
        <div class="mb-03">
          <label class="form-label" for="goal_mid_goal">なぜそれを行うのか</label>
          <input class="form-control type="text" name="goal[why_to_do_${midGoalFields.length+1}]" id="goal_why_to_do_${midGoalFields.length+1}">
        </div>
        <div class="mb-03">
          <label class="form-label" for="current_status">現状どうなのか</label>
          <input class="form-control" type="text" name="goal[current_status_${midGoalFields.length+1}]" id="goal_current_status_${midGoalFields.length+1}">
        </div>
        <div class="mb-03">
          <label class="form-label" for="why_current_status">なぜ現状そうなっているのか</label>
          <input class="form-control" type="text" name="goal[why_current_status_${midGoalFields.length+1}]" id="goal_why_current_status_${midGoalFields.length+1}">
        </div>
        <div class="mb-03">
          <label class="form-label" for="what_next">では何をするのか</label>
          <input class="form-control" type="text" name="goal[what_next_${midGoalFields.length+1}]" id="goal_what_next_${midGoalFields.length}">
        </div>
        <div class="mb-03">
          <label class="form-label" for="mid_goal_deadline">締め切り</label>
          <input class="form-control" type="date" name="goal[mid_goal_deadline_${midGoalFields.length+1}]" id="goal_mid_goal_deadline_${midGoalFields.length+1}">
        </div>
        <div class="mb-05">
          <label class="form-label" for="goal_priority">優先順位</label>
          <select class="form-control"  name="goal[priority_${midGoalFields.length+1}]" id="goal_priority_${midGoalFields.length+1}">
            <option value="1">low</option>
            <option value="2">medium</option>
            <option value="3">high</option>
          </select>
        </div>
        <div class="row justify-content-center mb-3 mt-3">
          <div class="col-auto">
            <button type="button" class="remove-mid-goal" style="display: none;">-</button>
          </div>
        </div>
    `;
    // 新しいフィールドセットに削除ボタンのイベントリスナーを追加
    const removeButton = newMidGoalField.querySelector(".remove-mid-goal");
    removeButton.style.display = "inline"; // -ボタンを表示
    removeButton.addEventListener("click", function() {
      this.closest(".mid-goal-field").remove();
    });

    midGoalsContainer.appendChild(newMidGoalField);
    console.log("New mid-goal field added.");
  } else {
    alert("中期目標は最大5つまでしか作成できません。");
    console.error("midGoalFields.length is out of expected range.");
  }
};

// フィールドセットの削除機能
const addRemoveEventListeners = () => {
  const removeButtons = document.querySelectorAll(".remove-mid-goal");
  removeButtons.forEach(button => {
    button.addEventListener("click", function() {
      this.closest(".mid-goal-field").remove();
    });
  });
};

// 初期削除ボタンにイベントリスナーを追加
document.addEventListener("DOMContentLoaded", () => {
  const addButton = document.getElementById("add-mid-term-goals");
  if (addButton) {
    addButton.addEventListener("click", midGoalAdd);
  } else {
    console.error("Add button not found.");
  }
  addRemoveEventListeners();
  console.log("Event listeners added to initial remove buttons.");
});
