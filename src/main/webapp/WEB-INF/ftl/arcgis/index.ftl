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
		<link rel="stylesheet" href="https://js.arcgis.com/4.8/esri/themes/dark/main.css">

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
      height: 100%;
      width: 100%;
      overflow: hidden;
    }
  </style>

  <script>
    var dojoConfig = {
      has: {
        "esri-featurelayer-webgl": 1
      }
    };
  </script>
 <script>
    require([
      "esri/WebMap",
      "esri/views/MapView",
      "esri/widgets/LayerList",
      "dojo/domReady!"
    ], function(
      WebMap, MapView, LayerList
    ) {

      const map = new WebMap({
        portalItem: {
          id: "d5dda743788a4b0688fe48f43ae7beb9"
        }
      });

      // Add the map to a MapView
      const view = new MapView({
        container: "viewDiv",
        map: map
      });

      // Add a legend instance to the panel of a
      // ListItem in a LayerList instance
      const layerList = new LayerList({
        view: view,
        listItemCreatedFunction: function(event) {
          const item = event.item;
          item.panel = {
            content: "legend",
            open: true
          };
        }
      });
      view.ui.add(layerList, "top-right");

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