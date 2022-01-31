$(document).ready(function () {
    
    $("#productQty").change(function() {
        var qty = parseInt($('#productQty').val());
        if (qty < 2) {
            $('#buttonDecr').addClass('qtyActionDisabled');
        } else {
            $('#buttonDecr').removeClass('qtyActionDisabled');
        }
    });
    
    $("#productQty").blur(function(){
        if(!$(this).val()) {
            $('#productQty').val(1);
        }
    });
    
    $('#buttonDecr').click(function(){
        var qty = parseInt($('#productQty').val());
        if (!isNaN(qty) && qty > 1) {
            $('#productQty').val(--qty).change();
        }
    });
    
    $('#buttonIncr').click(function(){
        var qty = parseInt($('#productQty').val());
        
        if (!isNaN(qty)) {
            $('#productQty').val(++qty).change();  
        }
    });
    
    $("#addToCartForm").submit(function(e) {
        e.preventDefault();

        var form = $(this);

        $.ajax({
               type: form.attr('method'),
               url: form.attr('action'),
               data: form.serialize(),
               success: function(qty)
               {
                   $('#cartItemsNumber').html(qty);
                   $('#productQty').val(1).change();
                   $('.addMessage').removeClass('hidden');
                   setTimeout(function() {
                       $('.addMessage').addClass('hidden');
                   }, 10000);
               }      
        });
    });
    
    $(".closeIcon").click(function() {
        $('.addMessage').addClass('hidden');
    });
    
});

