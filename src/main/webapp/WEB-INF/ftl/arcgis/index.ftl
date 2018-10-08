<html>
<head>
  <meta charset="utf-8" />
		<title>${token.nickname} |人口地图</title>
		<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
		<link   rel="icon" href="${basePath}/favicon.ico" type="image/x-icon" />
		<link   rel="shortcut icon" href="${basePath}/favicon.ico" />
		<link href="${basePath}/js/common/bootstrap/3.3.5/css/bootstrap.min.css?${_v}" rel="stylesheet"/>
		<link href="${basePath}/css/common/base.css?${_v}" rel="stylesheet"/>
		<link href="${basePath}/leaflet/leaflet.css" rel="stylesheet"/>
		<script  src="${basePath}/leaflet/leaflet.js"></script>
		<script  src="${basePath}/leaflet/leaflet-wfst.js"></script>
		<script  src="${basePath}/js/common/jquery/jquery1.8.3.min.js"></script>
		<script  src="${basePath}/js/common/layer/layer.js"></script>
		<script  src="${basePath}/js/common/bootstrap/3.3.5/js/bootstrap.min.js"></script>
		 <script src="https://unpkg.com/esri-leaflet@2.2.3/dist/esri-leaflet.js"
    integrity="sha512-YZ6b5bXRVwipfqul5krehD9qlbJzc6KOGXYsDjU9HHXW2gK57xmWl2gU6nAegiErAqFXhygKIsWPKbjLPXVb2g=="
    crossorigin=""></script>
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
 var map = L.map("map").setView([38, 120.23], 10);

  L.esri.tiledMapLayer({
    url: "http://cache1.arcgisonline.cn/arcgis/rest/services/ChinaOnlineStreetPurplishBlue/MapServer"
  }).addTo(map);
  
  var boundaries = new L.WFS({
    url: 'http://localhost:8089/geoserver/ows',
    typeNS: 'Test',
    typeName: 'd_building',
    crs: L.CRS.EPSG3857,
    geometryField: 'the_geom',
    style: {
      weight: 3,
      lineCap:'round',
      dashOffset:2,
      dashArray:3,
      fillOpacity:0.1,
      fillColor: '#dc131321',
    }
  }, new L.Format.GeoJSON({crs: L.CRS.EPSG4326})).addTo(map);
  
  boundaries.bindPopup("I am a circle.");
  </script>

</body>
</html>