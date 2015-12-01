<%--
/**
 * Copyright (c) 2015 Miroslav Ligas All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */
--%>

<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>

<portlet:defineObjects />

<div  class="btn-toolbar pagination-centered">
	<portlet:renderURL var="worldURL">
		<portlet:param name="setModel" value="world"/>
	</portlet:renderURL>
	<a class="btn" href="${worldURL}">World</a>

	<portlet:renderURL var="europeURL">
		<portlet:param name="setModel" value="europe"/>
	</portlet:renderURL>
	<a class="btn" href="${europeURL}">Europe</a>
</div>

<div id="container"></div>
<script>
	AUI().ready('node',function(A){
		var oldId;

		var projectionSettings = ${projectionSettings};

		var map = new Datamap({
			setProjection: function(element) {
				var projection = d3.geo.equirectangular()
						.center(projectionSettings.center)
						.rotate(projectionSettings.rotate)
						.scale(projectionSettings.scale)
						.translate([element.offsetWidth / 2, element.offsetHeight / 2]);
				var path = d3.geo.path()
						.projection(projection);

				return {path: path, projection: projection};
			},
			element: document.getElementById('container'),
			responsive: true,
			done: function(datamap) {
				datamap.svg.selectAll('.datamaps-subunit').on('click', function(geography) {
					console.log(geography.id);

					var opts = {};
					if(oldId){
//						opts[oldId]='rgb(171, 221, 164)'
						opts[oldId]='green'
					}
					opts[geography.id]='#0fa0fa';
					oldId = geography.id;
					map.updateChoropleth(opts);


					A.one(document).fire("mapEvent:countrySelect",geography.id);
				});
			}
		});

		window.addEventListener('resize', function() {
			map.resize();
		});
		window.map = map;
	});
</script>