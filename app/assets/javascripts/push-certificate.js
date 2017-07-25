$(document).on('ready page:load', function(event) {
  $("#push-filtered-form").on('submit',function(data){
    var form = this;
    if($("#select_state").val() == "" || $("#select_city").val() == "" || $("#select_universities").val() == ""){
      data.preventDefault();


      swal({
        text: 'Tem certeza que deseja enviar com um dos campos vazios?',
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Sim',
        cancelButtonText: 'Não',
        confirmButtonClass: 'btn btn-success',
        cancelButtonClass: 'btn btn-danger',
        buttonsStyling: false
      }).then(function () {
        form.submit();
      }, function (dismiss) {
        if (dismiss === 'cancel') {
        }
      })

    }
  })
});
