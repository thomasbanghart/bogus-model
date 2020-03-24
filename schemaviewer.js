const visObject = {
  options: {
  },
  create: function(element, config){
  },
  updateAsync: function(data, element, config, queryResponse, details, doneRendering){
    element.innerHTML = '<iframe width="100%" height="100%" src="https://docs.google.com/spreadsheets/d/1e38QL47sD8Kub50WxxR5_UtDiXN_mt2ZQlHTMqax7YI/edit?usp=sharing"></iframe>';
    doneRendering()
  }
};

looker.plugins.visualizations.add(visObject);
