$(document).ready(function() {
  $('#jmap').jmap({
    height: '450px',
    lineColor: '#bfbfbf',
    lineWidth: 1,
    showInfobox: true,
    backgroundRadius: '0.3rem',
    backgroundPadding: '1rem',
    backgroundColor: '#ff000000',
    prefectureClass: 'prefecture',
    prefectureLineColor: '#ffffff',
    prefectureLineWidth: 1,
    prefectureLineHoverColor: '#fff',
    fontSize: '0.8rem',
    fontColor: '#000',
    font: 'serif',
    areas: window.PREFECTURES.map(prefecture => ({
      code: prefecture.id,
      name: prefecture.name,
      color: getColorByCode(prefecture.id),
      hoverColor: getHoverColorByCode(prefecture.id)
    })),
    onLoad: function(e, data) {
      $(this).html('<strong>' + data.name + '</strong>');
    },
    onSelect: function(e, data) {
      window.location.href = `/weather/show?prefecture=${data.name}`;
    },
    onHover: function(e, data) {
      console.log(data);
    }
  });

  function getColorByCode(code) {
    const colors = {
      1: "#7f7eda", 2: "#759ef4", 3: "#759ef4", 4: "#759ef4", 5: "#759ef4",
      6: "#759ef4", 7: "#759ef4", 8: "#7ecfea", 9: "#7ecfea", 10: "#7ecfea",
      11: "#7ecfea", 12: "#7ecfea", 13: "#7ecfea", 14: "#7ecfea", 15: "#7cdc92",
      16: "#7cdc92", 17: "#7cdc92", 18: "#7cdc92", 19: "#7cdc92", 20: "#7cdc92",
      21: "#7cdc92", 22: "#7cdc92", 23: "#7cdc92", 24: "#ffe966", 25: "#ffe966",
      26: "#ffe966", 27: "#ffe966", 28: "#ffe966", 29: "#ffe966", 30: "#ffe966",
      31: "#ffcc66", 32: "#ffcc66", 33: "#ffcc66", 34: "#ffcc66", 35: "#ffcc66",
      36: "#fb9466", 37: "#fb9466", 38: "#fb9466", 39: "#fb9466", 40: "#ff9999",
      41: "#ff9999", 42: "#ff9999", 43: "#ff9999", 44: "#ff9999", 45: "#ff9999",
      46: "#ff9999", 47: "#eb98ff"
    };
    return colors[code] || "#ffffff";
  }

  function getHoverColorByCode(code) {
    const hoverColors = {
      1: "#b3b2ee", 2: "#98b9ff", 3: "#98b9ff", 4: "#98b9ff", 5: "#98b9ff",
      6: "#98b9ff", 7: "#98b9ff", 8: "#b7e5f4", 9: "#b7e5f4", 10: "#b7e5f4",
      11: "#b7e5f4", 12: "#b7e5f4", 13: "#b7e5f4", 14: "#b7e5f4", 15: "#aceebb",
      16: "#aceebb", 17: "#aceebb", 18: "#aceebb", 19: "#aceebb", 20: "#aceebb",
      21: "#aceebb", 22: "#aceebb", 23: "#aceebb", 24: "#fff19c", 25: "#fff19c",
      26: "#fff19c", 27: "#fff19c", 28: "#fff19c", 29: "#fff19c", 30: "#fff19c",
      31: "#ffe0a3", 32: "#ffe0a3", 33: "#ffe0a3", 34: "#ffe0a3", 35: "#ffe0a3",
      36: "#ffbb9c", 37: "#ffbb9c", 38: "#ffbb9c", 39: "#ffbb9c", 40: "#ffbdbd",
      41: "#ffbdbd", 42: "#ffbdbd", 43: "#ffbdbd", 44: "#ffbdbd", 45: "#ffbdbd",
      46: "#ffbdbd", 47: "#f5c9ff"
    };
    return hoverColors[code] || "#ffffff";
  }
});
