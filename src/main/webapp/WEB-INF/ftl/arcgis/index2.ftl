<html>
<head>
  <meta charset="utf-8" />
		<title>${token.nickname} |人口地图</title>
		<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
		<link   rel="icon" href="${basePath}/favicon.ico" type="image/x-icon" />
		<link   rel="shortcut icon" href="${basePath}/favicon.ico" />
		<link href="${basePath}/js/common/bootstrap/3.3.5/css/bootstrap.min.css?${_v}" rel="stylesheet"/>
		<link href="${basePath}/css/common/base.css?${_v}" rel="stylesheet"/>
		<link href="${basePath}/ol/ol.css" rel="stylesheet"/>
		<script  src="${basePath}/ol/ol.js"></script>
		<script  src="${basePath}/js/common/jquery/jquery1.8.3.min.js"></script>
		<script  src="${basePath}/js/common/layer/layer.js"></script>
		<script  src="${basePath}/js/common/bootstrap/3.3.5/js/bootstrap.min.js"></script>
		 <style>
      .map {
        height: 100%;
        width: 100%;
      }
    </style>
</head>
<body>
<@_top.top 1/>
<div id="map" class="map"></div>

  <script>
    var vector = new ol.layer.Vector({
      source: new ol.source.Vector({
        format: new ol.format.GeoJSON(),
        url: 'http://localhost:8089/geoserver/wfs?service=wfs&version=1.1.0&request=GetFeature&typeNames=Test:d_building&outputFormat=application/json&srsname=EPSG:4326'
      }),
      style: function(feature, resolution) {
        return new ol.style.Style({
          stroke: new ol.style.Stroke({
            color: 'red',
            width: 3
          }),
           fill: new  ol.style.Fill({
            color: 'rgba(0, 0, 255, 0.5)'
          })
        });
      }
    });

    var map = new ol.Map({
      layers: [new ol.layer.Tile({
        source: new ol.source.OSM()
      }), vector],
      target: 'map',
      view: new ol.View({
        center: [120.19773, 36.06902],
        maxZoom: 19,
        zoom: 14,
        projection: 'EPSG:4326'
      })
    });
  </script>

</body>
</html>