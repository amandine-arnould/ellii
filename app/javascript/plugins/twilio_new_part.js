const twilioAddParticipant = (room) => {
// Attach the Participant's Media to a <div> element.
room.on('participantConnected', participant => {
  participant.tracks.forEach(publication => {
    if (publication.isSubscribed) {
      const track = publication.track;
      document.getElementById('remote-media-div').appendChild(track.attach());
    }
  });
  participant.on('trackSubscribed', track => {
    document.getElementById('remote-media-div').appendChild(track.attach());
  });
});
}
export { twilioAddParticipant };
