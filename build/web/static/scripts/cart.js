$(document).ready(function () {
    
    var itemsTotal = parseInt($('#cartItemsNumber').html());
    
    if (itemsTotal === 0) {
        $('.tableContainer').hide();
        $('.cartEmptyContainer').show();
    } else {
        $('.tableContainer').show();
        $('.cartEmptyContainer').hide();
    }
});

$(document).ready(function () {
        
    function removeItem(pressedElement) {
        
        var row = pressedElement.closest('tr');
        var id = row.find('.tdItemID').val();
        
        $.ajax({
            type: "DELETE",
            url: "/ComputerShop/cart?method=single&id=" + id,
            success: function()
            {
                row.remove();
            }
        });
    }; 
    
    function updateItem(pressedElement, action) {
        var row = pressedElement.closest('tr');
        var selectedInput = row.find('.productQty');
        var qty = parseInt(selectedInput.val());        
        
        var id = row.find('.tdItemID').val();
        var itemsTotal = parseInt($('#cartItemsNumber').html());
        
        var priceString = row.find('.tdItemPrice').html();
        var singlePrice = parseFloat(priceString.substr(0, priceString.indexOf(' ')));
        
        var tdTotalPrice = row.find('.tdItemTotalPrice');
        var totalString = tdTotalPrice.html();
        var totalPrice = parseFloat(totalString.substr(0, totalString.indexOf(' ')));
        
        var cartTotal = parseFloat($('.totalPriceLabel').html().substr(0, $('.totalPriceLabel').html().indexOf(' ')));
        
        if (!isNaN(qty) && qty > 0) {
            $.ajax({
            type: "PUT",
            url: "/ComputerShop/cart?id=" + id + "&action=" + action,
            success: function()
            {
                if (action === "decr") {
                    $('#cartItemsNumber').html(--itemsTotal);
                    tdTotalPrice.html((totalPrice - singlePrice).toFixed(2) + " kn");
                    $('.totalPriceLabel').html((cartTotal - singlePrice).toFixed(2) + " kn");
                    selectedInput.val(--qty).change();
                } else if (action === "incr") {
                    $('#cartItemsNumber').html(++itemsTotal);
                    tdTotalPrice.html((totalPrice + singlePrice).toFixed(2) + " kn");
                    $('.totalPriceLabel').html((cartTotal + singlePrice).toFixed(2) + " kn");
                    selectedInput.val(++qty).change();
                }
            }
        });           
            
        }
    };    
    
    $(".productQty").change(function() {
        var qty = parseInt($(this).val());       
        
        if (qty === 0) {
            removeItem($(this));
            
            var itemsTotal = parseInt($('#cartItemsNumber').html());
            console.log(itemsTotal);
            if (itemsTotal === 0) {
                $('.tableContainer').hide();
                $('.cartEmptyContainer').show();
            }
        }
    });
    
    $(".productQty").blur(function() {
        if(!$(this).val()) {
            $(this).val(1);
        }
    });
    
    $('.buttonDecr').click(function() {
        updateItem($(this), "decr");
    });
    
    $('.buttonIncr').click(function() {
        updateItem($(this), "incr");
    });
    
    $('.removeIcon').click(function() {
        removeItem($(this));
    });
    
    $('.btnClearCart').click(function() {        
        $.ajax({
            type: "DELETE",
            url: "/ComputerShop/cart?method=all",
            success: function()
            {
                $(".table > tbody").empty();
                $('#cartItemsNumber').html(0);
                $('.totalPriceLabel').html("0.00 kn");
                $('.tableContainer').hide();
                $('.cartEmptyContainer').show();
            }
        });
    });
    
    $('.btnBuy').click(function(){
        window.location.href='/ComputerShop/checkout';
    });
    
});


