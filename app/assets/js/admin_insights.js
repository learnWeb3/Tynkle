const drawPie = (elementId, data, headerTitle, serieName = "") =>
  Highcharts.chart(elementId, {
    chart: {
      plotBackgroundColor: null,
      plotBorderWidth: null,
      plotShadow: false,
      type: "pie",
      height: (9 / 16) * 100 + "%", // 16:9 ratio
    },
    title: {
      text: headerTitle,
    },
    tooltip: {
      pointFormat: "{series.name}: <b>{point.percentage:.1f}%</b>",
    },
    accessibility: {
      point: {
        valueSuffix: "%",
      },
    },
    plotOptions: {
      pie: {
        allowPointSelect: true,
        cursor: "pointer",
        dataLabels: {
          enabled: true,
          format: "<b>{point.name}</b>: {point.percentage:.1f} %",
        },
      },
    },
    series: [
      {
        name: serieName,
        colorByPoint: true,
        data,
      },
    ],
  });

const drawLine = (elementId, data, headerTitle, yLabel, xLabel) =>
  Highcharts.chart(elementId, {
    chart: {
      type: "area",
      height: (9 / 16) * 100 + "%", // 16:9 ratio
    },
    title: {
      text: headerTitle,
    },
    xAxis: {
      categories: data.data.keys,
      title: {
        text: xLabel,
      },
    },
    yAxis: {
      title: {
        text: yLabel,
      },
    },

    plotOptions: {
      series: {
        fillOpacity: 0.1,
      },
    },

    series: [
      {
        name: data.name,
        data: data.data.values,
      },
    ],
  });

const drawSunBurst = (elementId, data, headerTitle) =>

  {
    return Highcharts.chart(elementId, {
    chart: {
      height: (9 / 16) * 100 + "%", // 16:9 ratio
    },

    title: {
      text: headerTitle,
    },
    series: [
      {
        type: "sunburst",
        data,
        allowDrillToNode: true,
        cursor: "pointer",
        dataLabels: {
          format: "{point.name}",
          filter: {
            property: "innerArcLength",
            operator: ">",
            value: 16,
          },
          rotationMode: "circular",
        },
        levels: [
          {
            level: 1,
            levelIsConstant: false,
            dataLabels: {
              filter: {
                property: "outerArcLength",
                operator: ">",
                value: 64,
              },
            },
          },
          {
            level: 2,
            colorByPoint: true,
          },
          {
            level: 3,
            colorVariation: {
              key: "brightness",
              to: -0.5,
            },
          },
          {
            level: 4,
            colorVariation: {
              key: "brightness",
              to: 0.5,
            },
          },
        ],
      },
    ],
    tooltip: {
      headerFormat: "",
      pointFormat:
        "Le nombre de posts de <b>{point.name}</b> est <b>{point.value}</b>",
    },
  });}
