import {
  getBreakdowns,
  getNearbyUsers,
  ROOT_PATH,
} from "../API_CLIENT/index.js";
import { getDataGouvAdresses } from "../commons/geolocation.js";
import {
  getBreakdownTemplate,
  getBreakdownTemplateChecked,
  getPlatformTemplate,
  getPlatformTemplateChecked,
  getUserTemplate,
} from "../templates/templates.js";

class Multistep {
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

const state = {
  platformId: null,
  breakdownId: null,
  location: null,
  coordinates: { lat: null, lon: null },
};

const steps = [
  {
    getTemplate: (mstep) => {
      const platformsTemplates = platforms.map((platform) => {
        return mstep.state.platformId === parseInt(platform.id)
          ? getPlatformTemplateChecked(platform)
          : getPlatformTemplate(platform);
      });
      return `<div id='step-container'   style="min-height:66vh">
      <h2 class='text-center font-weight-bold my-4'>Type d'appareil</h2>
      <div class='d-flex flex-wrap justify-content-evenly align-items-center align-items-center col-12 overflow-auto' style="min-height:50vh;max-height:75%">
      ${platformsTemplates.join(" ")}
      </div>
      <div class='row my-4 d-flex justify-content-center align-items-center'>
        <button class='col-5 col-lg-2 btn btn-lg btn-primary' id="next-step">
          suivant
        </button>
      </div>
    </div>`;
    },
    setState: (mstep) => {
      mstep.state.platformId = parseInt($("input:checked").val());
    },
  },
  {
    getTemplate: async (mstep) => {
      const { status, data } = await getBreakdowns({
        id_platform: mstep.state.platformId,
      });
      const breakdownTemplates =
        status === 200
          ? data.map((breakdown) => {
              return mstep.state.breakdownId === parseInt(breakdown.id)
                ? getBreakdownTemplateChecked(breakdown)
                : getBreakdownTemplate(breakdown);
            })
          : "";
      return `<div id='step-container'   style="min-height:66vh">
      <h2 class='text-center font-weight-bold my-4'>Type de panne :</h2>
      <div class='d-flex flex-wrap justify-content-evenly align-items-center align-items-center col-12 overflow-auto' style="min-height:50vh; max-height:75%">
      ${breakdownTemplates.join(" ")}
      </div>
      <div class='row my-4 d-flex justify-content-between align-items-center'>
      <button class='col-5 col-lg-2 btn btn-lg btn-primary' id="previous-step">
      précedent
    </button>
        <button class='col-5 col-lg-2 btn btn-lg btn-primary' id="next-step">
          suivant
        </button>
      </div>
    </div>`;
    },
    setState: (mstep) => {
      mstep.state.breakdownId = parseInt($("input:checked").val());
    },
  },
  {
    getTemplate: (mstep) => {
      return `<div id='step-container'  style="min-height:66vh">
      <h2 class='text-center font-weight-bold my-4'>Localisation :</h2>
      <form style="min-height:50vh" class='d-flex flex-column align-items-center justify-content-center'>
        <img class='map-illustration' src='${
          ROOT_PATH + "/app/assets/img/commons/location.png"
        }'/>
        <div class='form-group col-12 col-lg-6'>
          <label>Renseigner ma localisation :</label>
          <input placeholder='3 place vendôme, 75001 Paris' id="location" class='form-control' value='${
            mstep.state.location ? mstep.state.location : ""
          }'/>
          <div id="autocomplete-menu" class="d-none col-12 col-lg-6"></div>
        </div>
      </form>
      <div class='row my-4 d-flex justify-content-between align-items-center'>
      <button class='col-5 col-lg-2 btn btn-lg btn-primary' id="previous-step">
      précedent
    </button>
        <button class='col-5 col-lg-2 btn btn-lg btn-primary' id="next-step">
          suivant
        </button>
      </div>
    </div>`;
    },
    setState: (mstep) => {
      mstep.state.location = $("input").val();
    },
    afterRender: (mstep) => {
      const handleClickItem = () =>
        $("#autocomplete-menu .item").on("click", function (event) {
          $("#location").val(event.target.innerHTML);
          mstep.state.coordinates.lat = $(event.target).data("lat");
          mstep.state.coordinates.lon = $(event.target).data("lon");
          $("#autocomplete-menu").addClass("d-none");
        });
      const handleRemoveMenu = () =>
        $(window).on("click", function (event) {
          if (!Array.from(event.target.classList).includes("item")) {
            $("#autocomplete-menu").addClass("d-none");
          }
        });
      $("#location").on("input", async (event) => {
        const { status, data } = await getDataGouvAdresses(event.target.value);
        if (status === 200) {
          $("#autocomplete-menu").html("").removeClass("d-none");
          data.features.map(({ properties, geometry: { coordinates } }) => {
            $("#autocomplete-menu").append(
              `<div class='item' data-lat='${coordinates[1]}' data-lon='${coordinates[0]}'>${properties.label}</div>`
            );
          });
          handleClickItem();
          handleRemoveMenu();
        }
      });
    },
  },
  {
    getTemplate: async (mstep) => {
      const { status, data } = await getNearbyUsers(
        mstep.state.coordinates.lat,
        mstep.state.coordinates.lon
      );
      if (status === 200 && data.length > 0) {
        const usersTemplates = data.map((user) => getUserTemplate(user));
        return `<div id='step-container'  style="min-height:66vh">
          <h2 class='text-center font-weight-bold my-4'>Choisir mes helpers :</h2>
          <div class='d-flex flex-wrap justify-content-evenly align-items-center align-items-center col-12 overflow-auto' style="min-height:50vh;max-height:75%;">
          ${usersTemplates.join(" ")}
          </div>
          <div class='row my-4 d-flex justify-content-between align-items-center' style='max-height: 78%;'>
          <button class='col-5 col-lg-2 btn btn-lg btn-primary' id="previous-step">
          précedent
        </button>
            <button class='col-5 col-lg-2 btn btn-lg btn-primary' id="next-step">
              suivant
            </button>
          </div>
        </div>`;
      } else {
        return `<div id='step-container'  style="min-height:66vh">
          <h2 class='text-center font-weight-bold my-4'>Choisir mes helpers :</h2>
          <div class='d-flex flex-wrap justify-content-evenly align-items-center align-items-center col-12 overflow-auto' style="min-height:50vh;max-height:75%;">
            <p>Nous n'avons trouvé personne dans votre entourage</p>
          </div>
          <div class='row my-4 d-flex justify-content-center align-items-center' style='max-height: 78%;'>
          <button class='col-5 col-lg-2 btn btn-lg btn-primary' id="previous-step">
          précedent
        </button>
          </div>
        </div>`;
      }
    },
    setState: (mstep) => {},
    afterRender: (mstep) => {
      const options = {
        max_value: 5,
        step_size: 0.5,
        initial_value: 0,
        cursor: "default",
        readonly: true,
      };
      $(".rating").rate(options);
    },
  },
  {
    getTemplate: (mstep) => {
      return `<div id='step-container'  style="min-height:66vh">
      <h2 class='text-center font-weight-bold my-4'>Rédiger un message :</h2>
      <form style="min-height:50vh" class='d-flex flex-column align-items-center justify-content-center'>
      <div class='form-group col-12'>
        <label>Contenu du message :</label>
        <textarea rows='10' class="form-control"> </textarea>
      </div>
    </form>
      <div class='row my-4 d-flex justify-content-between align-items-center'>
      <button class='col-5 col-lg-2 btn btn-lg btn-primary' id="previous-step">
      précedent
    </button>
        <button class='col-5 col-lg-2 btn btn-lg btn-primary' id="next-step">
          suivant
        </button>
      </div>
    </div>`;
    },
    setState: (mstep) => {},
  },
];
const mstep = new Multistep(
  "#general-container",
  "#next-step",
  "#previous-step",
  state,
  steps
);
mstep.render();
