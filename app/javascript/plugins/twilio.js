import { connect, createLocalTracks } from 'twilio-video';

const twilioInit = () => {
  const twilioContainer = document.querySelector('.twilio-video');
  const video = document.getElementById('userVideo');
  const leaveBtn = document.getElementById('leave-btn');
  const link = document.querySelector('.root-link')
  const Video = Twilio.Video;
  let videoSession, localStream;
  // preview screen
  navigator.mediaDevices.getUserMedia({video: true, audio: true})
  .then(vid => {
    console.log('get user media')
    video.srcObject = vid;
    localStream = vid;
    console.log(video)
    leaveBtn.addEventListener('click', () => {
      const tracks = vid.getTracks();
      tracks.forEach(track => track.stop());
    });
  });

  createLocalTracks({
    audio: true,
    video: { width: 640 }
  }).then(localTracks => {
    return connect(twilioContainer.dataset.token, {
      name: twilioContainer.dataset.session,
      tracks: localTracks
    });
  }).then(session => {
    console.log(`Connected to Session: ${session.name}`);
    videoSession = session;

    session.participants.forEach(participantConnected);
    session.on("participantConnected", participantConnected);

    session.on("participantDisconnected", participantDisconnected);
    session.once("disconnected", (error) =>
      session.participants.forEach(participantDisconnected)
    );
    // leave session
    leaveBtn.addEventListener("click", () => {
      videoSession.disconnect();
      console.log(`Disconnected from Session ${videoSession.name}`);
      link.click();
    });
    // twilioAddParticipant(session);
  });
}

const participantConnected = (participant) => {
  console.log(`Participant ${participant.identity} connected'`);

  const div = document.querySelector('.participant') //locates div for new participant
  div.id = participant.sid;

  participant.on('trackSubscribed', track => trackSubscribed(div, track));
  participant.on('trackUnsubscribed', trackUnsubscribed);

  participant.tracks.forEach(publication => {
    if (publication.isSubscribed) {
      trackSubscribed(div, publication.track);
    }
  });
}

const participantDisconnected = (participant) => {
  console.log(`Participant ${participant.identity} disconnected.`);
  document.getElementById(participant.sid).style.visibility = "hidden";
}

const trackSubscribed = (div, track) => {
  div.appendChild(track.attach());
}

const trackUnsubscribed = (track) => {
  track.detach().forEach(element => element.remove());
}

export default twilioInit;
