var CONTEXT = "/smw";

$(function() {

    $.ajax({
        url: CONTEXT + "/user/findUsers",
        type: "post",
        dataType: "json",
        async : false,
        success: function(rtnData) {
            console.log("rtnData: " + JSON.stringify(rtnData))
        }
    });

});

