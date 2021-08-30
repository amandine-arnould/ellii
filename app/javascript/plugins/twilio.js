import { connect, createLocalTracks } from "twilio-video";

const twilioInit = () => {
  const twilioContainer = document.querySelector(".twilio-video");
  const yourVideo = document.querySelector(".remote-media-div");
  const video = document.getElementById("userVideo");
  const leaveBtn = document.getElementById("leave-btn");
  const Video = Twilio.Video;
  let videoRoom, localStream;

  // preview screen
  navigator.mediaDevices
    .getUserMedia({ video: true, audio: true })
    .then((vid) => {
      // console.log("get user media");
      yourVideo.insertAdjacentHTML("afterbegin", "Vous");
      video.srcObject = vid;
      localStream = vid;
      console.log(video);
      leaveBtn.addEventListener("click", () => {
        const tracks = vid.getTracks();
        tracks.forEach((track) => track.stop());
      });
    });

  createLocalTracks({
    audio: true,
    video: { width: 640 },
  })
    .then((localTracks) => {
      return connect(twilioContainer.dataset.token, {
        name: twilioContainer.dataset.room,
        tracks: localTracks,
      });
    })
    .then((room) => {
      console.log(`Connected to Room: ${room.name}`);
      videoRoom = room;

      room.participants.forEach(participantConnected);
      room.on("participantConnected", participantConnected);

      room.on("participantDisconnected", participantDisconnected);
      room.once("disconnected", (error) =>
        room.participants.forEach(participantDisconnected)
      );
      // leave room
      leaveBtn.addEventListener("click", () => {
        videoRoom.disconnect();
        console.log(`Disconnected from Room ${videoRoom.name}`);
      });

      // MUTE AUDIO
      const muteAudio = document.getElementById("muteAudio");
      muteAudio.addEventListener("click", () => {
        room.localParticipant.audioTracks.forEach((track) => {
          track.track.disable();
        });
      });

      // UNMUTE AUDIO
      const unmuteAudio = document.getElementById("unmuteAudio");
      unmuteAudio.addEventListener("click", () => {
        room.localParticipant.audioTracks.forEach((track) => {
          track.track.enable();
        });
      });

      // MUTE VIDEO
      const userVideo = document.getElementById("userVideo");
      const muteVideo = document.getElementById("muteVideo");
      muteVideo.addEventListener("click", () => {
        userVideo.style.opacity = "0";
        room.localParticipant.videoTracks.forEach((track) => {
          track.track.disable();
        });
      });

      // UNMUTE VIDEO
      const unmuteVideo = document.getElementById("unmuteVideo");
      unmuteVideo.addEventListener("click", () => {
        userVideo.style.opacity = "1";
        room.localParticipant.videoTracks.forEach((track) => {
          track.track.enable();
        });
      });
    });
};

const participantConnected = (participant) => {
  const currentUserStatus =
    document.querySelector(".twilio-video").dataset.status;
  if (
    participant.identity.split("$")[1] === "teacher" ||
    currentUserStatus === "teacher"
  ) {
    console.log(
      `Participant ${participant.identity.split("$")[2]} ${
        participant.identity.split("$")[3]
      } connected'`
    );

    //locates div for new participant
    const div = document.querySelector(".participant");

    participant.on("trackSubscribed", (track) =>
      trackSubscribed(div, track, participant)
    );
    participant.on("trackUnsubscribed", trackUnsubscribed);

    participant.tracks.forEach((publication) => {
      if (publication.isSubscribed) {
        trackSubscribed(div, publication.track, participant);
      }
    });
  }
};

const participantDisconnected = (participant) => {
  const currentUserStatus =
    document.querySelector(".twilio-video").dataset.status;
  if (
    participant.identity.split("$")[1] === "teacher" ||
    currentUserStatus === "teacher"
  ) {
    console.log(
      `Participant ${participant.identity.split("$")[2]} ${
        participant.identity.split("$")[3]
      } disconnected.`
    );
  }
};

const trackSubscribed = (div, track, participant) => {
  const innerDiv = document.createElement("div");
  if (track.kind === "video") {
    innerDiv.insertAdjacentHTML(
      "afterbegin",
      `${participant.identity.split("$")[2]} ${
        participant.identity.split("$")[3]
      }`
    );
  }
  innerDiv.appendChild(track.attach());
  div.appendChild(innerDiv);
};

const trackUnsubscribed = (track) => {
  track.detach().forEach((element) => element.parentElement.remove());
};

export { twilioInit };
