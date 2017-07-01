$(document).ready(function() {
  $("select[name='filtro_categorias']").on('change', function() {
    var selected = $(this).val();
    if ( selected != '0' ) {
      window.location.href = "/categories/" + selected;
    }else {
      window.location.href = "/items";
    }
  })
});
