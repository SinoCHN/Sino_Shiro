<!DOCTYPE html>
<html lang="zh-cn">
	<head>
		<meta charset="utf-8" />
		<title>${token.nickname} |ArcGIS 3D Map</title>
		<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
		<link   rel="icon" href="${basePath}/favicon.ico" type="image/x-icon" />
		<link   rel="shortcut icon" href="${basePath}/favicon.ico" />
		<link href="${basePath}/js/common/bootstrap/3.3.5/css/bootstrap.min.css?${_v}" rel="stylesheet"/>
		<link href="${basePath}/css/common/base.css?${_v}" rel="stylesheet"/>
		<link rel="stylesheet" href="https://js.arcgis.com/4.8/esri/css/main.css">
		<script  src="${basePath}/js/common/jquery/jquery1.8.3.min.js"></script>
		<script  src="${basePath}/js/common/layer/layer.js"></script>
		<script  src="${basePath}/js/common/bootstrap/3.3.5/js/bootstrap.min.js"></script>
 		 <script src="https://js.arcgis.com/4.8/"></script>
		 <style>
		    html,
		    body,
		    #viewDiv {
		      padding: 0;
		      margin: 0;
		      height: 99%;
		      width: 100%;
		    }
		  </style>
		 <script>
		    require([
		      "esri/Map",
		      "esri/views/SceneView",
		      "dojo/domReady!"
		    ], function(Map, SceneView) {
		
		      var map = new Map({
		       basemap: "hybrid",
		        ground: "world-elevation"
		      });
		
		      var view = new SceneView({
		        container: "viewDiv",
		        map: map,
		        scale: 50000000,
		        center: [103.17, 36.78]
		      });
		
		    });
		  </script>

	</head>
	<body data-target="#one" data-spy="scroll">
		<@_top.top 1/>
		<div class="container" id="viewDiv"  style="padding-bottom: 15px;min-height: 300px; margin-top: 40px">
			<#--/row-->
		</div>
			
	</body>
</html>