$(document).ready(function() {


	
});


Drupal.jsAC.prototype.populatePopup = function () {
  // Show popup
  if (this.popup) {
    $(this.popup).remove();
  }
  this.selected = false;
  this.popup = document.createElement('div');
  this.popup.id = 'autocomplete';
  this.popup.owner = this;
  var inputPosition = $(this.input).position();
  var inputWrapperPosition = $('div#'+$(this.input).attr('id')+'-wrapper').position();
  $(this.popup).css({
    marginTop: this.input.offsetHeight +'px',
    marginLeft: (inputPosition.left-inputWrapperPosition.left)+'px',
    width: (this.input.offsetWidth - 4) +'px',
    display: 'none'
  });
  $(this.input).before(this.popup);

  // Do search
  this.db.owner = this;
  this.db.search(this.input.value);
};