function initializeClock() {
  const second = 1000,
    minute = second * 60,
    hour = minute * 60,
    day = hour * 24;

    const startAt = document.getElementById("countdown");
    let session = startAt.dataset.timer,
      countDown = new Date(session).getTime(),
      x = setInterval(function () {
        let now = new Date().getTime(),
          distance = countDown - now;
        document.getElementById("days").innerText = Math.floor(distance / day);
        document.getElementById("hours").innerText = Math.floor((distance % day) / hour);
        document.getElementById("minutes").innerText = Math.floor((distance % hour) / minute);
        if (document.getElementById("seconds")) {
          document.getElementById("seconds").innerText = Math.floor((distance % minute) / second);
        }

        //do something later when date is reached
        if (distance < 0) {
          let countdown = document.getElementById("countdown"),
              btn = document.getElementById("join-session");

          countdown.style.display = "none";
          btn.style.display = "block";

          clearInterval(x);
        }
        //seconds
      }, 0);
};

 export { initializeClock };
