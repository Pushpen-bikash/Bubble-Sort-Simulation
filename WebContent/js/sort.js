function getSortedPage(data, type) {
    $.ajax({
        url: "sortsimulator",
        data: data,
        type: type,
        dataType: "html",
        async: false,
        success: function (response) {
            $('#main').html(response);
        },
        error: function (jqXhr, textStatus, errorMessage) { // error callback
            alert(textStatus);
            alert(errorMessage);
        }
    });
}

async function startSimulation() {
    var array = JSON.parse($("#arrayValue").val());
    var data = {
        array: array
    };
    var tmp;
    var iIndex;
    var jIndex;
    var count = 0;
    for (var i = 0; i < array.length - 1; i++) {
        iIndex = i;
        for (var j = i + 1; j < array.length; j++) {
            jIndex = j;
            if (array[i] > array[j]) {
                tmp = array[i];
                array[i] = array[j];
                array[j] = tmp;
            }
            await sleep(1000);
            if (j == array.length - 1) {
                iIndex = i + 1;
                jIndex = iIndex + 1;
            } else {
                jIndex = j + 1;
            }
            getSortedPage({array: JSON.stringify(array), i: iIndex, j: jIndex}, "POST")
        }
    }
}

function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}