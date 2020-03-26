const visObject = {
  options: {
  },
  create: function(element, config){
  },
  updateAsync: function(data, element, config, queryResponse, details, doneRendering){
    element.innerHTML = '<iframe width="100%" height="100%" src="https://docs.google.com/presentation/d/189zzC2dxr0TVRig8Tutgqd7uXdwfxRuQvm2bE8lqXyc/edit#slide=id.g579ee364a7_0_0"></iframe>';
    doneRendering()
  }
};

looker.plugins.visualizations.add(visObject);
