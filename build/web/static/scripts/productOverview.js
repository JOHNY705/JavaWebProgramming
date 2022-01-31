$(document).ready(function () {    
    $('.productContainer').click(function(){
        window.location.href = '/ComputerShop/product/' + $(this).data('id');
    });
});