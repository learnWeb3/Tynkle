export class Multistep {
    constructor(
      elementSelector,
      nextElementSelector,
      previousElementSelector,
      state,
      steps = []
    ) {
      this.elementSelector = elementSelector;
      this.nextStepElementSelector = nextElementSelector;
      this.previousElementSelector = previousElementSelector;
      this.state = state;
      this.current_step_index = 0;
      this.steps = steps;
      this.step = this.steps[this.current_step_index];
      this.current_progress = 20;
    }
  
    updateStep() {
      this.step = this.steps[this.current_step_index];
    }
    nextStep() {
      this.current_step_index = this.current_step_index + 1;
      this.updateStep();
      this.render();
    }
  
    previousStep() {
      this.current_step_index = this.current_step_index - 1;
      this.updateStep();
      this.render();
    }
  
    getProgressBar() {
      return `<div class="progress">
      <div class="progress-bar progress-bar-animated" role="progressbar bg-info" style="width: ${
        this.current_progress * (this.current_step_index + 1)
      }%" aria-valuenow="${
        this.current_progress * (this.current_step_index + 1)
      }" aria-valuemin="0" aria-valuemax="100">${
        this.current_progress * (this.current_step_index + 1)
      }%</div>
    </div>`;
    }
    async render() {
      const stepTemplate = await this.step.getTemplate(this);
      const progressBarTemplate = this.getProgressBar();
      $(this.elementSelector).html(progressBarTemplate + " " + stepTemplate);
      this.step.hasOwnProperty("afterRender") && this.step.afterRender(this);
  
      $(this.nextStepElementSelector).on("click", () => {
        this.step.setState(this);
        this.nextStep();
      });
      $(this.previousElementSelector).on("click", () => {
        this.previousStep();
      });
    }
  }