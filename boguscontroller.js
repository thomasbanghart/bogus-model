looker.plugins.visualizations.add({
  id: "viz-inspector",
  label: "Viz Inspector",
  options: {
  },
  create: function(element, config) {
    element.innerHTML = `
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<style>
			.dataset_input {
         display: block;
      }
			.disp_input {
         display: block;
      }
			.btn-primary {
         display: block;
      }
			.n_input {
         width: 80;
      }
			.modelbogus_input {
				display: block;
			}
		</style>`

    var container = element.appendChild(document.createElement("div"));
    container.className = 'viz-inspector'

    var filename = element.appendChild(document.createElement("input"));
    filename.placeholder = `Bogus Filename`
    filename.className = 'filename_input'
    
    var dataset = element.appendChild(document.createElement("input"));
    dataset.placeholder = `Dataset Name`
    dataset.className = 'dataset_input'
    
    var writedisp = element.appendChild(document.createElement("select"));
    writedisp.innerHTML = `
      <option value="w">Drop & Replace</option>
      <option value="w+">Append</option>`
    writedisp.className = 'disp_input'
    
    var modelbogus = element.appendChild(document.createElement("textarea"));
    modelbogus.rows = "4"
    modelbogus.placeholder = `{
  "TABLENAME": 100
}`
    modelbogus.className = 'modelbogus_input'

    var selectList = element.appendChild(document.createElement("input"));
    selectList.type = 'checkbox'
    selectList.className = 'remaining_input'
    var label1 = element.appendChild(document.createElement("label"));
    label1.innerHTML = `Add    `
    label1.className = 'add_label'
    var n = element.appendChild(document.createElement("input"));
    n.className = 'n_input'
    var dataset = element.appendChild(document.createElement("label"));
    dataset.innerHTML = `    rows to remaining tables`
    dataset.className = 'add_label2'
    
    var dataset = element.appendChild(document.createElement("BUTTON"));
    dataset.innerHTML = `Make Data`
    dataset.className = 'btn-primary'
  },
  updateAsync: function(data, element, config, queryResponse, details, done) {
    this.clearErrors();
    $('.btn-primary').click(function () {
      var fn = document.querySelector('.filename_input').value
      var ds = document.querySelector('.dataset_input').value
      var dp = document.querySelector('.disp_input').value
      var mb = document.querySelector('.modelbogus_input').value
      var rm = document.querySelector('.remaining_input').checked
      var n = document.querySelector('.n_input').value
      package = {}
      package['filename'] = fn
      package['dataset'] = ds
      package['mode'] = dp
      modelb = mb == "" ? {} : JSON.parse(mb)
      if (rm) {
        modelb["."] = parseInt(n)
      }
      package['modelbogus'] = modelb
      console.log(package)
      $.ajax({
        type: "POST",
        url: "https://us-central1-spencer-white-tckt87992.cloudfunctions.net/makedata",
        data: package,
        success: console.log("Good")
      });
    });
    done()
  }
});
