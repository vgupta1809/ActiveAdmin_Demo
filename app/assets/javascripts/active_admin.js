//= require active_admin/base
//= require activeadmin_addons/all
$(document).ready(function(){
  function displayNameResult (event){
    
    id = event.target.id
    value = id.match(/attributes_(\d+)/i)[1];
    var obj = { patient_id:  event.target.title};
    $.getJSON("/admin/physicians/update_name/",obj).done(function(data){
      var name_element = document.getElementById("physician_patients_attributes_"+value+"_name");
      name_element.value = data.patient.name
    })
  }

  var observer = new MutationObserver(function(mutations) {
    mutations.forEach(function(mutation) {
      displayNameResult(mutation);
    });    
  });

  var config = {attributes: true,
  characterData: true,
  subtree: true,
  attributeOldValue: true,
  characterDataOldValue: true};
  //debugger;
  //var $eventSelect = $(".select2-hidden-accessible");
 // debugger;
 // $eventSelect.select2();
 // $eventSelect.on("change", function (e) { displayNameResult });

  var observables = document.getElementsByClassName('select2-selection__rendered');
  input_selector = document.getElementsByClassName('select2-selection__rendered');
  for(i = 0;i<input_selector.length;i++){
    observer.observe(input_selector[i], config);  
    //input_selector[i].setAttribute('onchange','gTriger()');
   //   input_selector[i].addEventListener('DOMCharacterDataModified', displayNameResult,false);    
    //debugger;
  }
});