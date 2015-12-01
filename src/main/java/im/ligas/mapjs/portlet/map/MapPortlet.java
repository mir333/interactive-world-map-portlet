/**
 * Copyright (c) 2015 Miroslav Ligas All rights reserved.
 * <p/>
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 * <p/>
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */
package im.ligas.mapjs.portlet.map;

import im.ligas.util.bridges.mvc.MVCPortlet;

import javax.portlet.RenderRequest;
import java.util.Map;

/**
 * @author Miroslav Ligas
 */
public class MapPortlet extends MVCPortlet {

	@Override
	public void setModel(Map<String, Object> model, RenderRequest request) {
		world(model, request);
	}

	public void world(Map<String, Object> model, RenderRequest request) {
		model.put("projectionSettings", "{center:[0, 0],rotate:[0, 0],scale:130}");
	}

	public void europe(Map<String, Object> model, RenderRequest request) {
		model.put("projectionSettings", "{center:[15, 50],rotate:[0, 0],scale:600}");

	}
}
