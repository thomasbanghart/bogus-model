const visObject = {
  options: {
  },
  create: function(element, config){
  },
  updateAsync: function(data, element, config, queryResponse, details, doneRendering){
    element.innerHTML = '<iframe width="100%" height="100%" src="https://docs.google.com/spreadsheets/d/e/2PACX-1vRwheSFu4KOwxV1goMhzY13BtZrCkWJfHqziIgAadkynp4SQfQn7x0_N_p60YMV2O9Oo_xGxp4LwRRR/pubhtml?widget=true&amp;headers=false"></iframe>';
    doneRendering()
  }
};

looker.plugins.visualizations.add(visObject);
