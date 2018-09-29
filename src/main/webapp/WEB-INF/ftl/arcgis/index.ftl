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
      height: 100%;
      width: 100%;
    }

    #controls {
      padding: 10px;
      background-color: rgba(255, 255, 255, 0.9);
    }

  </style>


   <script>
    require([
      "esri/WebScene",
      "esri/views/SceneView",
      "esri/layers/SceneLayer",
      "esri/widgets/Legend",
      "dojo/domReady!"
    ], function(WebScene, SceneView, SceneLayer, Legend) {

      var solidEdges = {
        type: "solid",
        color: [0, 0, 0, 0.6],
        size: 1
      };

      var sketchEdges = {
        type: "sketch",
        color: [0, 0, 0, 0.8],
        size: 1,
        extensionLength: 10
      };

      // Create the renderer and configure visual variables
      var renderer = {
        type: "simple", // autocasts as new SimpleRenderer()
        symbol: {
          type: "mesh-3d",
          symbolLayers: [{
            type: "fill",
            material: {
              color: "#ffffff",
              colorMixMode: "replace"
            },
            edges: solidEdges
          }]
        },
        visualVariables: [{
          // specifies a visual variable of continuous color
          type: "color",
          // based on a field indicating the walking time to public transport
          field: "walkTimeToStopsInService",
          legendOptions: {
            title: "Walking time to public transport"
          },
          // color ramp from white to blue
          // based on the walking time to public transport.
          // Buildings will be assigned a color proportional
          // to the min and max colors specified below
          stops: [{
              value: 1,
              color: "#2887a1",
              label: "less than 1 minute"
            },
            {
              value: 15,
              color: "#ffffff",
              label: "more than 15 minutes"
            }
          ]
        }]
      };

      var sceneLayer = new SceneLayer({
        portalItem: {
          id: "f5c497819a374941b0ce8d9b0e979819"
        },
        title: "San Francisco buildings",
        renderer: renderer // Set the renderer to sceneLayer
      });

      var webscene = new WebScene({
        portalItem: {
          id: "12d629fc946845628011f17a963373a9"
        },
        layers: [ sceneLayer ]
      });

      var view = new SceneView({
        container: "viewDiv",
        map: webscene
      });

      var legend = new Legend({
        view: view
      });
      view.ui.add(legend, "bottom-right");

      // Add a toggle button for the edges

      document.getElementById("controls").addEventListener("click", function(event) {
        var edges;

        if (event.target.id === "sketchEdges") {
          edges = sketchEdges;
        }
        else if (event.target.id === "solidEdges") {
          edges = solidEdges;
        }
        else if (event.target.id === "noEdges") {
          edges = null;
        }
        if (event.target.checked) {
          var renderer = sceneLayer.renderer.clone();
          renderer.symbol.symbolLayers.getItemAt(0).edges = edges;
          sceneLayer.renderer = renderer;
        }
      });

      view.ui.add(document.getElementById("controls"), "top-right");
    });

  </script>


	</head>
	<body data-target="#one" data-spy="scroll">
		<@_top.top 1/>
		<div class="container" id="viewDiv"  style="padding-bottom: 15px;min-height: 300px; margin-top: 40px">
			<#--/row-->
		</div>
		<div id="controls">
    <input type="radio" id="solidEdges" name="edges" checked> <label for="solidEdges">Solid
      edges</label>
    <input type="radio" id="sketchEdges" name="edges"> <label for="sketchEdges">Sketch
      edges</label>
    <input type="radio" id="noEdges" name="edges"><label for="noEdges">No edges</label>
  </div>

			
	</body>
</html>