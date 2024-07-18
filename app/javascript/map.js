document.addEventListener('DOMContentLoaded', () => {
  if (typeof japanMap !== 'undefined') {
    japanMap({
      element: '#map',
      width: 800,
      height: 600,
      onSelect: function(data) {
        alert('Selected prefecture: ' + data.name);
      }
    });
  } else {
    console.error('japanMap is not defined');
  }
});
