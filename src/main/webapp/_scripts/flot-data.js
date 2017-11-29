//Flot Pie Chart
$(function() {

    var data = [{
        label: "케어승객",
        data: 10
    }, {
        label: "소아",
        data: 20
    }, {
        label: "유아",
        data: 10
    }, {
        label: "성인",
        data: 60
    }];

    var plotObj = $.plot($("#flot-pie-chart"), data, {
        series: {
            pie: {
                show: true
            }
        },
        grid: {
            hoverable: true
        },
        tooltip: true,
        tooltipOpts: {
            content: "%p.0%, %s", // show percentages, rounding to 2 decimal places
            shifts: {
                x: 20,
                y: 0
            },
            defaultTheme: false
        }
    });

});

//Flot Bar Chart

$(function() {

    var barOptions = {
        series: {
            bars: {
                show: true,
                barWidth: 1000
            }
        },
        xaxis: {
            mode: "day",
            timeformat: "%d"
        },
        grid: {
            hoverable: true
        },
        legend: {
            show: false
        },
        tooltip: true,
        tooltipOpts: {
            content: "x: %x, y: %y"
        }
    };
    var barData = {
        label: "bar",
        data: [
            [1000, 100],
            [2000, 200],
            [3000, 200],
            [4000, 200],
            [5000, 300]
        ]
    };
    $.plot($("#flot-bar-chart"), [barData], barOptions);

});
