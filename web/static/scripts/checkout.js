$(document).ready(function () {
    
    paypal.Buttons({
        createOrder: function (data, actions) {
            
            var totalPrice = ((parseFloat($('#totalCartPrice').val()))/7.54).toFixed(2);
            console.log(totalPrice);
            
            return actions.order.create({  
                purchase_units: [{
                        amount: {
                            currency_code: "EUR",
                            value: totalPrice
                        }
                    }]
            });
        },
        onApprove: function(data, actions) {
            return actions.order.capture().then(function(details) {
                $('#btnConfirmOrder').removeClass('btnDisabled');
            });
        }
    }).render('#paypal-button-container');
    
    $('.sectionHeaderIcon').click(function() {
        
        var section = $(this).closest('.sectionContent');
        
        if (!(section.hasClass('sectionDisabled'))) {
            if (section.hasClass('sectionOpen')) {
                section.removeClass('sectionOpen');
                section.addClass('sectionClosed');
                $(this).html('keyboard_arrow_right');
            } else {
                section.removeClass('sectionClosed');
                section.addClass('sectionOpen');
                $(this).html('keyboard_arrow_down');
            }
        }
        
    });
    
    $('#buyerDataForm').submit(function(e) {
        e.preventDefault();

        var form = $(this);

        $.ajax({
               type: form.attr('method'),
               url: form.attr('action'),
               data: form.serialize(),
               success: function(success)
               {  
                   if (success === 'true') {
                       $('#buyerSection').removeClass('sectionOpen');
                       $('#buyerSection').addClass('sectionClosed');
                       $('#buyerSection .sectionHeaderIcon').html('keyboard_arrow_right');
                       
                       $('#paymentSection').removeClass('sectionDisabled');
                       $('#paymentSection').removeClass('sectionClosed');
                       $('#paymentSection').addClass('sectionOpen');
                       $('#paymentSection .sectionHeaderIcon').html('keyboard_arrow_down');
                   }
               }      
        });
    });
    
    $('input:radio[name="paymentMethod"]').change(function() {
        if ($(this).val() === 'paypal') {
            $('#paypal-button-container').removeClass('d-none');
            $('#btnConfirmOrder').addClass('btnDisabled');
        } else {
            $('#btnConfirmOrder').removeClass('btnDisabled');
            $('#paypal-button-container').addClass('d-none');
        }
    });
    
});