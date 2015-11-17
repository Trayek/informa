function createCookie(name, value, days) {
    if (days) {
        var date = new Date();
        date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
        var expires = "; expires=" + date.toGMTString();
    }
    else var expires = "";
    document.cookie = name + "=" + value + expires + "; path=/";
}

function readCookie(name) {
    var nameEQ = name + "=";
    var ca = document.cookie.split(';');
    for (var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') c = c.substring(1, c.length);
        if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length, c.length);
    }
    return null;
}
function setCurrency(isbn, currencyValue) {
    createCookie('currency', currencyValue, 10);
    showPrices(isbn);
}
function showPrices(isbn) {
    var priceCookieValue = readCookie('currency');
    $.getJSON("//informa.services/api/pricing/getPrices?isbn=" + isbn + "&currency="+priceCookieValue, function (data) {
        var div = $('#priceDiv');
        div.empty();
        div.append("<span>Cost: " + data.Currency + Number(data.Value).toFixed(2) + "</span>  - show in: ");
        
        var pounds = priceCookieValue == null || priceCookieValue.length == 0;
        
        var currencyLink = jQuery('<a />', { text: pounds ? "$" : "£" });
        
        currencyLink.on("click", function() {
            setCurrency(isbn, pounds ? "$" : "");
        });
        div.append(currencyLink);
    });
}
