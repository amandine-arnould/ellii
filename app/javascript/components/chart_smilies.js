// import { Chart } from "chart.js";

const chartSmilies = () => {
  window.setTimeout(() => {
    const chart = Chartkick.charts["chart-1"].getChartObject();
    chart.options.scaleShowValues = true;
    chart.options.scales.y.min = 1;
    chart.options.scales.y.max = 5;
    chart.options.scales.y.ticks.font = { size: 20 };
    chart.options.scales.y.ticks.stepSize = 1;
    chart.options.scales.y.ticks.sampleSize = 5;
    chart.options.scales.y.ticks.autoSkip = false;
    chart.options.scales.y.ticks.major.enabled = false;
    chart.options.scales.y.ticks.callback = function (value, index, values) {
      if (value === 1) {
        return "😔";
      } else if (value === 2) {
        return "😐";
      } else if (value === 3) {
        return "🙂";
      } else if (value === 4) {
        return "😀";
      } else if (value === 5) {
        return "😄";
      } else {
        return value;
      }
    };
    chart.update();
  }, 500);
};

export { chartSmilies };
