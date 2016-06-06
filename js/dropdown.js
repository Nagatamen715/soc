
$(function () {
    //$('#initial_call_date').datetimepicker({
    //    format: 'L'
    //});

    //$('#initial_call_time').datetimepicker({
    //    format: 'LT'
    //});

    //$('#initial_call_client_dob').datetimepicker({
    //    format: 'L'
    //});

    //$('#second_call_time').datetimepicker({
    //    format: 'LT'
    //});

    //$('#third_call_time').datetimepicker({
    //    format: 'LT'
    //});

    //$('#time_staff_left_scene').datetimepicker({
    //    format: 'LT'
    //});

    //$('#time_incident_handed_off').datetimepicker({
    //    format: 'LT'
    //});

    $('.soc_date').datetimepicker({
        format: 'L'
    });

    $('.soc_time').datetimepicker({
        format: 'LT'
    });

    $.get('soc_list.csv', function (data) {
        var selectList = data.split(/\r\n|\r|\n/);

        selectList.shift();
        selectList.unshift("N/A");

        // Remove last list item if it is empty
        if (!selectList[$(selectList).length - 1]) {
            selectList.pop();
        }

        for (var index = 0; index < $(selectList).length; index++) {
            selectList[index] = selectList[index].replace(",", ", ")
            $('.selectList').append('<option value="' + selectList[index] + '">' + selectList[index] + '</option>');
        }

    });

});
