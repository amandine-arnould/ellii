const chatScroll = () => {
  const form = document.querySelector("#new_message");
  const chatContainer = document.getElementById("messages");

  // Options for the observer (which mutations to observe)
  const config = { childList: true, subtree: true };

  // Callback function to execute when mutations are observed
  const callback = function(mutationsList, observer) {
      // Use traditional 'for loops' for IE 11
      for(const mutation of mutationsList) {
          if (mutation.type === 'childList') {
              console.log('A child node has been added or removed.');
              chatContainer.scrollTo(0,chatContainer.scrollHeight);
          }
      }
  };

  // Create an observer instance linked to the callback function
  const observer = new MutationObserver(callback);

  // Start observing the target node for configured mutations
  observer.observe(chatContainer, config);

  // Later, you can stop observing
  // observer.disconnect();
}

export { chatScroll };
