import { setRTLTextPlugin } from "mapbox-gl";

const chartSmilies = () => {
  console.log("Hello from chartSmilies");
  const yAxis = document.querySelector(".highcharts-yaxis-labels");
  window.setTimeout(() => {
    console.log(yAxis);
  }, 10000);
}

export { chartSmilies };
