$(document).ready(function () {//-------------
//- PIE CHART -
//-------------
// Get context with jQuery - using jQuery's .get() method.

    var ctx = $('#pieChart').get(0).getContext('2d');
    var PieData = [
        {
            value: 700,
            color: '#f56954',
            highlight: '#f56954',
            label: 'Chrome'
        },
        {
            value: 500,
            color: '#00a65a',
            highlight: '#00a65a',
            label: 'IE'
        },
        {
            value: 400,
            color: '#f39c12',
            highlight: '#f39c12',
            label: 'FireFox'
        },
        {
            value: 600,
            color: '#00c0ef',
            highlight: '#00c0ef',
            label: 'Safari'
        },
        {
            value: 300,
            color: '#3c8dbc',
            highlight: '#3c8dbc',
            label: 'Opera'
        },
        {
            value: 100,
            color: '#d2d6de',
            highlight: '#d2d6de',
            label: 'Navigator'
        }
    ];
    var pieOptions = {
        //Boolean - Whether we should show a stroke on each segment
        segmentShowStroke: true,
        //String - The colour of each segment stroke
        segmentStrokeColor: '#fff',
        //Number - The width of each segment stroke
        segmentStrokeWidth: 2,
        //Number - The percentage of the chart that we cut out of the middle
        percentageInnerCutout: 50, // This is 0 for Pie charts
        //Number - Amount of animation steps
        animationSteps: 100,
        //String - Animation easing effect
        animationEasing: 'easeOutBounce',
        //Boolean - Whether we animate the rotation of the Doughnut
        animateRotate: true,
        //Boolean - Whether we animate scaling the Doughnut from the centre
        animateScale: false,
        //Boolean - whether to make the chart responsive to window resizing
        responsive: true,
        // Boolean - whether to maintain the starting aspect ratio or not when responsive, if set to false, will take up entire container
        maintainAspectRatio: true
    };

    //Create pie or douhnut chart
    // For a pie chart
    $tags = JSON.parse($('#pieChart').attr('data-tags'));
    $tag1 = $tags[0][0];
    $tag2 = $tags[1][0];
    $tag3 = $tags[2][0];
    $tag4 = $tags[3][0];
    $tag5 = $tags[4][0];
    $uses_tag1 = $tags[0][1];
    $uses_tag2 = $tags[1][1];
    $uses_tag3 = $tags[2][1];
    $uses_tag4 = $tags[3][1];
    $uses_tag5 = $tags[4][1];
    console.log('tags: ', $tags);
    console.log('tags[0]: ', $tags[0][1]);
    var myPieChart = new Chart(ctx, {
        type: 'horizontalBar',
        data: {
            labels: [$tag1, $tag2, $tag3, $tag4, $tag5],
            datasets: [{
                label: '# de usos',
                data: [$uses_tag1, $uses_tag2, $uses_tag3, $uses_tag4, $uses_tag5],
                backgroundColor: [
                    'rgba(75, 192, 192, 0.3)',
                    'rgba(54, 162, 235, 0.3)',
                    'rgba(255, 206, 86, 0.3)',
                    'rgba(255, 99, 102, 0.3)',
                    'rgba(255, 30, 30, 0.3)'
                ],
                borderColor: [
                    'rgba(75, 192, 192, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(255,140,122,1)',
                    'rgba(255,40,122,1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                xAxes: [{
                    ticks: {
                        beginAtZero:true
                    }
                }]
            }
        }
    });
});